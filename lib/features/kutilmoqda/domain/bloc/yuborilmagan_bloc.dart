import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'yuborilmagan_event.dart';
part 'yuborilmagan_state.dart';

class YuborilmaganBloc extends Bloc<YuborilmaganEvent, YuborilmaganState> {
  YuborilmaganBloc() : super(YuborilmaganInitial()) {
    on<YuborilmaganEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
