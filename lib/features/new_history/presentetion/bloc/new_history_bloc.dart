import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/features/new_history/data/models/new_history_model.dart';
import 'package:etahlil/features/new_history/domain/usescases/u_new_history.dart';
import 'package:meta/meta.dart';

part 'new_history_event.dart';

part 'new_history_state.dart';

class NewHistoryBloc extends Bloc<NewHistoryEvent, NewHistoryState> {
  final UNewHistory newHistory;

  NewHistoryBloc({
    required this.newHistory,
  }) : super(NewHistoryInitial()) {
    on<GetNewHistoryEvent>(getHistory, transformer: sequential());
  }

  FutureOr<void> getHistory(
      GetNewHistoryEvent event, Emitter<NewHistoryState> emit) async {
    emit(NewHistoryLoading());
    final result = await newHistory(
      NewHistoryParams(userId: event.userId),
    );
    result.fold(
        (failure) => {
              if (failure is NoConnectionFailure)
                {emit(NewHistoryNoInternet())}
              else if (failure is ServerFailure)
                {emit(NewHistoryFailure(message: failure.message))}
            },
        (r) => {emit(NewHistorySuccess(list: r))});
  }
}
