//
//  RetrieveViewController.swift
//  FirebaseLogin
//
//  Created by Biron Su on 2/15/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class RetrieveViewController: UIViewController {

    private let retrieveView = RetrieveView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(retrieveView)
        self.retrieveView.cancelButton.addTarget(self, action: #selector(cancelButton), for: .touchUpInside)
    }
    @objc func cancelButton(){
        dismiss(animated: true)
    }
}
