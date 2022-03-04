import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/features/login/domain/usescases/u_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginData loginData;

  LoginBloc({required this.loginData}) : super(LoginInitial()) {
    on<SendLoginEvent>(_sendLogin, transformer: sequential());
  }

  FutureOr<void> _sendLogin(
      SendLoginEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final result = await loginData(
      LoginParams(event.tel, await getMac()),
    );
    result.fold(
        (failure) => {
              if (failure is NoConnectionFailure)
                emit(NoConnectionLogin())
              else if (failure is ServerFailure)
                emit(LoginFailure(failure.message))
            },
        (r) => {
              if (r == "1")
                {emit(LoginSuccess("Success"))}
              else if (r == "500")
                {emit(NoUser())}
            });
  }

  Future<String> getMac() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String macAddress = "";
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      macAddress = '${androidInfo.androidId}';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      macAddress = '${iosInfo.utsname.machine}';
    }
    return macAddress;
  }
}
