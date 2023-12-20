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
  Transportation selectedTransport = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isValue, 
          title: const Text('SwitchListTle'), subtitle: const Text('Subtitle'),
          onChanged: (value) => setState(() {
            isValue = !isValue;
          }),
        ),

        RadioListTile(
          value: Transportation.car, 
          groupValue: selectedTransport, 
          onChanged: (value) => setState(() {
            selectedTransport = Transportation.car;
          }),
        ),

        RadioListTile(
          value: Transportation.plane, 
          groupValue: selectedTransport, 
          onChanged: (value) => setState(() {
            selectedTransport = Transportation.plane;
          }),
        ),

        RadioListTile(
          value: Transportation.boat, 
          groupValue: selectedTransport, 
          onChanged: (value) => setState(() {
            selectedTransport = Transportation.boat;
          }),
        ),

        RadioListTile(
          value: Transportation.submarine, 
          groupValue: selectedTransport, 
          onChanged: (value) => setState(() {
            selectedTransport = Transportation.submarine;
          }),
        ),
      ],
    );
  }
}