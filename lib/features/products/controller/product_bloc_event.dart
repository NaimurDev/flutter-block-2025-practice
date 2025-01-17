import 'package:equatable/equatable.dart';

abstract class ProductBlocEvent extends Equatable {
  const ProductBlocEvent();
}

class LoadProducts extends ProductBlocEvent {
  @override
  List<Object> get props => [];
}

class DeleteProduct extends ProductBlocEvent {
  final int productId;

  const DeleteProduct({required this.productId});

  @override
  List<Object> get props => [productId];
}

