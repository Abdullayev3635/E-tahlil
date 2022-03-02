part of 'send_data_bloc.dart';

@immutable
abstract class SendDataState {}

class SendDataInitial extends SendDataState {}

class SendDataLoading extends SendDataState {}

class NoConnectionSendData extends SendDataState {}

class SendDataSuccess extends SendDataState {
  late final String key;

  SendDataSuccess(this.key);
}

class SendDataFailure extends SendDataState {
  late final String error;

  SendDataFailure(this.error);
}
