import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () => Navigator.pushNamed(context, '/'),
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () => Navigator.pushNamed(context, '/shop'),
              ),
              FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add),
                backgroundColor: Colors.blue,
              ),
              IconButton(
                icon: Icon(Icons.store),
                onPressed: () => Navigator.pushNamed(context, '/sell/product'),
              ),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () => Navigator.pushNamed(context, '/setting'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
