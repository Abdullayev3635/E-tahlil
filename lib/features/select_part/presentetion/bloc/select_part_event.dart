part of 'select_part_bloc.dart';

@immutable
abstract class SelectPartEvent {}

class GetSelectPartEvent extends SelectPartEvent {}

class GetSelectSubPartEvent extends SelectPartEvent {
  final String categoryId;

  GetSelectSubPartEvent(this.categoryId);
}

class FilterSelectPartEvent extends SelectPartEvent {
  final List<CategoryModel> list;
  final String text;

  FilterSelectPartEvent({required this.list, required this.text});
}

class FilterSelectSubPartEvent extends SelectPartEvent {
  final List<SubCategoryModel> list;
  final String text;

  FilterSelectSubPartEvent({required this.list, required this.text});
}
