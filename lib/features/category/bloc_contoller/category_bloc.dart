// category_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_learn_bloc/features/category/bloc_contoller/category_events.dart';
import 'package:lets_learn_bloc/features/category/bloc_contoller/category_state.dart';
import 'package:lets_learn_bloc/features/category/domain/services/category_service_interface.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryServiceInterface categoryService;

  CategoryBloc(this.categoryService): super(CategoryInitial()){
    on<FetchCategories>(_onFetchCategories);
    on<DeleteCategory>(_onDeleteCategory);
  }
  
  Future<void> _onFetchCategories(event, emit) async{
    emit(CategoryLoading());
    await Future.delayed(Duration(seconds: 2));
    final categories = await this.categoryService.fetchCategories();
    emit(CategoryLoaded(categories));
  }

  Future<void> _onDeleteCategory(event, emit) async{
    this.categoryService.deleteCategory(event.id);
    final categories = await this.categoryService.fetchCategories();
    emit(CategoryLoaded(categories));
  }
}