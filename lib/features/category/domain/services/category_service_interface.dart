import 'package:lets_learn_bloc/features/category/domain/models/category_model.dart';

abstract class CategoryServiceInterface {
  Future<void> deleteCategory(int id);
  Future<List<CategoryModel>> fetchCategories();
}