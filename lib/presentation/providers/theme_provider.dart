import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final StateProvider<bool> isDarkModeProvider = StateProvider<bool>((ref) => false);

final Provider<List<Color>> colorListProvider = Provider((ref) => listColors);

final StateProvider<int> selectedColorProvider = StateProvider<int>((ref) => 0);