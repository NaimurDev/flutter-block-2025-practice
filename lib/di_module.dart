import 'package:get_it/get_it.dart';
import 'package:lets_learn_bloc/features/category/bloc_contoller/category_bloc.dart';
import 'package:lets_learn_bloc/features/category/domain/repositories/category_repository.dart';
import 'package:lets_learn_bloc/features/category/domain/repositories/real_category_repository.dart';
import 'package:lets_learn_bloc/features/category/domain/services/category_service.dart';
import 'package:lets_learn_bloc/features/category/domain/services/category_service_interface.dart';

final getIt = GetIt.instance;

void setup() {
  // repositories
  getIt.registerSingleton<CategoryRepository>(RealCategoryRepository());

  // services
  getIt.registerSingleton<CategoryServiceInterface>(
    CategoryMockService(
      categoryRepository: getIt<CategoryRepository>(),
    ),
  );

  // bloc
  getIt.registerFactory<CategoryBloc>(() => CategoryBloc(
        getIt<CategoryServiceInterface>(),
  ));
}
