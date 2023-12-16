import 'package:flutter/material.dart';
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
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.pushNamed(context, '/order-confirmation');
                },
                child: Text(
                  'ORDER NOW',
                  style: Theme.of(context).textTheme.bodyLarge!,
                ),
              )
            ],
          ),
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
              Column(
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
                    onChanged: (value) {},
                  ),
                  CustomTextFormField(
                    title: 'Phone number',
                    onChanged: (value) {},
                  ),
                  CustomTextFormField(
                    title: 'Email',
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'DELIVERY INFORMATION',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  CustomTextFormField(
                    title: 'Address',
                    onChanged: (value) {},
                  ),
                  CustomTextFormField(
                    title: 'City',
                    onChanged: (value) {},
                  ),
                  CustomTextFormField(
                    title: 'POSTAL Code',
                    onChanged: (value) {},
                  ),
                ],
              ),
              const OrderSummary(),
            ],
          ),
        ),
      ),
    );
  }
}
