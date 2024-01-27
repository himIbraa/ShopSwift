import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopswift/blocs/checkout/checkout_bloc.dart';
import '/widgets/widgets.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  const CheckoutScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Checkout'),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFFF5BA41),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CheckoutLoaded) {
              return SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      onPressed: () {
                        context
                            .read<CheckoutBloc>()
                            .add(ConfirmCheckout(checkout: state.checkout));
                        Navigator.pushNamed(context, '/order-confirmation');
                      },
                      child: Text(
                        'ORDER NOW',
                        style: Theme.of(context).textTheme.bodyLarge!,
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Text('something went wrong');
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<CheckoutBloc, CheckoutState>(
                builder: (context, state) {
                  if (state is CheckoutLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CheckoutLoaded) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'CUSTOMER INFORMATION',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        CustomTextFormField(
                          title: 'Full Name',
                          onChanged: (value) {
                            context
                                .read<CheckoutBloc>()
                                .add(UpdateCheckout(fullName: value));
                          },
                        ),
                        CustomTextFormField(
                          title: 'Phone number',
                          onChanged: (value) {
                            context
                                .read<CheckoutBloc>()
                                .add(UpdateCheckout(phoneNumber: value));
                          },
                        ),
                        CustomTextFormField(
                          title: 'Email',
                          onChanged: (value) {
                            context
                                .read<CheckoutBloc>()
                                .add(UpdateCheckout(email: value));
                          },
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'DELIVERY INFORMATION',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        CustomTextFormField(
                          title: 'Address',
                          onChanged: (value) {
                            context
                                .read<CheckoutBloc>()
                                .add(UpdateCheckout(address: value));
                          },
                        ),
                        CustomTextFormField(
                          title: 'City',
                          onChanged: (value) {
                            context
                                .read<CheckoutBloc>()
                                .add(UpdateCheckout(city: value));
                          },
                        ),
                        CustomTextFormField(
                          title: 'POSTAL Code',
                          onChanged: (value) {
                            context
                                .read<CheckoutBloc>()
                                .add(UpdateCheckout(zipCode: value));
                          },
                        ),
                      ],
                    );
                  } else {
                    return Text('something went wrong');
                  }
                },
              ),
              const OrderSummary(),
            ],
          ),
        ),
      ),
    );
  }
}
