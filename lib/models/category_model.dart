import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imgURL;

  const Category({required this.name, required this.imgURL});

  @override
  List<Object?> get props => [name, imgURL];

  static List<Category> categories = [
    const Category(
        name: 'Computers',
        imgURL:
            'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    const Category(
        name: 'Cars',
        imgURL:
            'https://images.unsplash.com/photo-1664785830053-251258f259f3?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    const Category(
        name: 'Furniture',
        imgURL:
            'https://images.unsplash.com/photo-1597072689227-8882273e8f6a?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    const Category(
        name: 'Category 04',
        imgURL:
            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
  ];
}
