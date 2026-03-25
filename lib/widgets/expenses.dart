import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/new_expends.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  // A list to hold the registered expenses
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    // Open a modal bottom sheet to add a new expense
    showModalBottomSheet(
      // Set isScrollControlled to true to allow the modal bottom sheet to take up the full
      // height of the screen when the keyboard is open
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    // Add a new expense to the list of registered expenses and update the UI
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    // Remove an expense from the list of registered expenses based on its ID and update the UI
    setState(() {
      _registeredExpenses.remove(expense);
    });
    // Show a SnackBar to confirm the removal of the expense
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text('${expense.title} removed.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Re-add the removed expense to the list of registered expenses and update the UI
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    // Build the main UI for the Expenses screen
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          // Display the Chart widget to show a visual representation of the expenses
          Chart(expenses: _registeredExpenses),
          // Display either fallback text or the list of registered expenses.
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
