import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageURL;
  final double price;
  final bool isRecommended;
  final bool isPopular;
  final String SellerId;

  const Product({
    required this.name,
    required this.category,
    required this.imageURL,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
    required this.SellerId,
  });

  @override
  List<Object?> get props =>
      [name, category, imageURL, price, isRecommended, isPopular, SellerId];

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
        name: snap['name'],
        category: snap['category'],
        imageURL: snap['imageURL'],
        price: snap['price'],
        isRecommended: snap['isRecommended'],
        isPopular: snap['isPopular'],
        SellerId: snap['SellerId']);
    return product;
  }



}
