import 'package:flutter/material.dart';

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
                  // Set the keyboard type to number for the amount input
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    // Add a prefix text to indicate that the amount is in dollars
                    prefixText: '\$ ',
                  ),
                ),
              ),
            ],
          ),


          Row(
            children: [
              TextButton(
                onPressed: () {},
                  child: const Text(
                    'Cancel',
                  ),
                ),
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_amountController.text);
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
  }
}
