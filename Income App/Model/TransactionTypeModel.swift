//
//  TransactionTypeModel.swift
//  Income App
//
//  Created by Sachit Mittal on 12/06/25.
//


import Foundation

enum TransactionType: String, CaseIterable, Identifiable {
    case income, expense
    var id: Self { self }
    
    var title: String {
        switch self {
        case .income:
            return "Income"
        case .expense:
            return "Expense"
        }
    }
}
