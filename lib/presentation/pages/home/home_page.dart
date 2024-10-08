import 'package:flutter/material.dart';
import '../../../data/models/product.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('eCommerce App'),
      ),
      body: ListView(
        children: [
          // Featured products
          _buildFeaturedProducts(),
          // Categories
          _buildCategories(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }

  Widget _buildFeaturedProducts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Featured Products', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: fakeProducts.length,
            itemBuilder: (context, index) {
              return _buildProductCard(fakeProducts[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard(Product product) {
    return Card(
      child: Column(
        children: [
          Image.network(product.imageUrl, height: 100, width: 100, fit: BoxFit.cover),
          Text(product.name),
          Text('\$${product.price.toStringAsFixed(2)}'),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    // Implement categories here
    return Container();
  }
}