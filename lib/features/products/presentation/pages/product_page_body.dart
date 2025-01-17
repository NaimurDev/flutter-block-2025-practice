
import 'package:flutter/material.dart';
import 'package:lets_learn_bloc/features/products/domain/models/product.dart';
import 'package:lets_learn_bloc/features/products/presentation/widgets/produts_grid_view.dart';

class ProductPageBody extends StatelessWidget {
  final List<Product> products;
  const ProductPageBody({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
      ),
      body: ProductsGridView(products: products),
    );
  }
}
