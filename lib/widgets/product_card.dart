import 'package:flutter/material.dart';
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
            Container(
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
                decoration:
                    BoxDecoration(color: Color.fromARGB(200, 19, 13, 137)),
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
                      Expanded(
                        child: IconButton(
                          icon: Icon(
                            Icons.add_circle,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      isWishlist
                          ? Expanded(
                              child: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ))
                          : SizedBox(),
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
