import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      // Set the theme of the app to use Material 3 design
      theme: ThemeData(useMaterial3: true),
      home: Expenses(),
    ),
  );
}
