import 'package:drawer2/screen/app_drawer.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      drawer: AppDrawer(), // Use the custom drawer
      body: Center(child: Text("Settings Page")),
    );
  }
}
