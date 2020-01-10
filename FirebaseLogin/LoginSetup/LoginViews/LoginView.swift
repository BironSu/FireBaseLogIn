//
//  LoginView.swift
//  FirebaseLogin
//
//  Created by Biron Su on 1/8/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class LoginView: UIView {

    lazy var logoImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "LogoPlaceholder"))
        return image
    }()
    
    lazy var loginTF: UITextField = {
        let textField = UITextField()
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        textField.placeholder = "Username"
        textField.layer.cornerRadius = 10.0
        textField.backgroundColor = .white
        return textField
    }()
    
    lazy var passwordTextView: UITextField = {
        let textField = UITextField()
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        textField.placeholder = "Password"
        textField.layer.cornerRadius = 10.0
        textField.backgroundColor = .white
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Login ", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor( .black, for: .normal)
        button.layer.cornerRadius = 10.0
        return button
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle(" SignUp ", for: .normal)
        button.layer.cornerRadius = 10.0
        button.backgroundColor = .white
        button.setTitleColor( .black, for: .normal)
        return button
    }()
    
    lazy var forgotPassword: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot Password?", for: .normal)
        button.layer.cornerRadius = 10.0
        button.backgroundColor?.withAlphaComponent(0.2)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setupView()
        self.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LoginView {
    private func setupView() {
        loginLogoImage()
        setupLoginTF()
        setupPasswordTF()
        setupLoginButton()
        setupSignUpButton()
        setupForgotPassButton()
    }
    func loginLogoImage(){
        addSubview(logoImage)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            logoImage.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: -150),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    func setupLoginTF(){
        addSubview(loginTF)
        loginTF.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginTF.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            loginTF.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: 100),
            loginTF.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            loginTF.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            loginTF.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    func setupPasswordTF(){
        addSubview(passwordTextView)
        passwordTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextView.topAnchor.constraint(equalTo: loginTF.bottomAnchor, constant: 10),
            passwordTextView.leadingAnchor.constraint(equalTo: loginTF.leadingAnchor),
            passwordTextView.trailingAnchor.constraint(equalTo: loginTF.trailingAnchor),
            passwordTextView.heightAnchor.constraint(equalTo: loginTF.heightAnchor)
        ])
    }
    func setupLoginButton(){
        addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextView.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: passwordTextView.centerXAnchor, constant: -50),
//            loginButton.widthAnchor.constraint(equalToConstant: 75)
        ])
    }
    func setupSignUpButton(){
        addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: passwordTextView.bottomAnchor, constant: 20),
            signUpButton.centerXAnchor.constraint(equalTo: passwordTextView.centerXAnchor, constant: 50),
//            signUpButton.widthAnchor.constraint(equalToConstant: 75)
        ])
    }
    func setupForgotPassButton(){
        addSubview(forgotPassword)
        forgotPassword.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            forgotPassword.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            forgotPassword.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 0)
        ])
    }
}
