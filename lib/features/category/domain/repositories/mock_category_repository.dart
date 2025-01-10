import 'package:lets_learn_bloc/features/category/domain/models/category_model.dart';
import 'package:lets_learn_bloc/features/category/domain/repositories/category_repository.dart';

class MockCategoryRepository implements CategoryRepository {
  
  final List<CategoryModel> _categoryList = [
    CategoryModel(
      title: 'Technology',
      id: 1,
      image: 'https://picsum.photos/id/237/200/200',
    ),
    CategoryModel(
      title: 'Science',
      id: 2,
      image: 'https://picsum.photos/id/238/200/200',
    ),
    CategoryModel(
      title: 'Art',
      id: 3,
      image: 'https://picsum.photos/id/239/200/200',
    ),
  ];

  @override
  Future<void> deleteCategory(int id) async {
   _categoryList.removeWhere((element) => element.id == id);
  }

  @override
  Future<List<CategoryModel>> fetchCategories() {
    return Future.value(List<CategoryModel>.from(_categoryList));
  }
 
}