import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// Create a DateFormat instance to format the date of the expenses
final formatter = DateFormat('dd.MM.y'); // Format: day.month.year

// Create a new UUID
const uuid = Uuid();

// Define an enum for the different categories of expenses
enum Category {
  food,
  travel,
  leisure,
  work,
}

// A mapping of each category to its corresponding icon
const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

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

  // A getter to return the formatted date of the expense
  String get formattedDate => formatter.format(date);

}