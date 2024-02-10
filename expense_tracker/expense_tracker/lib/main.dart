import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

var kColorScreen =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 98, 59, 181));

var kDarkColorScreen = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromRGBO(5, 99, 125, 1));
void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
    runApp(
      MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
          // dark() no longer takes any arguments
          colorScheme: kDarkColorScreen,
          cardTheme: const CardTheme().copyWith(
            color: kDarkColorScreen.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScreen.primaryContainer,
              foregroundColor: kDarkColorScreen.onPrimaryContainer,
            ),
          ),
        ),
        theme: ThemeData().copyWith(
          colorScheme: kColorScreen,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScreen.onPrimaryContainer,
            foregroundColor: kColorScreen.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
            color: kColorScreen.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScreen.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: kColorScreen.onSecondaryContainer,
                ),
              ),
        ),
        themeMode: ThemeMode.system,
        home: const Expenses(),
      ),
    );
  // });
}
