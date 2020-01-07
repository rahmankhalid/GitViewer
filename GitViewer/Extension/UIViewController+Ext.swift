//
//  UIViewController+Ext.swift
//  GitViewer
//
//  Created by Khalid Rahman on 01/01/2020.
//  Copyright © 2020 Khalid Rahman. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC                     = GFAlertVC(title: title, message: message, btnTitle: buttonTitle)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
}
