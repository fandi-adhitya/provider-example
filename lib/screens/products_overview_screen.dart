import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/products_grid.dart';
class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = [
     
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
      ),
      body: ProductsGrid(),
    );
  }
}

