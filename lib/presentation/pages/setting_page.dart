import 'package:flutter/material.dart';
import '../layouts/main_layouts.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Center(
          child: Text('Setting Page'),
        ),
      ),
    );
  }
}
