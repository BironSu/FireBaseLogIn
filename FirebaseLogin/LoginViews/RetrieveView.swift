//
//  RetrieveView.swift
//  FirebaseLogin
//
//  Created by Biron Su on 1/8/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class RetrieveView: UIView {

    lazy var logoImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "LogoPlaceholder"))
        return imageView
    }()
    lazy var retrieveUserTF: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter Username"
        textfield.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        textfield.layer.cornerRadius = 10
        textfield.backgroundColor = .white
        return textfield
    }()
    lazy var retrieveButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Request Password ", for: .normal)
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
extension RetrieveView {
    private func setupView(){
        setupLogoHolder()
        setupRetrieveTF()
        setupOKButton()
    }
    private func setupLogoHolder() {
        
    }
    private func setupRetrieveTF(){
        
    }
    private func setupOKButton(){
        
    }
}
