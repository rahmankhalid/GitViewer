//
//  FollowerListVC.swift
//  GitViewer
//
//  Created by Khalid Rahman on 01/01/2020.
//  Copyright © 2020 Khalid Rahman. All rights reserved.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemRed
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
