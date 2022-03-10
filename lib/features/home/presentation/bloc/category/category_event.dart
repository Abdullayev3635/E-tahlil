part of 'category_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetCategory extends HomeEvent {}

class ChangeColor extends HomeEvent {
  final List<CategoryModel> list;
  final int index;

  ChangeColor(this.list, this.index);
}
