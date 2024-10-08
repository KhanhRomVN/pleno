class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

// Fake data
List<Product> fakeProducts = [
  Product(
    id: 1,
    name: 'Smartphone X',
    description: 'A powerful smartphone with advanced features.',
    price: 699.99,
    imageUrl: 'https://images.pexels.com/photos/9969236/pexels-photo-9969236.jpeg'
  ),
  Product(
    id: 2,
    name: 'Laptop Pro',
    description: 'High-performance laptop for professionals.',
    price: 1299.99, imageUrl: 'https://images.pexels.com/photos/9969236/pexels-photo-9969236.jpeg'
  ),
];