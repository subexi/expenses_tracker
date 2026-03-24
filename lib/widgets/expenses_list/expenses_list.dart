import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    // Build a ListView to display the list of expenses
    return ListView.builder(
      // Set the number of items in the list to the length of the expenses list
      itemCount: expenses.length,
      // Build each item in the list using the itemBuilder function
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index].id),
        background: Container(
          // Set the background color of the Dismissible widget to a semi-transparent error color
          color: Theme.of(context).colorScheme.error.withValues(alpha: 0.50),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        // When an item is dismissed, call the onRemoveExpense function with the corresponding expense
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
