import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    // Build a Card widget to display the details of an individual expense
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 4),
            // Display the amount and date of the expense in a Row widget
            Row(
              children: [
                // Display the amount of the expense formatted to 2 decimal places
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                // Add a Spacer widget to push the date to the right end of the Row
                const Spacer(),
                Row(
                  children: [
                    const Icon(Icons.alarm),
                    const SizedBox(width: 8),
                    Text(
                      expense.date.toString(),
                    ),
                  ],
                )

              ], // End of Row children
            ),
          ], // End of Column children
        ),
      ),
    );
  }
}