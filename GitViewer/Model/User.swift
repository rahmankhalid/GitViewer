//
//  User.swift
//  GitViewer
//
//  Created by Khalid Rahman on 01/01/2020.
//  Copyright © 2020 Khalid Rahman. All rights reserved.
//

import Foundation

struct User: Codable {
    
    var login       : String
    var avatarUrl   : String
    var name        : String?
    var location    : String?
    var bio         : String?
    var publicRepos : Int
    var publicGists : Int
    var followers   : Int
    var htmlUrl     : String
    var following   : Int
    var createdAt   : String
    
}
