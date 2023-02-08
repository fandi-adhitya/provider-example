import 'package:eshop/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final productContainer = Provider.of<Products>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.Favorites) {
                productContainer.showFavoritesOnly();
              } else {
                productContainer.showAll();
              }
            }, 
            itemBuilder: (_) => const [
              PopupMenuItem(value: FilterOptions.Favorites, child: Text('Only Favorites')),
              PopupMenuItem(value: FilterOptions.All, child: Text('Show All')),

            ],
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
