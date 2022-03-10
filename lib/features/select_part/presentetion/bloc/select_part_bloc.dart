import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/features/home/data/models/category_model.dart';
import 'package:etahlil/features/home/data/models/sub_category_model.dart';
import 'package:etahlil/features/select_part/domain/usescases/u_select_part.dart';
import 'package:etahlil/features/select_part/domain/usescases/u_select_sub_part.dart';
import 'package:meta/meta.dart';

part 'select_part_event.dart';

part 'select_part_state.dart';

class SelectPartBloc extends Bloc<SelectPartEvent, SelectPartState> {
  final USelectPart uSelectPart;
  final USelectSubPart uSelectSubPart;
  late List<CategoryModel> listOld;
  late List<SubCategoryModel> listSubOld;

  SelectPartBloc({
    required this.uSelectPart,
    required this.uSelectSubPart,
  }) : super(SelectPartInitial()) {
    on<GetSelectPartEvent>(getPart, transformer: sequential());
    on<GetSelectSubPartEvent>(getSubPart, transformer: sequential());
    on<FilterSelectPartEvent>(getFilterPart, transformer: sequential());
    on<FilterSelectSubPartEvent>(getFilterSubPart, transformer: sequential());
  }

  FutureOr<void> getPart(
      GetSelectPartEvent event, Emitter<SelectPartState> emit) async {
    emit(SelectPartLoading());
    final result = await uSelectPart(
      const SelectPartParams(userId: 0),
    );
    result.fold(
        (failure) => {
              if (failure is NoConnectionFailure)
                {emit(SelectPartNoInternet())}
              else if (failure is ServerFailure)
                {emit(SelectPartFailure(message: failure.message))}
            },
        (r) => {
              emit(SelectPartSuccess(list: r)),
              listOld = r,
            });
  }

  FutureOr<void> getSubPart(
      GetSelectSubPartEvent event, Emitter<SelectPartState> emit) async {
    emit(SelectPartLoading());
    final result = await uSelectSubPart(
      SelectSubPartParams(categoryId: event.categoryId),
    );
    result.fold(
        (failure) => {
              if (failure is NoConnectionFailure)
                {emit(SelectPartNoInternet())}
              else if (failure is ServerFailure)
                {emit(SelectPartFailure(message: failure.message))}
            },
        (r) => {
              emit(SelectSubPartSuccess(list: r)),
              listSubOld = r,
            });
  }

  FutureOr<void> getFilterPart(
      FilterSelectPartEvent event, Emitter<SelectPartState> emit) async {
    if (event.text.isEmpty) {
      emit(SelectPartSuccess(list: listOld));
    } else {
      emit(SelectPartSuccess(
          list: listOld.where((element) {
        final titleLower = element.name!.toLowerCase();
        final searchLower = event.text.toLowerCase();
        return titleLower.contains(searchLower);
      }).toList()));
    }
  }

  FutureOr<void> getFilterSubPart(
      FilterSelectSubPartEvent event, Emitter<SelectPartState> emit) async {
    if (event.text.isEmpty) {
      emit(SelectSubPartSuccess(list: listSubOld));
    } else {
      emit(SelectSubPartSuccess(
          list: listSubOld.where((element) {
        final titleLower = element.name!.toLowerCase();
        final searchLower = event.text.toLowerCase();
        return titleLower.contains(searchLower);
      }).toList()));
    }
  }
}
