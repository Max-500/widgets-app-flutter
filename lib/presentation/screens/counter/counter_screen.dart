import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';

  const CounterScreen({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch( counterProvider );
    final bool isDarkMode = ref.watch( isDarkModeProvider );
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeigth = MediaQuery.of(context).size.height;


    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen with Riverpod')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Valor: $clickCounter', style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: screenHeigth*0.10,),
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    heroTag: 'btn to plus one',
                    onPressed: () => ref.read(counterProvider.notifier).state++,
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    heroTag: 'btn to reset to zero',
                    onPressed: () => ref.read(counterProvider.notifier).state = 0,
                    child: const Icon(Icons.refresh_outlined),
                  ),
                  FloatingActionButton(
                    heroTag: 'btn to minus one',
                    onPressed: () => ref.read(counterProvider.notifier).state--,
                    child: const Text('-', style: TextStyle(
                      fontSize: 20
                    ),),
                  ),
                ],
              ),
            ]
          ),
      ),
    );
  }
}