import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    // Build a ListView to display the list of expenses
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Text(expenses[index].title),
    );
  }
}
