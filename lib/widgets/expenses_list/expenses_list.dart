import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses
  });

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    // Build a ListView to display the list of expenses
    return ListView.builder(
      // Set the number of items in the list to the length of the expenses list
      itemCount: expenses.length,
      // Build each item in the list using the itemBuilder function
      itemBuilder: (ctx, index) => ExpenseItem(expenses[index]),
    );
  }
}
