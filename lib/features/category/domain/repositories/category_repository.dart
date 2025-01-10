
import 'package:lets_learn_bloc/features/category/domain/models/category_model.dart';
abstract class CategoryRepository {
  Future<List<CategoryModel>> fetchCategories();
  Future<void> deleteCategory(int id);
}
