import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'old_history_event.dart';
part 'old_history_state.dart';

class OldHistoryBloc extends Bloc<OldHistoryEvent, OldHistoryState> {
  OldHistoryBloc() : super(OldHistoryInitial()) {
    on<OldHistoryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
