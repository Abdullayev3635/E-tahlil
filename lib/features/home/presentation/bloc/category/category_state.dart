part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class HomeInitialState extends CategoryState {}

class HomeLoadingState extends CategoryState {}

class HomeSuccessState extends CategoryState {
  final List<CategoryModel> list;

  HomeSuccessState(this.list);
}

class HomeNotInternetState extends CategoryState {}

class HomeFailureState extends CategoryState {}
