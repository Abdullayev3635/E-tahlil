part of 'old_history_bloc.dart';

@immutable
abstract class OldHistoryEvent {}

class GetOldHistoryEvent extends OldHistoryEvent {
  final String startData;
  final String endData;
  final int categoryId;
  final int subCategoryId;

  GetOldHistoryEvent(
      {required this.startData,
      required this.endData,
      required this.categoryId,
      required this.subCategoryId});
}
