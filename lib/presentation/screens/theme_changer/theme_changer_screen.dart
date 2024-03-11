import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            onPressed: () => ref.read(themeNotifierProvider.notifier).toggleDarkMode(), 
            icon: Icon( isDarkMode ? Icons.dark_mode : Icons.light_mode )
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemBuilder: (context, index) {
        final Color color = colors[index];
        return RadioListTile(
          title: Text('This Color', style: TextStyle(color: color),),
          subtitle: Text('${ color.value }'),
          activeColor: color,
          value: index, 
          groupValue: selectedColor, 
          onChanged: (value){
            ref.read(themeNotifierProvider.notifier).changeColor(value!);
          }
        );
      },
      itemCount: colors.length,
    );
  }
}