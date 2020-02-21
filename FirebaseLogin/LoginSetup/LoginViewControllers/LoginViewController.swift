//
//  LoginViewController.swift
//  FirebaseLogin
//
//  Created by Biron Su on 1/8/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    private let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginView)
        loginView.loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        loginView.signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        loginView.forgotPassword.addTarget(self, action: #selector(forgotPass), for: .touchUpInside)
    }
    
    @objc func login() {
        var alertMessage = "Edit Default Alert Message"
        // CHECK USER IF IT EXIST
        if self.loginView.loginTF.text!.count <= 3 {
            alertMessage = "Invalid Username"
            // CHECK IF PASSWORD IS THE SAME
        } else if self.loginView.passwordTF.text!.count <= 5 {
            alertMessage = "Password too short (Minimum 5 characters)"
        } else {
            //
        }
        let alertController = UIAlertController(title: alertMessage, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(okAction)
        present(alertController, animated: true)
        return
    }
    
    @objc func signUp() {
        present(CreateViewController(), animated: true)
    }
    
    @objc func forgotPass() {
        present(RetrieveViewController(),animated: true)
    }

}

