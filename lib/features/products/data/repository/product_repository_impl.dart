import 'dart:convert';

import 'package:lets_learn_bloc/core/http_client.dart';
import 'package:lets_learn_bloc/features/products/domain/models/product.dart';
import 'package:lets_learn_bloc/features/products/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository{
  final HttpClient client;

  ProductRepositoryImpl({required this.client});

  @override
  Future<void> deleteProduct(Product product) async{
    client.delete('/products/${product.id}');
  }

  @override
  Future<List<Product>> getProducts() async{
    final resp = await client.get('/products', queryParams: {'limit': '10', 'offset': '0'});
    if(resp.statusCode == 200){
      final List<dynamic> body = json.decode(resp.body);
      return body.map((e) => Product.fromJson(e)).toList();
    }else{
      throw HttpException(
        resp.statusCode,
        'Failed to load products',
      );
    }
  }

}