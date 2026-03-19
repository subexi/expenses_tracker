import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

// Define a color scheme for the app using a seed color
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

void main() {
  runApp(
    MaterialApp(
      // Set the color scheme of the app using the defined color scheme
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
      ),
      // Disable the debug banner in the top right corner of the app
      debugShowCheckedModeBanner: false,
      home: Expenses(),
    ),
  );
}
