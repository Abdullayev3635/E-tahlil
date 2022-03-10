import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'not_send_event.dart';
part 'not_send_state.dart';

class NotSendBloc extends Bloc<NotSendEvent, NotSendState> {
  NotSendBloc() : super(NotSendInitial()) {
    on<NotSendEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
