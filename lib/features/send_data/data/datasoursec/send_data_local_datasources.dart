import 'package:etahlil/features/send_data/data/models/send_model.dart';

abstract class SendDataLocalDatasource {
  Future<void> setData(
      int userId, int subId, String title, String text, List<SendModel> images);
}

class SendDataLocalDatasourceImpl implements SendDataLocalDatasource {
  @override
  Future<void> setData(int userId, int subId, String title, String text,
      List<SendModel> images) {
    throw UnimplementedError();
  }
}
