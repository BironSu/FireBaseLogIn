//
//  LoginViewController.swift
//  FirebaseLogin
//
//  Created by Biron Su on 1/8/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    private let loginView = LoginView()
    private let createView = CreateView()
    private let retrieveView = RetrieveView()
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(loginView)
//        view.addSubview(createView)
        view.addSubview(retrieveView)
    }
    

}
