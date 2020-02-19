//
//  CreateViewController.swift
//  FirebaseLogin
//
//  Created by Biron Su on 2/15/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class CreateViewController: UIViewController {

    private let createView = CreateView()
    
    private lazy var imagePickerController: UIImagePickerController = {
        let ip = UIImagePickerController()
        ip.delegate = self
        return ip
    }()
    private var profileImage: UIImage?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(createView)
        createView.cancelButton.addTarget(self, action: #selector(cancelButton), for: .touchUpInside)
        createView.uploadImageButton.addTarget(self, action: #selector(imageButtonPressed), for: .touchUpInside)
        createView.createButton.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
    }

    // Create button, creates the account for Firebase
    @objc func createAccount(){
        validateFields()
    }
    // Validate every textfield before creating account
    // NEED TO ADD THE FOLLOWING FOR VALIDATION (FUTURE)
    // - MIN/MAX LENGTH OF USERNAME
    // - MIN/MAX LENGTH OF PASSWORD
    // - PASSWORD MUST NOT CONTAIN SPACE? MUST CONTAIN NUMBER/SPECIAL CHARACTER?
    // - CONFIRMTF MUST == PASSWORDTF
    // - EMAIL MUST BE VALID
    // - USERNAME AND EMAIL MUST NOT ALREADY EXIST IN FIREBASE
    func validateFields() {
        var alertTitle = "Account Created!"
        var alertMessage = ""
        if createView.usernameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            createView.emailTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            createView.confirmTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            createView.passwordTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            alertMessage = "Please fill all empty fields"
        } else {
            alertMessage = "Account created!"
            
            Auth.auth().createUser(withEmail: "", password: "") { (result, error) in
                // Checking for Errors
                if let error = error {
                    alertTitle = "Error creating user.(59)"
                    alertMessage = "\(error.localizedDescription)"
                } else {
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: [
                        "username":self.createView.usernameTF.text!,
                        "password":self.createView.confirmTF.text!,
                        "email":self.createView.emailTF.text!,
                        "uid":result!.user.uid
                    ]) { (error) in
                        if let error = error {
                            alertTitle = "Error creating user.(70)"
                            alertMessage = "\(error.localizedDescription)"
                        }
                    }
                }
            }
        }
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    // Cancel button, goes back to login view
    @objc func cancelButton() {
        dismiss(animated: true)
    }
    // Image Picker to select images from camera or library
    @objc private func imageButtonPressed() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let libraryAction = UIAlertAction(title: "Library", style: .default) { [unowned self] (action) in
            
            self.imagePickerController.sourceType = .photoLibrary
            self.present(self.imagePickerController, animated: true)
        }
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { [unowned self] (action) in
            
            self.imagePickerController.sourceType = .camera
            self.present(self.imagePickerController, animated: true)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(libraryAction)
        alertController.addAction(cameraAction)
        alertController.addAction(cancelAction)
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            cameraAction.isEnabled = false
        }
        present(alertController, animated: true)
    }
}

extension CreateViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            print("original image is nil")
            return
        }
        self.createView.profileImageHolder.setImage(originalImage, for: .normal)
        dismiss(animated: true)
    }
}
