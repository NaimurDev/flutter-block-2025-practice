import 'package:equatable/equatable.dart';
import 'package:lets_learn_bloc/features/products/domain/models/product.dart';

abstract class ProductBlocState extends Equatable {
  const ProductBlocState();
}

class ProductBlocInitial extends ProductBlocState {
  @override
  List<Object> get props => [];
}

class ProductBlocLoading extends ProductBlocState {
  @override
  List<Object> get props => [];
}

class ProductBlocLoaded extends ProductBlocState {
  final List<Product> products;

  const ProductBlocLoaded({required this.products});

  @override
  List<Object> get props => [products];
}

class ProductBlocError extends ProductBlocState {
  final String message;

  const ProductBlocError({required this.message});

  @override
  List<Object> get props => [message];
}

