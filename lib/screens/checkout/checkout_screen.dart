import 'package:flutter/material.dart';
import '/widgets/widgets.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Checkout'),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFF5BA41),
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
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
                  SizedBox(
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
                  SizedBox(height: 30),
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
              OrderSummary(),
            ],
          ),
        ),
      ),
    );
  }
}
