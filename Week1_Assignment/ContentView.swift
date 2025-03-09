//
//  ContentView.swift
//  Week1_Assignment
//
//  Created by Rayaheen Mseri on 08/09/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ExpenseViewModel() // ViewModel to manage expenses
    @State private var searchText: String = "" // Search bar text
    @State private var category: CategoryType = CategoryType.Clothing // Default category selection
    @State private var isDarkMode: Bool = false // Toggle for dark mode
    @State private var isSortingDescending: Bool = false // Toggle sorting order
    
    let categories = CategoryType.allCases // List of all categories
    
    var body: some View {
        NavigationStack {
            List {
                // Header row
                HStack {
                    Text("Name")
                        .font(.headline)
                        .frame(width: 90, alignment: .leading)
                    Spacer()
                    Text("Amount")
                        .font(.headline)
                        .frame(width: 80, alignment: .leading)
                    Spacer()
                    Text("Category")
                        .font(.headline)
                        .frame(width: 90, alignment: .leading)
                }
                .foregroundColor(isDarkMode ? .white : .black)
                
                // Display filtered expenses
                ForEach(searchResults) { expense in
                    HStack {
                        Text(expense.name)
                            .frame(width: 100, alignment: .leading)
                            .padding(.leading, 5)
                            .foregroundColor(isDarkMode ? .white : .black)
                        Text("\(expense.amount)")
                            .frame(width: 100, alignment: .center)
                            .foregroundColor(isDarkMode ? .white : .black)
                        Text("\(expense.category)")
                            .frame(width: 120, alignment: .center)
                            .foregroundColor(isDarkMode ? .white : .black)
                    }
                    .padding(.bottom, 5)
                }
            }
            .navigationTitle("Expense List") // Set navigation title
            .foregroundColor(isDarkMode ? .white : .black)
            .background(isDarkMode ? Color.black : Color.white)
            .toolbar {
                // Add expense button
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddExpenseView(viewModel: viewModel, isDarkMode: $isDarkMode)) {
                        Image(systemName: "plus")
                            .foregroundColor(isDarkMode ? .white : .black)
                    }
                }
                
                // Dark mode toggle
                ToolbarItem(placement: .navigationBarLeading) {
                    DarkModeToggle(isDarkMode: $isDarkMode)
                }
            }
            .background(isDarkMode ? Color.black : Color.white)
            .scrollContentBackground(.hidden) // Hide background for a cleaner look
            
            // Sorting button
            Button("Sort") {
                withAnimation(.smooth) {
                    viewModel.sortExpenses(by: isSortingDescending)
                    isSortingDescending.toggle()
                }
            }
            .frame(width: 200, alignment: .center)
            .padding()
            .background(isDarkMode ? .white : .black)
            .foregroundColor(isDarkMode ? .black : .white)
            .cornerRadius(10)
        }
        .searchable(text: $searchText) // Enable search bar
        .preferredColorScheme(isDarkMode ? .dark : .light) // Apply dark/light mode
    }
    
    // Filter expenses based on search input
    var searchResults: [Expense] {
        if searchText.isEmpty {
            return viewModel.expenses
        } else {
            return viewModel.expenses.filter { $0.name.contains(searchText) }
        }
    }
}

#Preview {
    ContentView()
}
