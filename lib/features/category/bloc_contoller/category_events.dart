import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {}

class FetchCategories extends CategoryEvent {
  @override
  List<Object?> get props => [];
}

class DeleteCategory extends CategoryEvent {
  final int id;
  DeleteCategory(this.id);

  @override
  List<Object?> get props => [id];
}
