import 'package:lets_learn_bloc/features/category/domain/models/category_model.dart';
import 'package:lets_learn_bloc/features/category/domain/repositories/mock_category_repository.dart';
import 'package:lets_learn_bloc/features/category/domain/repositories/category_repository.dart';
import 'package:lets_learn_bloc/features/category/domain/services/category_service_interface.dart';

class CategoryMockService implements CategoryServiceInterface{
  final CategoryRepository _categoryRepository;

  CategoryMockService({required CategoryRepository categoryRepository}) : _categoryRepository = categoryRepository;
  
  @override
  Future<void> deleteCategory(int id) async{
   _categoryRepository.deleteCategory(id);
  }

  @override
  Future<List<CategoryModel>> fetchCategories() async{
    return _categoryRepository.fetchCategories();
  }

}