part of 'sub_category_bloc.dart';

@immutable
abstract class SubCategoryState {}

class SubCategoryInitial extends SubCategoryState {}

class SubCategoryLoadingState extends SubCategoryState {}

class SubCategorySuccessState extends SubCategoryState {
  final List<SubCategoryModel> list;
  final bool isState;
  SubCategorySuccessState({required this.list, required this.isState});
}

class SubCategoryFailureState extends SubCategoryState {}
