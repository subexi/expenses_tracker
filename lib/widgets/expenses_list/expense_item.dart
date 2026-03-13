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
                    // Display the icon corresponding to the category of the expense
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8),
                    Text(
                      // Display the formatted date of the expense
                      expense.formattedDate,
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