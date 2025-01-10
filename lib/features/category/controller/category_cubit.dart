import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_learn_bloc/features/category/domain/models/category_model.dart';
import 'package:lets_learn_bloc/features/category/domain/services/category_service_interface.dart';

class CategoryCubit extends Cubit<List<CategoryModel>>{
  final CategoryServiceInterface categoryService;
  CategoryCubit(this.categoryService) : super([]);

  void fetchCategories() async {
    try {
    final categories = await categoryService.fetchCategories();
    emit(categories);
  } catch (e) {
    print('Error fetching categories: $e');
    // Handle the error, maybe emit an error state
  }
  }

  void deleteCategory(int id) async {
    try {
    print("DELETE: Deleting category with id: $id");
    await categoryService.deleteCategory(id);
    final categories = await categoryService.fetchCategories();
    print("DELETE: AFTER DELETE: $categories");
    emit(categories);
  } catch (e) {
    print('Error deleting category: $e');
    // Handle the error, maybe emit an error state
  }
  }
}