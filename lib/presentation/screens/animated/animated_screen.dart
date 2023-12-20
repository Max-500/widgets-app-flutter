import 'dart:math' show Random;
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
    height = random.nextInt(300) + 50;
    width = random.nextInt(300) + 50;
    borderRadius = random.nextInt(100) + 20;
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
          curve: Curves.elasticInOut,
          height: height <= 0 ? 10 : height,
          width: width <= 0 ? 10 : width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius <= 0 ? 10 : borderRadius)
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_outlined),
      ),
    );
  }
}