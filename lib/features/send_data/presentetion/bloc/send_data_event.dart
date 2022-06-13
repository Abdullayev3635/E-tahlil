part of 'send_data_bloc.dart';

abstract class SendDataEvent {}

class SendDataToServerEvent extends SendDataEvent {
  int? userId;
  int? subId;
  int? subCategoryId;
  int? presenceOfDeputy;
  String? title;
  String? text;
  String? categoryName;
  String? subCategoryName;
  List<ImgModel>? images;

  SendDataToServerEvent(
      {required this.userId,
      required this.subId,
      required this.subCategoryId,
      required this.presenceOfDeputy,
      required this.title,
      required this.text,
      required this.categoryName,
      required this.subCategoryName,
      required this.images});
}
