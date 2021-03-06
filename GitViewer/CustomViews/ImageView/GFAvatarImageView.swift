//
//  GFAvatarImageView.swift
//  GitViewer
//
//  Created by Khalid Rahman on 09/01/2020.
//  Copyright © 2020 Khalid Rahman. All rights reserved.
//

import UIKit

class GFAvatarImageView: UIImageView {
        
    let placeHolderImage        = UIImage(named: "avatar-placeholder")!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius      = 10
        clipsToBounds           = true
        image                   = placeHolderImage
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
