import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      // Set the theme of the app to use Material 3 design
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 220, 189, 252),
      ),
      debugShowCheckedModeBanner: false,
      home: Expenses(),
    ),
  );
}
