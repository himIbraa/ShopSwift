
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imgURL;

  const Category({required this.name, required this.imgURL});

  @override
  List<Object?> get props => [name, imgURL];


  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category = Category(name: snap['name'], imgURL: snap['imageURL']);
    return category;
  }



}
