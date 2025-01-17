import 'package:get_it/get_it.dart';
import 'package:lets_learn_bloc/core/constants.dart';
import 'package:lets_learn_bloc/core/http_client.dart';
import 'package:lets_learn_bloc/features/category/bloc_contoller/category_bloc.dart';
import 'package:lets_learn_bloc/features/category/domain/repositories/category_repository.dart';
import 'package:lets_learn_bloc/features/category/domain/repositories/real_category_repository.dart';
import 'package:lets_learn_bloc/features/category/domain/services/category_service.dart';
import 'package:lets_learn_bloc/features/category/domain/services/category_service_interface.dart';
import 'package:lets_learn_bloc/features/products/controller/product_bloc.dart';
import 'package:lets_learn_bloc/features/products/data/repository/product_repository_impl.dart';
import 'package:lets_learn_bloc/features/products/data/service/product_service_impl.dart';
import 'package:lets_learn_bloc/features/products/domain/repository/product_repository.dart';
import 'package:lets_learn_bloc/features/products/domain/services/product_sevice.dart';

final getIt = GetIt.instance;

void setup() {
  // http client
  getIt.registerLazySingleton<HttpClient>(
    () => HttpClient(baseUrl: Constants.BASE_URL),
  );

  // repositories
  getIt.registerSingleton<CategoryRepository>(RealCategoryRepository());

  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(client: getIt()),
  );

  // services
  getIt.registerSingleton<CategoryServiceInterface>(
    CategoryMockService(
      categoryRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton<ProductService>(
      () => ProductServiceImpl(productRepository: getIt()));

  // bloc
  getIt.registerFactory<CategoryBloc>(() => CategoryBloc(
        getIt<CategoryServiceInterface>(),
      ));

  getIt.registerFactory<ProductBloc>(
    () => ProductBloc(
      getIt(),
    ),
  );
}
