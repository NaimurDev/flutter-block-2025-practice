import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_learn_bloc/features/category/bloc_contoller/category_bloc.dart';
import 'package:lets_learn_bloc/features/category/bloc_contoller/category_events.dart';
import 'package:lets_learn_bloc/features/category/bloc_contoller/category_state.dart';
import 'package:lets_learn_bloc/features/category/controller/category_cubit.dart';
import 'package:lets_learn_bloc/features/category/domain/models/category_model.dart';

class CategoryScreen extends StatefulWidget {
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    context.read<CategoryBloc>().add(FetchCategories());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CategoryScreenBody();
  }
}

class CategoryScreenBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state){
          if(state is CategoryLoading){
            return Center(child: CircularProgressIndicator());
          }
          if(state is CategoryError){
            return Center(child: Text(state.message));
          }
          if(state is CategoryLoaded){
            return CategoryList(state.categories);
          }
          return Text("Initial State");
        },
      ),
    );
  }

}

class CategoryList extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoryList(this.categories);

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        categories[index].title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          context.read<CategoryBloc>().add(DeleteCategory(categories[index].id));
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
  }
}
