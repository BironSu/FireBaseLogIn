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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(createView)
        createView.cancelButton.addTarget(self, action: #selector(cancelButton), for: .touchUpInside)
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
        let username = createView.usernameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = createView.emailTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = createView.passwordTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let confirmPass = createView.confirmTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if username == "" || email == "" || password == "" || confirmPass == "" {
            alertMessage = "Please fill all empty fields"
        } else {
            alertMessage = "Account created!"
            
            Auth.auth().createUser(withEmail: email!, password: password!) { (result, error) in
                // Checking for Errors
                if let error = error {
                    alertTitle = "Error creating user.(59)"
                    alertMessage = "\(error.localizedDescription)"
                } else {
                    let db = Firestore.firestore()
                    db.collection(UserCollectionKeys.CollectionKey).addDocument(data: [
                        UserCollectionKeys.DisplayNameKey : self.createView.usernameTF.text!
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
}
