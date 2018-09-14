//
//  GitHubClient.swift
//  GitList
//
//  Created by Devon Boyer on 9/8/18.
//  Copyright © 2018 Devon Boyer. All rights reserved.
//

import Foundation
import Alamofire

class GitHubClient {
    
    let username: String
    
    let decoder: JSONDecoder
    
    init(username: String) {
        self.username = username
        
        self.decoder = JSONDecoder()
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func getRepos(completionHandler: @escaping (([GitHubRepo]) -> Void)) {
        // For more API documentation see https://developer.github.com/v3/repos/#list-your-repositories
        // Try typing https://api.github.com/users/devonboyer/repos in your browser to see the reponse in JSON!
        request("https://api.github.com/users/\(username)/repos")
            .responseJSON { response in
                do {
                    if let data = response.data { // optional binding
                        let repos = try self.decoder.decode([GitHubRepo].self, from: data)
                        completionHandler(repos)
                        return
                    }
                    completionHandler([])
                }
                catch {
                    print("error: ", error)
                    completionHandler([])
                }
        }
    }
}
