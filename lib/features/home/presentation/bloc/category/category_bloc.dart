import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/features/home/data/models/category_model.dart';
import 'package:etahlil/features/home/domain/usescases/u_category.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<HomeEvent, CategoryState> {
  final UCategory home;

  CategoryBloc({
    required this.home,
  }) : super(HomeInitialState()) {
    on<GetCategory>(getCategory, transformer: sequential());
    on<ChangeColor>(changeColor, transformer: sequential());
  }

  FutureOr<void> getCategory(
      GetCategory event, Emitter<CategoryState> emit) async {
    emit(HomeLoadingState());
    final result = await home(
      GetCategoryParams(),
    );

    result.fold(
        (failure) => {
              if (failure is NoConnectionFailure)
                {emit(HomeFailureState())}
              else if (failure is ServerFailure)
                {emit(HomeFailureState())}
            },
        (r) => {
              if (r.isEmpty)
                {emit(HomeFailureState())}
              else
                {emit(HomeSuccessState(r, 0))}
            });
  }

  FutureOr<void> changeColor(
      ChangeColor event, Emitter<CategoryState> emit) async {
    emit(HomeSuccessState(event.list, event.index));
  }
}
