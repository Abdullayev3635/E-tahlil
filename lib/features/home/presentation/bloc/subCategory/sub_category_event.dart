part of 'sub_category_bloc.dart';

@immutable
abstract class SubCategoryEvent {}

class GetSubCategoryEvent extends SubCategoryEvent {
  final int id;

  GetSubCategoryEvent({required this.id});
}

class SearchSubCategoryEvent extends SubCategoryEvent {
  final String txt;

  SearchSubCategoryEvent({required this.txt});
}
