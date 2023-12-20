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
  MenuItems(title: 'Progress Indicator', subtitle: 'A container customized', link: '/progress', icon: Icons.refresh_rounded),
  MenuItems(title: 'Snackbars and dialogs', subtitle: 'Indicators in screen', link: '/snackbars', icon: Icons.info_outline),
  MenuItems(title: 'Animated Container', subtitle: 'Statefull Widget Animated', link: '/animated', icon: Icons.check_box_outline_blank_rounded),
  MenuItems(title: 'UI Control + Tile Screen', subtitle: 'A controller series of Flutter', link: '/ui-controls', icon: Icons.car_rental_outlined),
  MenuItems(title: 'Aplication Introduction', subtitle: 'A little tutorial introduction', link: '/app-tutorial', icon: Icons.accessibility_rounded)
];