import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/features/old_history/data/models/old_history_model.dart';
import 'package:etahlil/features/old_history/domain/usescases/u_old_history.dart';
import 'package:meta/meta.dart';

part 'old_history_event.dart';

part 'old_history_state.dart';

class OldHistoryBloc extends Bloc<OldHistoryEvent, OldHistoryState> {
  final UOldHistory oldHistory;

  OldHistoryBloc({
    required this.oldHistory,
  }) : super(OldHistoryInitial()) {
    on<GetOldHistoryEvent>(getHistory, transformer: sequential());
  }

  FutureOr<void> getHistory(
      GetOldHistoryEvent event, Emitter<OldHistoryState> emit) async {
    emit(OldHistoryLoading());
    final result = await oldHistory(
      NewHistoryParams(userId: event.userId),
    );
    result.fold(
        (failure) => {
              if (failure is NoConnectionFailure)
                {emit(OldHistoryNoInternet())}
              else if (failure is ServerFailure)
                {emit(OldHistoryFailure(message: failure.message))}
            },
        (r) => {
              if (r.isEmpty)
                {emit(OldHistoryFailure(message: "Nomalum xato"))}
              else
                {emit(OldHistorySuccess(list: r))}
            });
  }
}
