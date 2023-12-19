import 'package:flutter/material.dart';

class SnackBarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    final SnackBar snackBar = SnackBar(content: const Text('Hello World'), action: SnackBarAction(label: 'ok!', onPressed: (){}), duration: const Duration(seconds: 3),);
    ScaffoldMessenger.of(context)..clearSnackBars()..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbars and Dialogs')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackBar(context),
        label: const Text('Show snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
