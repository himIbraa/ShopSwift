import 'package:equatable/equatable.dart';
import 'package:shopswift/models/models.dart';

class Whishlist extends Equatable {
  final List<Product> products;

  const Whishlist({this.products = const <Product>[]});

  @override
  List<Object?> get props => [products];
}
