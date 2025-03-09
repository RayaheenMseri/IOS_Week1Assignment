//
//  Expense.swift
//  Week1_Assignment
//
//  Created by Rayaheen Mseri on 08/09/1446 AH.
//

import SwiftUI

enum CategoryType: String, Identifiable , CaseIterable, Codable{
    case Food = "Food"
    case Transportation = "Transportation"
    case Clothing =  "Clothing"
    case Entertainment = "Entertainment"
    case Utilities = "Utilities"
    
    var id: String { self.rawValue }
}

class Expense: Identifiable, ObservableObject, Codable {
    var id: UUID = UUID()
    var name: String
    var amount: Int
    var category: CategoryType
    
    init(name: String, amount: Int, category: CategoryType) {
        self.name = name
        self.amount = amount
        self.category = category
    }
}
