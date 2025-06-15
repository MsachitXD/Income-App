//
//  Currency.swift
//  Income App
//
//  Created by Sachit Mittal on 14/06/25.
//

import Foundation

enum Currency: Int, CaseIterable {
    case inr , pounds
    
    var title: String {
        switch self {
        case .inr:
            return "INR"
        case .pounds:
            return "Pounds"
        }
    }
    
    var locale : Locale{
        switch self{
        case .inr:
            return Locale(identifier: "en_IN")
        case .pounds:
            return Locale(identifier: "en_GB")
        }
    }
}
