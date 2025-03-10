//
//  ExpenseViewModel.swift
//  Week1_Assignment
//
//  Created by Rayaheen Mseri on 08/09/1446 AH.
//

import SwiftUI
import Combine
class ExpenseViewModel: ObservableObject {
    
        @Published var expenses: [Expense] = [
            Expense(name: "Pizza", amount: 20, category: .Food),
            Expense(name: "Uber Ride", amount: 15, category: .Transportation),
            Expense(name: "T-shirt", amount: 25, category: .Clothing),
            Expense(name: "Movie Tickets", amount: 30, category: .Entertainment),
            Expense(name: "Electric Bill", amount: 50, category: .Utilities)
        ]
    
        private let userDefaultsKey = "expenses"
        
    // Save expenses to UserDefaults
        func saveExpenses() {
            if let encodedData = try?   JSONEncoder().encode(expenses) {
                UserDefaults.standard.set(encodedData, forKey: userDefaultsKey)
            }
        }
    
    // add expense to expenses list
        func addExpense(expense: Expense) {
            expenses.append(expense)
            saveExpenses()
        }
    
    // sort list based on amount desc/asc
        func sortExpenses(by amountDescending: Bool) {
            if amountDescending {
                expenses.sort { $0.amount > $1.amount }
            } else {
            expenses.sort { $0.amount < $1.amount }
            }
        
    }
// add currency
        func formattedCurrency(_ amount: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencyCode = "USD"
        return numberFormatter.string(from: NSNumber(value: amount)) ?? ""
    }


}


