//
//  CreateViewController.swift
//  FirebaseLogin
//
//  Created by Biron Su on 2/15/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

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
    }

    @objc func cancelButton() {
        dismiss(animated: true)
    }
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
