//
//  HomeViewController.swift
//  FirebaseLogin
//
//  Created by Biron Su on 1/10/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let homePage = HomePageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homePage)
    }

}
