import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final StateProvider<bool> isDarkModeProvider = StateProvider<bool>((ref) => false);

final Provider<List<Color>> colorListProvider = Provider((ref) => listColors);

final StateProvider<int> selectedColorProvider = StateProvider<int>((ref) => 0);

// Un objeto de tipo AppTheme (Custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier(): super (AppTheme());

  void toggleDarkMode(){
    state = state.copyWith( isDarkMode: !state.isDarkMode );
  }

  void changeColor(int colorIndex){
    state = state.copyWith(selectedColor: colorIndex);
  }
}