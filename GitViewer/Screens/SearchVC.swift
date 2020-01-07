//
//  SearchVC.swift
//  GitViewer
//
//  Created by Khalid Rahman on 29/12/2019.
//  Copyright © 2019 Khalid Rahman. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImgView             = UIImageView()
    let userNameTextField       = GFTextField()
    let callToActionBtn         = GFButton(backgroundColour: .systemGreen, title: "Get Followers")

    var isUsernameEntered       : Bool { return !userNameTextField.text!.isEmpty }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor    = .systemBackground
        
        configureLogoImageView()
        configureTextField()
        configureCallToActionBtn()
        createDismissKeyboardTapGesture()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK:- Helpers
    
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowerListVC() {
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username 😆", buttonTitle: "Ok")
            return
        }
        
        let followerListVC              = FollowerListVC()
        followerListVC.username         = userNameTextField.text
        followerListVC.title            = userNameTextField.text
        
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    
    // MARK:- View Configuation
    
    
    func configureLogoImageView() {
        view.addSubview(logoImgView)
        logoImgView.translatesAutoresizingMaskIntoConstraints = false
        logoImgView.image       = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
            logoImgView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImgView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImgView.widthAnchor.constraint(equalToConstant: 200),
            logoImgView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    

    func configureTextField() {
        view.addSubview(userNameTextField)
        
        userNameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: logoImgView.bottomAnchor, constant: 48),
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            userNameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureCallToActionBtn() {
        view.addSubview(callToActionBtn)
        
        callToActionBtn.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            callToActionBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension SearchVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
    
}
