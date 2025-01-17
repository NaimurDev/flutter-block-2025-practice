
import 'package:flutter/material.dart';
import 'package:lets_learn_bloc/features/products/domain/models/product.dart';
import 'package:lets_learn_bloc/features/products/presentation/widgets/product_card.dart';

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
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}
