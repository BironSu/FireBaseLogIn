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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(createView)
        createView.cancelButton.addTarget(self, action: #selector(cancelCreate), for: .touchUpInside)
    }

    @objc func cancelCreate() {
        
    }
}
