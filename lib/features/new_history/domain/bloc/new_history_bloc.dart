import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_history_event.dart';
part 'new_history_state.dart';

class NewHistoryBloc extends Bloc<NewHistoryEvent, NewHistoryState> {
  NewHistoryBloc() : super(NewHistoryInitial()) {
    on<NewHistoryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
