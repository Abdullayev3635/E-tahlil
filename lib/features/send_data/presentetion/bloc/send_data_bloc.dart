import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/features/send_data/data/models/img_model.dart';
import 'package:etahlil/features/send_data/domain/usescase/u_send_data.dart';
import 'package:flutter/cupertino.dart';

part 'send_data_event.dart';

part 'send_data_state.dart';

class SendDataBloc extends Bloc<SendDataEvent, SendDataState> {
  final SendData sendData;

  SendDataBloc({required this.sendData}) : super(SendDataInitial()) {
    on<SendDataToServerEvent>(_sendData, transformer: restartable());
  }

  FutureOr<void> _sendData(
      SendDataToServerEvent event, Emitter<SendDataState> emit) async {
    emit(SendDataLoading());
    final result = await sendData(
      SendDataParams(
        event.userId!,
        event.subId!,
        event.subCategoryId!,
        event.presenceOfDeputy!,
        event.title!,
        event.text!,
        event.images!,
      ),
    );
    result.fold(
        (failure) => {
              if (failure is NoConnectionFailure)
                emit(SendDataFailure(failure.message))
              else if (failure is ServerFailure)
                emit(SendDataFailure(failure.message))
            },
        (r) => {
              if (r)
                {emit(SendDataSuccess("Success"))}
              else
                {emit(SendDataFailure("Nomalum xato"))}
            });
  }
}
