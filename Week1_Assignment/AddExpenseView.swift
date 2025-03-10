//
//  AddExpenseView.swift
//  Week1_Assignment
//
//  Created by Rayaheen Mseri on 08/09/1446 AH.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: ExpenseViewModel
    @State var name : String = ""
    @State var amount : Int = 0
    @State var category : CategoryType = .Food
    @Binding var isDarkMode: Bool
    
    var body: some View {
        VStack {
            // Title for the Add Expense screen
            Text("Add Expense")
                .font(.headline)
                .font(.system(size: 50, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
            
            // Name input field
            Text("Name")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            TextField("Enter Name", text: $name)
                .padding()
                .background(Color.gray.opacity(0.2)) // Light gray background for better visibility
                .cornerRadius(5)
                .padding(.horizontal)
            
            // Amount input with a Stepper
            HStack {
                Text("Amount: ")
                Spacer()
                Text("\(viewModel.formattedCurrency(amount))") // Displays current amount
                Stepper("", value: $amount, in: 1...1000) // Allows incrementing/decrementing the amount
            }
            .foregroundColor(isDarkMode ? .white : .black)
            .padding()
            
            // Category selection using a Picker
            HStack {
                Text("Category: ")
                Spacer()
                Picker("Category", selection: $category) {
                    ForEach(CategoryType.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category) // Display category options
                    }
                }
                .accentColor(isDarkMode ? .white : .black)
                .pickerStyle(MenuPickerStyle())
                .padding(.horizontal)
            }
            .foregroundColor(isDarkMode ? .white : .black)
            .padding(.horizontal)
            
            // Add button to save the expense and dismiss the view
            Button("Add") {
                viewModel.addExpense(expense: Expense(name: name, amount: amount, category: category))
                dismiss() // Closes the view after adding the expense
            }
            .font(.headline)
            .foregroundColor(isDarkMode ? .black : .white)
            .frame(width: 200, height: 40)
            .background(isDarkMode ? .white : .black)
            .cornerRadius(10)
            .padding()
        }
        .padding()
    }
    
}
#Preview {
    AddExpenseView(viewModel: ExpenseViewModel(), isDarkMode: .constant(false))
}
