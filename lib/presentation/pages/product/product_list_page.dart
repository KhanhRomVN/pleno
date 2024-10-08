import 'package:flutter/material.dart';
import '../../../data/models/product.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemCount: fakeProducts.length,
        itemBuilder: (context, index) {
          return _buildProductCard(fakeProducts[index]);
        },
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return Card(
      child: Column(
        children: [
          Image.network(product.imageUrl, height: 120, width: 120, fit: BoxFit.cover),
          Text(product.name),
          Text('\$${product.price.toStringAsFixed(2)}'),
          ElevatedButton(
            child: Text('Add to Cart'),
            onPressed: () {
              // Implement add to cart functionality
            },
          ),
        ],
      ),
    );
  }
}