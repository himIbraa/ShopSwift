part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCheckout extends CheckoutEvent {
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? address;
  final String? city;
  final String? zipCode;
  final Cart? cart;

  UpdateCheckout({
    this.fullName,
    this.email,
    this.phoneNumber,
    this.address,
    this.city,
    this.zipCode,
    this.cart,
  });

  @override
  List<Object?> get props => [
        fullName,
        email,
        address,
        city,
        zipCode,
        cart,
      ];
}

class ConfirmCheckout extends CheckoutEvent {
  final Checkout checkout;

  const ConfirmCheckout({required this.checkout});

  @override
  List<Object?> get props => [checkout];
}
