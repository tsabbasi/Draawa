//
//  Paint.swift
//  Draawa
//
//  Created by Tuba Abbasi on 11/18/18.
//

import Foundation
import UIKit

enum ColorPalette {
    case green
    case biege
    case red
    case yellow
    case black
    
    init?(tag: Int) {
        switch tag {
        case 1:
            self = .green
        case 2:
            self = .biege
        case 3:
            self = .red
        case 4:
            self = .yellow
        case 5:
            self = .black
        default:
            return nil
        }
    }
    
    var color: UIColor {
        switch self {
        case .green:
            return UIColor(red:0.60, green:0.80, blue:0.71, alpha:1.0)
        case .biege:
            return UIColor(red:1.00, green:0.93, blue:0.69, alpha:1.0)
        case .red:
            return UIColor(red:0.99, green:0.44, blue:0.42, alpha:1.0)
        case .yellow:
            return UIColor(red:1.00, green:0.80, blue:0.40, alpha:1.0)
        case .black:
            return UIColor(red:0.12, green:0.12, blue:0.12, alpha:1.0)
        }
    }

}
