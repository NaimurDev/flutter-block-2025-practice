import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_learn_bloc/features/products/controller/product_bloc_event.dart';
import 'package:lets_learn_bloc/features/products/controller/product_bloc_state.dart';
import 'package:lets_learn_bloc/features/products/domain/models/product.dart';
import 'package:lets_learn_bloc/features/products/domain/services/product_sevice.dart';

class ProductBloc extends Bloc<ProductBlocEvent, ProductBlocState>{
  int currentOffset = 0;
  final ProductService productService;

  ProductBloc(this.productService) : super(ProductBlocInitial()){
    on<LoadProducts>(_loadEvent);
    on<LoadNextProducts>(_loadNextEvent);
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

  void _loadNextEvent(LoadNextProducts event, Emitter<ProductBlocState> emit) async {
  if (state is ProductBlocLoaded) {
    final currentState = state as ProductBlocLoaded;
    currentOffset += 10;

    // Emit state indicating that loading more products has started
    emit(ProductBlocLoaded(
      products: currentState.products,
      isLoadingMore: true,
    ));

    try {
      final newProducts = await productService.getProducts(offset: currentOffset);
      final allProducts = List<Product>.from(currentState.products)..addAll(newProducts);
      
      emit(ProductBlocLoaded(
        products: allProducts,
        isLoadingMore: false,
      ));
    } catch (e) {
      emit(ProductBlocError(message: e.toString()));
    }
  }
}
}