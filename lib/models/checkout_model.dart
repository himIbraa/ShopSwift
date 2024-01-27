import 'package:equatable/equatable.dart';
import '/models/models.dart';

class Checkout extends Equatable {
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? address;
  final String? city;
  final String? zipCode;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;

  const Checkout({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.city,
    required this.zipCode,
    required this.products,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  });

  @override
  List<Object?> get props => [
        fullName,
        email,
        phoneNumber,
        address,
        city,
        zipCode,
        products,
        subtotal,
        deliveryFee,
        total,
      ];

  Map<String, Object> toDocument() {
    Map customerAddress = Map();
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['zipCode'] = zipCode;

    return {
      'customerAddress': customerAddress,
      'customerName': fullName!,
      'customerEmail': email!,
      'phoneNumber': phoneNumber!,
      'products': products!.map((product) => product.name).toList(),
      'subtotal': subtotal!,
      'deliveryFee': deliveryFee!,
      'total': total!
    };
  }
}
