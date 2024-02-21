import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu-items/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bool hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    final int lengthMenu = menuItems.length;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        navDrawerIndex = value;
        setState(() {});
        final menuItem = menuItems[value];
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(30, hasNotch ? 10 : 20, 20, 10),
          child: const Text('Main Options')
          ),

        ...menuItems
          .sublist(0, (lengthMenu~/2))
          .map((item) => NavigationDrawerDestination(icon: Icon(item.icon), label: Text(item.title))),

          const Padding(padding: EdgeInsets.fromLTRB(25, 30, 25, 30), child: Divider(),),
          const Padding(
          padding: EdgeInsets.all(5),
          child: Text('More Options')
          ),


          ...menuItems
          .sublist(lengthMenu~/2, menuItems.length)
          .map((item) => NavigationDrawerDestination(icon: Icon(item.icon), label: Text(item.title), )),
      ],
    );
  }
}