import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navDrawerIndex + 1,
      onDestinationSelected: (value) {
        navDrawerIndex = value;
        setState(() {});
      },
      children: const [
        NavigationDrawerDestination(icon: Icon(Icons.add), label: Text('Home Screen')),
        NavigationDrawerDestination(icon: Icon(Icons.add), label: Text('Home Screen'))
      ],
    );
  }
}