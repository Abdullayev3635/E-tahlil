part of 'select_part_bloc.dart';

@immutable
abstract class SelectPartState {}

class SelectPartInitial extends SelectPartState {}

class SelectPartLoading extends SelectPartState {}

class SelectPartSuccess extends SelectPartState {
  final List<CategoryModel> list;

  SelectPartSuccess({required this.list});
}

class SelectSubPartSuccess extends SelectPartState {
  final List<SubCategoryModel> list;

  SelectSubPartSuccess({required this.list});
}

class SelectPartNoInternet extends SelectPartState {}

class SelectPartFailure extends SelectPartState {
  final String message;

  SelectPartFailure({required this.message});
}
