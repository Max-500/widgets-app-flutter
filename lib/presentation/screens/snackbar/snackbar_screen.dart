import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    final SnackBar snackBar = SnackBar(content: const Text('Hello World'), action: SnackBarAction(label: 'ok!', onPressed: (){}), duration: const Duration(seconds: 3),);
    ScaffoldMessenger.of(context)..clearSnackBars()..showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(context: context, barrierDismissible: false, builder: (context) =>  AlertDialog(
      title: const Text('Are you sure?'),
      content: const Text('Dolor fugiat et dolor culpa officia culpa magna aliqua. Veniam irure laborum mollit ex voluptate pariatur do velit nostrud excepteur qui quis magna consectetur. Commodo cillum proident ullamco consequat incididunt nulla fugiat nostrud duis mollit. Reprehenderit voluptate laborum cupidatat ipsum incididunt do enim exercitation anim nisi aute commodo. Id enim nostrud culpa adipisicing fugiat aliqua est occaecat et ut ex eiusmod elit nulla.'),
      actions: [
        TextButton(onPressed: () => context.pop(), child: const Text('Acept')),
        TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
      ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbars and Dialogs')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(context: context,
                children: [
                const Text('Do duis veniam sunt consequat enim exercitation anim eu pariatur dolore id exercitation officia sunt. Aliqua dolore amet cillum irure irure aute anim consequat dolor. Ipsum ex voluptate laboris adipisicing duis nostrud non amet quis non cillum in laboris qui. Anim ea eu amet in. Adipisicing minim mollit amet ullamco labore exercitation magna magna sunt fugiat reprehenderit veniam dolore duis. Velit tempor fugiat enim irure laboris aliqua do tempor sint nulla dolore ad.') 
                ]);
              }, 
             child: const Text('Used Licenses')
            ),

            FilledButton.tonal(
              onPressed: (){
                openDialog(context);
              }, 
             child: const Text('Show Dialogs')
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackBar(context),
        label: const Text('Show snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
