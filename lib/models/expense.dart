import 'package:uuid/uuid.dart';

// Create a new UUID
const uuid = Uuid();

// Define an enum for the different categories of expenses
enum Category {
  food,
  travel,
  leisure,
  work,
}

class Expense {
  // Constructor for the Expense class
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); // Generate a unique ID for each expense

  // Define the properties of the Expense class
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}