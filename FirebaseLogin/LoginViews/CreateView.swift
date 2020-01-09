//
//  CreateView.swift
//  FirebaseLogin
//
//  Created by Biron Su on 1/8/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class CreateView: UIView {

    lazy var profileImageHolder: UIImageView = {
        let image = UIImageView(image: UIImage(named: "imagePlaceHolder"))
        return image
    }()
    
    lazy var uploadImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Upload Image", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var usernameTF: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter Display Name"
        textfield.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 10
        return textfield
    }()
    
    lazy var passwordTF: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter Password"
        textfield.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 10
        return textfield
    }()
    
    lazy var confirmTF: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Confirm Password"
        textfield.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 10
        return textfield
    }()
    
    lazy var emailTF: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter Email Address"
        textfield.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 10
        return textfield
    }()
    lazy var createButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Create Account ", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension CreateView {
    private func setupView(){
        createUserTextField()
        createPasswordTextField()
        confirmPasswordTextField()
        addEmailTextField()
        createAccountButton()
        createImageHolder()
        createUploadImage()
    }
    func createImageHolder(){
        
    }
    func createUploadImage(){
        
    }
    func createUserTextField(){
        addSubview(usernameTF)
        usernameTF.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameTF.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            usernameTF.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: -100),
            usernameTF.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            usernameTF.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            usernameTF.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    func createPasswordTextField(){
        addSubview(passwordTF)
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTF.topAnchor.constraint(equalTo: usernameTF.bottomAnchor, constant: 20),
            passwordTF.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            passwordTF.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            passwordTF.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    func confirmPasswordTextField(){
        addSubview(confirmTF)
        confirmTF.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            confirmTF.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 20),
            confirmTF.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            confirmTF.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            confirmTF.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    func addEmailTextField(){
        addSubview(emailTF)
        emailTF.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTF.topAnchor.constraint(equalTo: confirmTF.bottomAnchor, constant: 20),
            emailTF.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            emailTF.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            emailTF.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    func createAccountButton(){
        addSubview(createButton)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            createButton.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 20),
            createButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 0)
        ])
    }
}
