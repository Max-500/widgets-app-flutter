import 'package:flutter/material.dart' show IconData, Icons;

class MenuItems {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItems({required this.title, required this.subtitle, required this.link, required this.icon});
}

const menuItems = <MenuItems>[
  MenuItems(title: 'Buttons', subtitle: 'Many buttons', link: '/buttons', icon: Icons.smart_button_outlined),
  MenuItems(title: 'Cards', subtitle: 'Many cards', link: '/cards', icon: Icons.credit_card),
];