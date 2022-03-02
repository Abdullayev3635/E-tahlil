import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/features/home/data/models/sub_caregory_model.dart';
import 'package:etahlil/features/home/domain/usescases/u_sub_category.dart';
import 'package:meta/meta.dart';

part 'sub_category_event.dart';

part 'sub_category_state.dart';

class SubCategoryBloc extends Bloc<SubCategoryEvent, SubCategoryState> {
  final USubCategory subCategory;

  SubCategoryBloc({
    required this.subCategory,
  }) : super(SubCategoryInitial()) {
    on<GetSubCategoryEvent>(getSubCategory, transformer: sequential());
  }

  FutureOr<void> getSubCategory(
      GetSubCategoryEvent event, Emitter<SubCategoryState> emit) async {
    emit(SubCategoryLoadingState());
    final result = await subCategory(
      GetSubCategoryParams(id: event.id),
    );
    result.fold(
        (failure) => {
              if (failure is NoConnectionFailure)
                {emit(SubCategoryNotInternetState())}
              else if (failure is ServerFailure)
                {emit(SubCategoryFailureState())}
            },
        (r) => {
              if (r.isEmpty)
                {emit(SubCategoryFailureState())}
              else
                {emit(SubCategorySuccessState(r))}
            });
  }
}
