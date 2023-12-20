import 'package:flutter/material.dart';

class UiControlScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UiControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controll + Tile Screen'),
      ),
      body: const _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UIControlsViewState extends State<_UIControlsView> {
  bool isValue = false;
  bool lunch = false;
  bool breakfast = false;
  bool dinner = false;
  bool snack = false;
  Transportation selectedTransport = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(      
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isValue,
          title: const Text('SwitchListTle'),
          subtitle: const Text('Subtitle'),
          onChanged: (value) => setState(() {
            isValue = !isValue;
          }),
        ),
        ExpansionTile(
          title: Text('Trasnport selected: $selectedTransport'),
          subtitle: const Text(
              'You can select another transport but only can select a transport.'),
          children: [
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Travel by car'),
              value: Transportation.car,
              groupValue: selectedTransport,
              onChanged: (_) => setState(() {
                selectedTransport = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text('By Plane'),
              subtitle: const Text('Travel by plane'),
              value: Transportation.plane,
              groupValue: selectedTransport,
              onChanged: (_) => setState(() {
                selectedTransport = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Travel by boat'),
              value: Transportation.boat,
              groupValue: selectedTransport,
              onChanged: (_) => setState(() {
                selectedTransport = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text('By Submarine'),
              subtitle: const Text('Travel by submarine'),
              value: Transportation.submarine,
              groupValue: selectedTransport,
              onChanged: (_) => setState(() {
                selectedTransport = Transportation.submarine;
              }),
            ),
          ],
        ),

        CheckboxListTile(
          title: const Text('Do you want eat the breakfast?'),
          value: breakfast,
          onChanged: (_) => setState(() {
            breakfast = !breakfast;
          }),  
        ),

        CheckboxListTile(
          title: const Text('Do you want to eat a snack?'),
          value: snack,
          onChanged: (_) => setState(() {
            snack = !snack;
          }),  
        ),

        CheckboxListTile(
          title: const Text('Do you want to eat the lunch?'),
          value: lunch,
          onChanged: (_) => setState(() {
            lunch = !lunch;
          }),  
        ),

        CheckboxListTile(
          title: const Text('Do you want to eat the dinner?'),
          value: dinner,
          onChanged: (_) => setState(() {
            dinner = !dinner;
          }),  
        ),
      ],
    );
  }
}
