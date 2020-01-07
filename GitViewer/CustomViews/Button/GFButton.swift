//
//  GFButton.swift
//  GitViewer
//
//  Created by Khalid Rahman on 29/12/2019.
//  Copyright © 2019 Khalid Rahman. All rights reserved.
//

import UIKit

class GFButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColour: UIColor, title: String) {
        super.init(frame: .zero)
        
        self.backgroundColor                        = backgroundColor
        self.setTitle(title, for: .normal)
        
        configure()
    }
    
    private func configure() {
        layer.cornerRadius                          = 25
        titleLabel?.textColor                       = .white
        titleLabel?.font                            = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints   = false
    }
}
