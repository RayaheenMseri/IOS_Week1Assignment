# Personal Expense Tracker

## 📌 Overview
The **Personal Expense Tracker** is a SwiftUI-based app that allows users to track their expenses effortlessly. It provides functionality to **add, view, sort, and filter expenses**, along with a **dark mode toggle** for better user experience. Data persistence is achieved using **UserDefaults**, ensuring expenses remain saved even after restarting the app.

## ✨ Features
✅ **Add Expenses:** Enter the name, amount, and category of an expense.
✅ **Dynamic List Display:** View a real-time updated list of expenses.
✅ **Sorting & Filtering:** Sort expenses by amount (ascending/descending) and filter by category.
✅ **Dark Mode Toggle:** Switch between light and dark themes.
✅ **Data Persistence:** Expenses are saved using **UserDefaults** to maintain data after closing the app.
✅ **Smooth Animations:** Enhanced user experience with animations for sorting and adding expenses.

## 🛠 Technologies Used
- **SwiftUI** for UI components and layout.
- **@State & @ObservedObject** for state management.
- **List & NavigationStack** for structured display.
- **UserDefaults** for data persistence.
- **Animations** for a smooth user experience.

## 📂 Project Structure
```bash
PersonalExpenseTracker/
│── Models/Expense.swift        # Defines Expense model
│── ViewModels/ExpenseViewModel.swift  # Handles expense data & sorting logic
│── Views/ContentView.swift     # Main UI for listing expenses
│── Views/AddExpenseView.swift  # UI for adding new expenses
│── Views/DarkModeToggle.swift  # Component for switching dark mode
│── Assets.xcassets             # Stores app icons & colors
│── PersonalExpenseTrackerApp.swift  # Entry point of the app
```

## 🛠 Features Breakdown
### 📌 UI & Layout
- Uses **VStack, HStack, ZStack** for structured layout.
- Styling with **.font(), .padding(), .background(), .cornerRadius()**.

### 📌 Expense Entry Form
- **TextField** for entering expense name.
- **Stepper** for selecting an amount.
- **Picker** for selecting a category.
- Uses **@State & @Binding** for state management.

### 📌 Displaying Expenses
- **List** component dynamically updates when new expenses are added.
- **Formatted currency amounts** for better readability.
- Uses **@ObservedObject & @Published** to manage expense data.

### 📌 Sorting & Filtering
- **Sort Button**: Sorts expenses by amount (ascending/descending).
- **Category Filter**: Filters expenses by selected category.
- Uses **higher-order functions (filter, map, sorted)**.

### 📌 Dark Mode Toggle
- **Toggle switch** to enable/disable dark mode.
- Dynamically updates background and text colors.

## 📜 License
This project is open-source and available under the **MIT License**.



