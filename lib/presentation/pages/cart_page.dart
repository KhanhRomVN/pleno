import 'package:flutter/material.dart';
import '../layouts/main_layouts.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Giỏ hàng'),
        ),
        body: const Center(
          child: Text('Giỏ hàng'),
        ),
      ),
    );
  }
}
