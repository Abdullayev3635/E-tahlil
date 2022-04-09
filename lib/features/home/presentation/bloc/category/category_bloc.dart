import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/features/home/data/models/category_model1.dart';
import 'package:etahlil/features/home/domain/usescases/u_category.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/app_constants.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<HomeEvent, CategoryState> {
  final UCategory home;

  CategoryBloc({
    required this.home,
  }) : super(const HomeInitialState(isLarge: false)) {
    on<GetCategory>(getCategory, transformer: sequential());
    on<ChangeColor>(changeColor, transformer: sequential());
  }

  FutureOr<void> getCategory(
      GetCategory event, Emitter<CategoryState> emit) async {
    emit(const HomeLoadingState(isLarge: false));
    final result = await home(
      GetCategoryParams(),
    );
    final box = Hive.box(forSendBox);
    result.fold(
        (failure) => {
              if (failure is NoConnectionFailure)
                {emit(const HomeFailureState(isLarge: false))}
              else if (failure is ServerFailure)
                {emit(const HomeFailureState(isLarge: false))}
            },
        (r) => {
              if (r.isEmpty)
                {emit(const HomeFailureState1(isLarge: false))}
              else
                {emit(HomeSuccessState(list: r, selected: 0, isLarge: false, count: box.length))}
            });
  }

  FutureOr<void> changeColor(
      ChangeColor event, Emitter<CategoryState> emit) async {
    final box = Hive.box(forSendBox);
    emit(HomeSuccessState(
        list: event.list, selected: event.index, isLarge: !event.isLarge, count: box.length));
  }

}
