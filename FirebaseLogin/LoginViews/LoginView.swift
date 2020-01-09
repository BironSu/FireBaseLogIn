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
    lazy var loginTextView: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.layer.cornerRadius = 10.0
        return textField
    }()
    lazy var passwordTextView: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.layer.cornerRadius = 10.0
        return textField
    }()
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 10.0
        return button
    }()
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("SignUp", for: .normal)
        button.layer.cornerRadius = 10.0
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
        setupLogoImageView()
        setupLoginTextField()
        setupLoginPasswordTextField()
        setupLoginButton()
        setupSignUpButton()
        setupForgotPasswordButton()
    }
    func setupLogoImageView(){
        addSubview(logoImage)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        ])
    }
    func setupLoginTextField(){
        addSubview(loginTextView)
        loginTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        ])
    }
    func setupLoginPasswordTextField(){
        addSubview(passwordTextView)
        passwordTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        ])
    }
    func setupLoginButton(){
        addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        ])
    }
    func setupSignUpButton(){
        addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        ])
    }
    func setupForgotPasswordButton(){
        addSubview(forgotPassword)
        forgotPassword.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        ])
    }
}
