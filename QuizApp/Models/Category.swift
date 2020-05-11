//
//  Category.swift
//  QuizApp
//
//  Created by Fran Grgić on 11/05/2020.
//  Copyright © 2020 Fran Grgic. All rights reserved.
//

import Foundation
import UIKit

enum Category {
    
    case sports
    case science
    
    var color: UIColor {
        switch self {
        case .sports:
            return UIColor(red: 48/255.0, green: 82/255.0, blue: 92/255.0, alpha: 1)
        case .science:
            return UIColor(red: 98/255.0, green: 161/255.0, blue: 115/255.0, alpha: 1)
        }
    }
    
    
    static func category(text: String) -> Category {
        switch text.uppercased() {
            case "SPORTS":
                return .sports
            default:
                return .science
        }
    }
    
    var text: String {
        switch self {
            case .sports:
                return "SPORTS"
            case .science:
                return "SCIENCE"
        }
    }
}
