import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/features/auth/data/model/auth_model.dart';
import 'package:etahlil/features/auth/domain/usescases/auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthData authData;

  AuthBloc({required this.authData}) : super(AuthInitial()) {
    on<SendSMSEvent>(_sendSms, transformer: sequential());
  }

  FutureOr<void> _sendSms(SendSMSEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await authData(
      AuthParams(event.sms, event.tel, await getMac()),
    );
    result.fold(
        (failure) => {
              if (failure is NoConnectionFailure)
                emit(AuthNoInternet())
              else if (failure is ServerFailure)
                emit(AuthFailure(failure.message))
              else if (failure is InputFormatterFailure)
                emit(AuthFailure(failure.message))
            },
        (r) => {
              if (r) {emit(AuthSuccess("Success"))} else {emit(AuthError())}
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
