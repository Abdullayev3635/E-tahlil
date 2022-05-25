import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:etahlil/features/lock/domain/usescases/u_lock.dart';
import 'package:flutter/cupertino.dart';

part 'pass_event.dart';

part 'pass_state.dart';

class PassBloc extends Bloc<PassEvent, PassState> {
  final Pass _pass;

  PassBloc({required Pass pass})
      : _pass = pass,
        super(const PassInitial("Махфий паролни киритинг")) {
    on<PassCompileEvent>(
      _nextPage,
      transformer: restartable(),
    );
  }

  FutureOr<void> _nextPage(
      PassCompileEvent event, Emitter<PassState> emit) async {
    emit(const PassLoading(""));
    final result = await _pass(PasswordParams(event.passController.text));
    result.fold(
        (f) => {
              emit(const PassError(
                  errorMessage:
                      "Киритилган пароль нотўғри илтимос қайтадан ҳаракат қилинг",
                  message: "error"))
            },
        (s) => {
          if(s){
          emit(const PassSuccess(""))
          } else {
            emit(const PassError(
                errorMessage:
                "Киритилган пароль нотўғри илтимос қайтадан ҳаракат қилинг",
                message: "error"))
          }
        });

    event.passController.clear();
  }
}
