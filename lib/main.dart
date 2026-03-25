import 'package:flutter/material.dart';
/* import 'package:flutter/services.dart'; */

import 'package:expense_tracker/widgets/expenses.dart';

// Define a color scheme for the app using a seed color
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

// Define a dark color scheme for the app using a different seed color
var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 99, 125),
  brightness: Brightness.dark,
);

void main() {
  /* WidgetsFlutterBinding.ensureInitialized(); // Ensure that the Flutter engine is initialized before running the app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    fn,
  ) { */
    runApp(
      MaterialApp(
        // Set the dark theme of the app using the defined dark color scheme
        darkTheme: ThemeData().copyWith(
          colorScheme: kDarkColorScheme,
          cardTheme: CardThemeData(
            color: kDarkColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
              foregroundColor: kDarkColorScheme.onPrimaryContainer,
            ),
          ),
        ),
        // Set the color scheme of the app using the defined color scheme
        theme: ThemeData().copyWith(
          colorScheme: kColorScheme,
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          cardTheme: CardThemeData(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: kColorScheme.onSecondaryContainer,
              fontSize: 16,
            ),
          ),
        ),
        // Disable the debug banner in the top right corner of the app
        debugShowCheckedModeBanner: false,
        // themeMode: ThemeMode.system, // Use the system theme mode (light or dark) based on the user's device settings
        home: const Expenses(),
      ),
    ); // Run the app with the defined MaterialApp widget
  //}); // Ensure that the app runs in portrait mode only by setting the preferred orientations to portraitUp
}
