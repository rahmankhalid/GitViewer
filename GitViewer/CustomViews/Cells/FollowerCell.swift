//
//  FollowerCell.swift
//  GitViewer
//
//  Created by Khalid Rahman on 09/01/2020.
//  Copyright © 2020 Khalid Rahman. All rights reserved.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    let avatarImageView     = GFAvatarImageView(frame: .zero)
    let userNameLbl         = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
    static let reuseID      = String(describing: FollowerCell.self)
    
    let padding             : CGFloat = 8
    let labelHeight         : CGFloat = 20
    let imageBottomPadding  : CGFloat = 12
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower: Follower) {
        userNameLbl.text = follower.login
    }
    
    private func configure() {
        addAvatarImageView()
        addUserNameLbl()
    }
    
    private func addAvatarImageView() {
        addSubview(avatarImageView)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor)
        ])
    }
    
    private func addUserNameLbl() {
        addSubview(userNameLbl)
        
        NSLayoutConstraint.activate([
            userNameLbl.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: imageBottomPadding),
            userNameLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            userNameLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            userNameLbl.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
    }
    
}
