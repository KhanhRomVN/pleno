import 'package:flutter/material.dart';
import '../layouts/main_layouts.dart';

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Shop'),
        ),
        body: Center(
          child: Text('This is the Shop page'),
        ),
      ),
    );
  }
}
