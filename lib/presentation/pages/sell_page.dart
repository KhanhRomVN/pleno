import 'package:flutter/material.dart';
import '../layouts/main_layouts.dart';

class SellPage extends StatelessWidget {
  const SellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Sell'),
            bottom: TabBar(
              onTap: (index) {
                switch (index) {
                  case 0:
                    Navigator.pushNamed(context, '/sell/product');
                    break;
                  case 1:
                    Navigator.pushNamed(context, '/sell/order');
                    break;
                  case 2:
                    Navigator.pushNamed(context, '/sell/other');
                    break;
                }
              },
              tabs: [
                Tab(text: 'Product'),
                Tab(text: 'Order'),
                Tab(text: 'Other'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text('Product Tab')),
              Center(child: Text('Order Tab')),
              Center(child: Text('Other Tab')),
            ],
          ),
        ),
      ),
    );
  }
}
