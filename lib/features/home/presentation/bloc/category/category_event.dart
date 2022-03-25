part of 'category_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetCategory extends HomeEvent {}


class ChangeColor extends HomeEvent {
  final List<CategoryModel> list;
  final int index;
  final int count;
  final bool isLarge;

  ChangeColor(this.list, this.index, this.count, this.isLarge);
}
