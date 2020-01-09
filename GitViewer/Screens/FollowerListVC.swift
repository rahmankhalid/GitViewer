//
//  FollowerListVC.swift
//  GitViewer
//
//  Created by Khalid Rahman on 01/01/2020.
//  Copyright © 2020 Khalid Rahman. All rights reserved.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username        : String!
    var collectionView  : UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemRed
        navigationController?.navigationBar.prefersLargeTitles = true
        
        configure()
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            
            switch result {
            case .success(let followers):
                print(followers)
            case .failure(let err):
                self.presentGFAlertOnMainThread(title: "Error", message: err.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configure() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        
    }

}
