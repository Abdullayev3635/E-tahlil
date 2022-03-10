part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class HomeInitialState extends CategoryState {}

class HomeLoadingState extends CategoryState {}

class HomeSuccessState extends CategoryState {
  final List<CategoryModel> list;
  final int selected;

  HomeSuccessState(this.list, this.selected);
}

class HomeSuccessStateLocal extends CategoryState {
  final List<CategoryModel> list;

  HomeSuccessStateLocal(this.list);
}

class HomeFailureState extends CategoryState {}
