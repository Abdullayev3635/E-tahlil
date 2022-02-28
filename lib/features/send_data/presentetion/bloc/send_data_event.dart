part of 'send_data_bloc.dart';

abstract class SendDataEvent {}

class SendDataToServerEvent extends SendDataEvent {
  int? userId;
  int? subId;
  String? title;
  String? text;
  List<SendModel>? images;

  SendDataToServerEvent(
      {required this.userId,
      required this.subId,
      required this.title,
      required this.text,
      required this.images});
}
