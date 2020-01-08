//
//  NetworkManager.swift
//  GitViewer
//
//  Created by Khalid Rahman on 08/01/2020.
//  Copyright © 2020 Khalid Rahman. All rights reserved.
//

import Foundation
 
class NetworkManager {
    
    static let shared       = NetworkManager()
    let baseUrl             = "https://api.github.com/users/"
    
    private init() { }
    
    func getFollowers(for userName: String, page: Int, completed: @escaping(Result<[Follower], GFError>) -> Void) {
        let endpoint = baseUrl + "\(userName)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
                return
            } catch {
                completed(.failure(.invalidResponse))
                return
            }
        }
        
        task.resume()
    }
    
}
