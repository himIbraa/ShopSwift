import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageURL;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageURL,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  @override
  List<Object?> get props =>
      [name, category, imageURL, price, isRecommended, isPopular];

  static List<Product> products = [
    const Product(
      name: 'MacBook M1 pro 2022 12"',
      imageURL:
          'https://images.unsplash.com/photo-1580522154071-c6ca47a859ad?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      category: 'Computers',
      price: 2000,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'Dell Xps 13"',
      imageURL:
          'https://images.unsplash.com/photo-1567521463850-4939134bcd4a?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      category: 'Computers',
      price: 500,
      isRecommended: true,
      isPopular: true,
    ),
    const Product(
      name: 'Cheverolet coupe',
      imageURL:
          'https://images.unsplash.com/photo-1521657249896-063c0c611fe5?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      category: 'Cars',
      price: 200000,
      isRecommended: true,
      isPopular: true,
    ),
    const Product(
      name: 'Mercedes G-class',
      imageURL:
          'https://images.unsplash.com/photo-1590079287659-96668805ef23?q=80&w=2005&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      category: 'Cars',
      price: 16000000,
      isRecommended: true,
      isPopular: true,
    ),
    const Product(
      name: 'Shelf',
      imageURL:
          'https://images.unsplash.com/photo-1602990721338-9cbb5b983c4d?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      category: 'Furniture',
      price: 2340,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      name: 'Product 06',
      imageURL:
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      category: 'Category 04',
      price: 600,
      isRecommended: true,
      isPopular: true,
    ),
    const Product(
      name: 'Product 07',
      imageURL:
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      category: 'Category 04',
      price: 3300,
      isRecommended: false,
      isPopular: true,
    ),
  ];
}
