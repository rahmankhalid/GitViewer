//
//  GFAlertVC.swift
//  GitViewer
//
//  Created by Khalid Rahman on 01/01/2020.
//  Copyright © 2020 Khalid Rahman. All rights reserved.
//

import UIKit

class GFAlertVC: UIViewController {
    
    let containerView   = UIView()
    let titleLabel      = GFTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel    = GFBodyLabel(textAlignment: .center)
    let actionBtn       = GFButton(backgroundColour: .systemPink, title: "OK")
    
    var alertTitle      : String?
    var message         : String?
    var btnTitle        : String?
    
    let padding         : CGFloat = 20
    let titleHeight     : CGFloat = 28
    let buttonHeight    : CGFloat = 44
    
    init(title: String, message: String, btnTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message    = message
        self.btnTitle   = btnTitle
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }
    
    func configureContainerView() {
        view.addSubview(containerView)
        containerView.backgroundColor       = .systemBackground
        containerView.layer.cornerRadius    = 16
        containerView.layer.borderWidth     = 2
        containerView.layer.borderColor     = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        
        titleLabel.text = alertTitle ?? "Error"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: titleHeight)
        ])
    }
    
    func configureActionButton() {
        containerView.addSubview(actionBtn)
        
        actionBtn.setTitle(btnTitle ?? "OK", for: .normal)
        actionBtn.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionBtn.heightAnchor.constraint(equalToConstant: buttonHeight)
        ])
    }
    
    @objc func dismissVC() {
        self.dismiss(animated: true)
    }
    
    func configureMessageLabel() {
        containerView.addSubview(messageLabel)
        
        messageLabel.text            = message ?? "Unable to complete request"
        messageLabel.numberOfLines   = 4
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionBtn.topAnchor, constant: -12)
        ])
    }

}
