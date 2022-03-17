import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/features/kutilmoqda/data/model/not_send_model.dart';
import 'package:etahlil/features/kutilmoqda/domain/usescases/u_not_send.dart';
import 'package:etahlil/features/kutilmoqda/domain/usescases/u_not_send_local.dart';
import 'package:meta/meta.dart';


part 'not_send_event.dart';

part 'not_send_state.dart';

class NotSendBloc extends Bloc<NotSendEvent, NotSendState> {
  final NotSend notSend;
  final NotSendLocal notSendLocal;

  NotSendBloc({
    required this.notSend,
    required this.notSendLocal,
  }) : super(NotSendInitial()) {
    on<GetNotSendEvent>(getNotSend, transformer: sequential());
    on<SetNotSendEvent>(setNotSend, transformer: sequential());
  }

  FutureOr<void> getNotSend(
      GetNotSendEvent event, Emitter<NotSendState> emit) async {
    emit(NotSendLoading());
    final result = await notSendLocal(
      NotSendParamsLocal(),
    );
    result.fold(
        (failure) => {
              if (failure is NoConnectionFailure)
                {emit(NotSendFailure(message: failure.message))}
              else if (failure is ServerFailure)
                {emit(NotSendFailure(message: failure.message))}
            },
        (r) => {emit(NotSendSuccess(list: r))});
  }

  FutureOr<void> setNotSend(
      SetNotSendEvent event, Emitter<NotSendState> emit) async {
    emit(NotSendLoading());
    final result = await notSend(
      NotSendParams(
        event.notSendModel,
      ),
    );
    result.fold(
        (failure) => {
              if (failure is NoConnectionFailure)
                {emit(NotSendFailure(message: failure.message))}
              else if (failure is ServerFailure)
                {emit(NotSendFailure(message: failure.message))}
            },
        (r) => {emit(NotSendSuccess(list: r))});
  }
}
