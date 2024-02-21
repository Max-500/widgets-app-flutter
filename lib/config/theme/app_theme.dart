import 'package:flutter/material.dart';

const List<Color> listColors = <Color> [
  Colors.blue, Colors.teal, Colors.green, Colors.red, Colors.purple, Colors.pinkAccent, Colors.orange, Colors.deepPurple
];

class AppTheme {
  final int selectedColor;
  bool isDarkMode;

  AppTheme({required this.selectedColor, this.isDarkMode = false})
    :assert(selectedColor >= 0 && selectedColor < listColors.length-1, 'The color selected must be in range of 0 or ${listColors.length-1}');

  ThemeData getTheme(){
    return ThemeData(
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      useMaterial3: true,
      colorSchemeSeed: listColors[selectedColor],
      appBarTheme: const AppBarTheme(
        centerTitle: false
      )
    );
  }
}