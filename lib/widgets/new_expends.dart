import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  // A callback function to handle the addition of a new expense, which is passed from the parent widget
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // Variables to hold the entered data of the expense
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  // A variable to hold the selected date of the expense or null if no date is selected
  DateTime? _selectedDate;
  // A variable to hold the selected category of the expense
  Category _selectedCategory = Category.leisure;

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

  // A function to validate the entered data and submit the expense data
  void _submitExpenseData() {
    // Replace comma with dot for decimal separator compatibility
    final amountText = _amountController.text.replaceAll(',', '.');
    final enteredAmount = double.tryParse(amountText);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      // Show an error dialog if the entered data is invalid
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
            'Please make sure a valid title, amount, date and category was entered.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Close the error dialog when the OK button is pressed
                Navigator.pop(ctx);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }
    // Create a new Expense object with the entered data and pass it to the onAddExpense callback function
    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );
    // Close the modal bottom sheet after adding the expense
    Navigator.pop(context);
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
            decoration: const InputDecoration(label: Text('Title')),
          ),

          // A TextField to input the amount of the expense
          Row(
            children: [
              Expanded(
                child: TextField(
                  // Use the TextEditingController to manage the input for the amount of the expense
                  // Set the keyboard type to allow decimal numbers for the amount input
                  controller: _amountController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    // Allow digits and comma/dot as decimal separator
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9,.]')),
                  ],
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
                          : formatter.format(
                              _selectedDate!,
                            ), //  The ! tells that _selectedDate is not null and can be safely unwrapped
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ], // End of Row children
                ),
              ),
            ], // End of Row children
          ),

          const SizedBox(height: 16),

          // A Row to hold the Cancel and Save Expense buttons
          Row(
            children: [
              DropdownButton<Category>(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  // Update the selected category from the dropdown menu.
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),

              const Spacer(),

              TextButton(
                onPressed: () {
                  // Close the modal bottom sheet when the Cancel button is pressed
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate the entered data and submit the expense data when the Save Expense button is pressed
                  _submitExpenseData();
                },
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  } // End of _NewExpenseState class
}
