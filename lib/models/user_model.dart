import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String fullName;
  final String email;
  final String password;


  const User({
    this.id,
    this.fullName = '',
    this.email = '',
    this.password='',
  });

  User copyWith({
    String? id,
    String? fullName,
    String? email,
    String? password,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,

    );
  }

  factory User.fromSnapshot(DocumentSnapshot snap) {
    return User(
      id: snap.id,
      fullName: snap['fullName'],
      email: snap['email'],
      password: snap['password'],

    );
  }

  Map<String, Object> toDocument() {
    return {
      'fullName': fullName,
      'email': email,
      'password': password,

    };
  }

  @override
  List<Object?> get props =>
      [id, fullName, email, password];
}