import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_learn_bloc/features/products/controller/product_bloc_event.dart';
import 'package:lets_learn_bloc/features/products/controller/product_bloc_state.dart';
import 'package:lets_learn_bloc/features/products/domain/services/product_sevice.dart';

class ProductBloc extends Bloc<ProductBlocEvent, ProductBlocState>{
  final ProductService productService;

  ProductBloc(this.productService) : super(ProductBlocInitial()){
    on<LoadProducts>(_loadEvent);
    on<DeleteProduct>(_deleteEvent);
  }
  
  void _loadEvent(event, emit) async{
    emit(ProductBlocLoading());
    try{
      final products = await productService.getProducts();
      emit(ProductBlocLoaded(products: products));
    }catch(e){
      emit(ProductBlocError(message: e.toString()));
    }
  }

  _deleteEvent(event, emit) async{
    emit(ProductBlocLoading());
    try{
      await productService.deleteProduct(event.productId);
      final products = await productService.getProducts();
      emit(ProductBlocLoaded(products: products));
    }catch(e){
      emit(ProductBlocError(message: e.toString()));
    }
  }
}