import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem({
  //   required this.id,
  //   required this.title,
  //   required this.imageUrl
  // });

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    print('Product rebuild');
    return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GridTile(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        ProductDetailScreen.routeName,
                        arguments: product.id);
                  },
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                footer: GridTileBar(
                    backgroundColor: Colors.black87,
                    leading: Consumer<Product>(
                      builder: (_, product, child) => IconButton(
                        onPressed: () {
                          product.toggleFavoriteStatus();
                        },
                        icon: Icon(product.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    title: Text(
                      product.title,
                      textAlign: TextAlign.center,
                    )),
              ),
            );
  }
}
