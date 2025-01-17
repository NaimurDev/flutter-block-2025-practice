
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_learn_bloc/features/products/controller/product_bloc.dart';
import 'package:lets_learn_bloc/features/products/controller/product_bloc_event.dart';
import 'package:lets_learn_bloc/features/products/domain/models/product.dart';
import 'package:lets_learn_bloc/features/products/presentation/widgets/product_card.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {

  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollControllerListener);
    super.initState();
  }

  _scrollControllerListener(){
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      print("reach the bottom, call next products");
      context.read<ProductBloc>().add(LoadNextProducts());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.75,
      ),
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        final product = widget.products[index];
        return ProductCard(product: product);
      },
    );
  }
}
