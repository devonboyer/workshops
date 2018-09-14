//
//  GitHubRepo.swift
//  GitList
//
//  Created by Devon Boyer on 9/8/18.
//  Copyright © 2018 Devon Boyer. All rights reserved.
//

import Foundation

struct GitHubRepo: Decodable {
    
    let name: String?
    let description: String?
    let stargazersCount: Int?
    let forks: Int?
    let language: String?
    
}
