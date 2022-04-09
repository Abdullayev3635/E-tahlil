part of 'category_bloc.dart';

@immutable
abstract class CategoryState {
  final bool isLarge;

  const CategoryState({required this.isLarge});
}

class HomeInitialState extends CategoryState {
  const HomeInitialState({required bool isLarge}) : super(isLarge: isLarge);
}

class HomeLoadingState extends CategoryState {
  const HomeLoadingState({required bool isLarge}) : super(isLarge: isLarge);
}

class HomeSuccessState extends CategoryState {
  final List<CategoryModel> list;
  final int selected;
  final int count;

  const HomeSuccessState(
      {required this.list,
      required this.selected,
      required bool isLarge,
      required this.count})
      : super(isLarge: isLarge);
}

class HomeFailureState extends CategoryState {
  const HomeFailureState({required bool isLarge}) : super(isLarge: isLarge);
}

class HomeFailureState1 extends CategoryState {
  const HomeFailureState1({required bool isLarge}) : super(isLarge: isLarge);
}
