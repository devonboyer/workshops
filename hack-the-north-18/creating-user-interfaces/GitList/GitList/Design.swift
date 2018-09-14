//
//  Design.swift
//  GitList
//
//  Created by Devon Boyer on 9/8/18.
//  Copyright © 2018 Devon Boyer. All rights reserved.
//

import UIKit

enum Icon {
    case stars
    case forks
    
    func image() -> UIImage? {
        switch self {
        case .stars:
            return UIImage(named: "stars-icon")
        case .forks:
            return UIImage(named: "forks-icon")
        }
    }
}

struct Colors {
    static let highlightedColor = UIColor(red: 3/255.0, green: 102/255.0, blue: 214/255.0, alpha: 1) // blue
    static let lightTextColor = UIColor(red: 88/255.0, green: 97/255.0, blue: 105/255.0, alpha: 1) // gray
}
