//
//  ErrorMessage.swift
//  GitViewer
//
//  Created by Khalid Rahman on 08/01/2020.
//  Copyright © 2020 Khalid Rahman. All rights reserved.
//

import Foundation

enum GFError: String, Error {
    
    case invalidUsername = "Username created an invalid request. Please try again"
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "There was a error with the server"
    case invalidData = "The data recieved from the server was invalid. Please try again"
    
    
}
