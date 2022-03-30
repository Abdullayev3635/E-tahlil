import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/features/home/data/models/sub_category_model.dart';
import 'package:etahlil/features/home/domain/usescases/u_sub_category.dart';
import 'package:meta/meta.dart';

part 'sub_category_event.dart';

part 'sub_category_state.dart';

class SubCategoryBloc extends Bloc<SubCategoryEvent, SubCategoryState> {
  final USubCategory subCategory;

  List<SubCategoryModel> subList = [];
  bool isStatus = false;

  SubCategoryBloc({
    required this.subCategory,
  }) : super(SubCategoryInitial()) {
    on<GetSubCategoryEvent>(getSubCategory, transformer: sequential());
    on<SearchSubCategoryEvent>(filterFun, transformer: sequential());
  }

  FutureOr<void> getSubCategory(
      GetSubCategoryEvent event, Emitter<SubCategoryState> emit) async {
    subList.clear();
    emit(SubCategoryLoadingState());
    final result = await subCategory(
      GetSubCategoryParams(id: event.id),
    );
    result.fold(
        (failure) => {
              if (failure is NoConnectionFailure)
                {emit(SubCategoryFailureState())}
              else if (failure is ServerFailure)
                {emit(SubCategoryFailureState())}
            },
        (r) => {
              if (r.isEmpty)
                {emit(SubCategoryFailureState())}
              else
                {
                  for (int i = 0; r.length > i; i++)
                    {
                      if (event.id == r[i].categoryId)
                        {
                          subList.add(r[i]),
                        },
                      if (r[i].status == "1")
                        {
                          isStatus = true,
                        }
                    },
                  emit(SubCategorySuccessState(
                      list: subList, isState: isStatus)),
                }
            });
  }

  FutureOr<void> filterFun(
      SearchSubCategoryEvent event, Emitter<SubCategoryState> emit) async {
    emit(SubCategoryLoadingState());
    if (event.txt.isEmpty) {
      emit(SubCategorySuccessState(list: subList, isState: isStatus));
    } else {
      emit(SubCategorySuccessState(
          list: subList.where((element) {
            final titleLower = element.name!.toLowerCase();
            final searchLower = event.txt.toLowerCase();
            return titleLower.contains(searchLower);
          }).toList(),
          isState: isStatus));
    }
  }
}
