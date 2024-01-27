import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopswift/blocs/blocs.dart';
import 'package:shopswift/models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;

  const ProductCard({
    required this.product,
    this.widthFactor = 2.5,
    this.leftPosition = 0,
    this.isWishlist = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / widthFactor,
              height: 150,
              child: Image.network(
                product.imageURL,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 80,
              left: leftPosition,
              child: Container(
                width: MediaQuery.of(context).size.width / widthFactor -
                    leftPosition,
                height: 70,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color.fromARGB(199, 0, 0, 0),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              '${product.price} DA',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          if (state is CartLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is CartLoaded) {
                            return Expanded(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(CartProductAdded(product));
                                  final snackbar = SnackBar(
                                      content: Text('Product added to cart'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackbar);
                                },
                              ),
                            );
                          } else {
                            return Text('Something went wrong!!!');
                          }
                        },
                      ),
                      isWishlist
                          ? BlocBuilder<WhishlistBloc, WhishlistState>(
                              builder: (context, state) {
                                return Expanded(
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      context
                                          .read<WhishlistBloc>()
                                          .add(RemoveWhishlistProduct(product));
                                    },
                                  ),
                                );
                              },
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
