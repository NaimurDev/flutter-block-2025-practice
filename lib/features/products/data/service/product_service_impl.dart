import 'package:lets_learn_bloc/features/products/domain/models/product.dart';
import 'package:lets_learn_bloc/features/products/domain/repository/product_repository.dart';
import 'package:lets_learn_bloc/features/products/domain/services/product_sevice.dart';

class ProductServiceImpl implements ProductService{
  final ProductRepository productRepository;

  ProductServiceImpl({required this.productRepository});
  
  @override
  Future<void> deleteProduct(Product product) {
   return productRepository.deleteProduct(product);
  }

  @override
  Future<List<Product>> getProducts() {
    return productRepository.getProducts();
  }

}