import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopswift/blocs/blocs.dart';
import 'package:shopswift/models/models.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;

  const CartProductCard({Key? key, required this.product ,required this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey.shade300, width: 1.0),
      ),
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              product.imageURL,
              width: 100,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.bodyLarge!,
                ),
                const SizedBox(height: 5),
                Text(
                  '${product.price} DA',
                  style: Theme.of(context).textTheme.bodyMedium!,
                ),
              ],
            ),
          ),

          SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.grey.shade200,
            ),
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(CartProductRemoved(product));
                      },
                      icon: const Icon(Icons.remove),
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '${quantity}',
                        style: Theme.of(context).textTheme.bodyLarge!,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<CartBloc>().add(CartProductAdded(product));
                      },
                      icon: const Icon(Icons.add),
                      color: Colors.black,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
