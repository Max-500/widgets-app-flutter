import 'dart:math' show Random, max;
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 100;
  double height = 100;
  double borderRadius = 20;
  Color color = Colors.blue;

  void changeShape() {
    final Random random = Random();
    height = max(10, random.nextInt(300) + 50);
    width = max(10, random.nextInt(300) + 50);
    borderRadius = max(10, random.nextInt(100) + 120);
    color = Color.fromRGBO(
        random.nextInt(255), //red
        random.nextInt(255), //green
        random.nextInt(255), //black
        1 //opacity
        );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container')),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.elasticOut,
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(borderRadius)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_outlined),
      ),
    );
  }
}
