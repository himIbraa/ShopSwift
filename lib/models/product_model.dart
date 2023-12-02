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
    Product(
      name: 'Product 01',
      imageURL:
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      category: 'Category 01',
      price: 2000,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: 'Product 02',
      imageURL:
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      category: 'Category 01',
      price: 500,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: 'Product 03',
      imageURL:
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      category: 'Category 01',
      price: 200,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: 'Product 04',
      imageURL:
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      category: 'Category 01',
      price: 1600,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: 'Product 05',
      imageURL:
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      category: 'Category 01',
      price: 2340,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      name: 'Product 06',
      imageURL:
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      category: 'Category 01',
      price: 600,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: 'Product 07',
      imageURL:
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      category: 'Category 01',
      price: 3300,
      isRecommended: false,
      isPopular: true,
    ),
  ];
}
