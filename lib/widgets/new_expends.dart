import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // A variablws to hold the entered info of the expense
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  // A variable to hold the selected date of the expense or null if no date is selected
  DateTime? _selectedDate;

  // A variable to hold the selected date of the expense
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    // Show a date picker dialog to select the date of the expense
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      // Update the selected date with the picked date from the date picker dialog
      _selectedDate = pickedDate;
    });
  }

  @override
  // Dispose of the TextEditingController when the widget is removed from the widget tree
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build the UI for the NewExpense screen
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // A TextField to input the title of the expense, with a maximum length of 50 characters
          TextField(
            // Use the TextEditingController to manage the input for the title of the expense
            controller: _titleController,
            maxLength: 50,
            // Set the keyboard type to text for the title input
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),

          // A TextField to input the amount of the expense
          Row(
            children: [
              Expanded(
                child: TextField(
                  // Use the TextEditingController to manage the input for the amount of the expense
                  // Set the keyboard type to number for the amount input
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    // Add a prefix text to indicate that the amount is in dollars
                    prefixText: '\$ ',
                  ),
                ), //
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Row(
                  // Align the children of the Row to the end of the main axis
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                        ? 'No date selected'
                        : formatter.format(_selectedDate!), //  The ! tells that _selectedDate is not null and can be safely unwrapped
                      ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ], // End of Row children
                ),
              ),
            ], // End of Row children
          ),

          // A Row to hold the Cancel and Save Expense buttons
          Row(
            children: [
              TextButton(
                onPressed: () {
                  // Close the modal bottom sheet when the Cancel button is pressed
                  Navigator.pop(context);
                },
                  child: const Text(
                    'Cancel',
                  ),
                ),
              ElevatedButton(
                onPressed: () {
                  debugPrint(_titleController.text);
                  debugPrint(_amountController.text);
                },
                child: const Text(
                  'Save Expense',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  } // End of _NewExpenseState class
}
