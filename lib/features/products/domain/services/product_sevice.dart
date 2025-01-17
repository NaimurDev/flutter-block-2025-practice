import 'package:lets_learn_bloc/features/products/domain/models/product.dart';

abstract class ProductService{
  Future<List<Product>> getProducts({ int offset = 0});
  Future<void> deleteProduct(Product product);
}