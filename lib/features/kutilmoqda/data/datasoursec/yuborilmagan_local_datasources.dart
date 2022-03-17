import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/features/kutilmoqda/data/model/not_send_model.dart';
import 'package:hive/hive.dart';

abstract class NotSendDataSources {
  Future<List<NotSendModel>> getNotSends();
  Future<List<NotSendModel>> getDeleted(NotSendModel notSendModel);
}

class NotSendDataSourcesImpl extends NotSendDataSources {
  @override
  Future<List<NotSendModel>> getNotSends() async {
    try {
      final box = Hive.box(forSendBox);
      final eventsFromHive = box.values.toList().cast<NotSendModel>();
      return eventsFromHive;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<NotSendModel>> getDeleted(NotSendModel notSendModel) async {
    try {
      final box = Hive.box(forSendBox);
      box.delete(notSendModel.key);
      final eventsFromHive = box.values.toList().cast<NotSendModel>();
      return eventsFromHive;
    } catch (e) {
      return [];
    }
  }
}
