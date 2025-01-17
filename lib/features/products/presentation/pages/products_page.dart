import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_learn_bloc/features/products/controller/product_bloc.dart';
import 'package:lets_learn_bloc/features/products/controller/product_bloc_event.dart';
import 'package:lets_learn_bloc/features/products/controller/product_bloc_state.dart';
import 'package:lets_learn_bloc/features/products/presentation/pages/product_page_body.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {

  @override
  void initState() {
    context.read<ProductBloc>().add(LoadProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductBlocState>(
        builder: (context, state) {
      if (state is ProductBlocLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is ProductBlocError) {
        return Center(child: Text(state.message));
      }
      if (state is ProductBlocLoaded) {
        return ProductPageBody(
          products: state.products,
          isLoadingMore: state.isLoadingMore,
        );
      }
      return ProductPageBody(
        products: [],
        isLoadingMore: false,
      );
    });
  }
}
