
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_learn_bloc/features/category/bloc_contoller/category_bloc.dart';
import 'package:lets_learn_bloc/features/category/controller/category_cubit.dart';
import 'package:lets_learn_bloc/features/category/domain/repositories/mock_category_repository.dart';
import 'package:lets_learn_bloc/features/category/domain/repositories/real_category_repository.dart';
import 'package:lets_learn_bloc/features/category/presentation/pages/category_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance<CategoryBloc>(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: CategoryScreen(),
      ),
    );
  }
}

