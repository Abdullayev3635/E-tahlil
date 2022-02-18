import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'send_data_event.dart';
part 'send_data_state.dart';

class SendDataBloc extends Bloc<SendDataEvent, SendDataState> {
  SendDataBloc() : super(SendDataInitial()) {
    on<SendDataEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
