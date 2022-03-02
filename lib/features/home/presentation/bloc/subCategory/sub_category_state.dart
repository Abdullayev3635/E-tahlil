part of 'sub_category_bloc.dart';

@immutable
abstract class SubCategoryState {}

class SubCategoryInitial extends SubCategoryState {}

class SubCategoryLoadingState extends SubCategoryState {}

class SubCategorySuccessState extends SubCategoryState {
  final List<SubCategoryModel> list;

  SubCategorySuccessState(this.list);
}

class SubCategoryNotInternetState extends SubCategoryState {}

class SubCategoryFailureState extends SubCategoryState {}
