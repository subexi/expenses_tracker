import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // A variable to hold the entered title of the expense
  final _titleController = TextEditingController();

  @override
  // Dispose of the TextEditingController when the widget is removed from the widget tree
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build the UI for the NewExpense screen
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            // Use the TextEditingController to manage the input for the title of the expense
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
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
