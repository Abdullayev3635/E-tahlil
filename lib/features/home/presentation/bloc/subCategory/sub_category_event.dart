part of 'sub_category_bloc.dart';

@immutable
abstract class SubCategoryEvent {}

class GetSubCategoryEvent extends SubCategoryEvent {
  final int id;
  final List<CategoryModel> list;

  GetSubCategoryEvent({required this.id,required this.list});
}

class SearchSubCategoryEvent extends SubCategoryEvent {
  final String txt;

  SearchSubCategoryEvent({required this.txt});
}
