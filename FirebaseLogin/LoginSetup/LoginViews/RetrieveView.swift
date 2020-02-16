//
//  RetrieveView.swift
//  FirebaseLogin
//
//  Created by Biron Su on 1/8/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class RetrieveView: UIView {

    lazy var retrieveLogoImage: UIImageView = {
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
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Cancel ", for: .normal)
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
        cancelCreateButton()
    }
    
    private func setupLogoHolder() {
        addSubview(retrieveLogoImage)
        retrieveLogoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            retrieveLogoImage.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            retrieveLogoImage.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: -150),
            retrieveLogoImage.heightAnchor.constraint(equalToConstant: 100),
            retrieveLogoImage.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    private func setupRetrieveTF(){
        addSubview(retrieveUserTF)
        retrieveUserTF.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            retrieveUserTF.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: 0),
            retrieveUserTF.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            retrieveUserTF.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            retrieveUserTF.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            retrieveUserTF.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    private func setupOKButton(){
        addSubview(retrieveButton)
        retrieveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            retrieveButton.topAnchor.constraint(equalTo: retrieveUserTF.bottomAnchor, constant: 30),
            retrieveButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 0)
        ])
    }
    private func cancelCreateButton(){
        addSubview(cancelButton)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: retrieveButton.bottomAnchor, constant: 20),
            cancelButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 0)
        ])
    }
}
