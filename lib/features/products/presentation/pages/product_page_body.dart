import 'package:flutter/material.dart';
import 'package:lets_learn_bloc/features/products/domain/models/product.dart';
import 'package:lets_learn_bloc/features/products/presentation/widgets/produts_grid_view.dart';

class ProductPageBody extends StatelessWidget {
  final List<Product> products;
  final bool isLoadingMore;
  const ProductPageBody({
    super.key,
    required this.products,
    required this.isLoadingMore,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
      ),
      body: ProductsGridView(
        products: products,
        isLoadingMore: isLoadingMore,
      ),
    );
  }
}
