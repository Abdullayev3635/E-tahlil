import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/features/kutilmoqda/data/model/not_send_model1.dart';
import 'package:etahlil/features/send_data/data/models/img_model.dart';
import 'package:hive/hive.dart';

abstract class SendDataLocalDatasource {
  Future<bool> setData(
      String userId,
      int subId,
      int subCategoryId,
      int presenceOfDeputy,
      String title,
      String text,
      String categoryName,
      String subCategoryName,
      List<ImgModel> images);
}

class SendDataLocalDatasourceImpl implements SendDataLocalDatasource {
  @override
  Future<bool> setData(
      String userId,
      int subId,
      int subCategoryId,
      int presenceOfDeputy,
      String title,
      String text,
      String categoryName,
      String subCategoryName,
      List<ImgModel> images) async {
    NotSendModel list = NotSendModel(
      userId: userId.toString(),
      categoryId: subId.toString(),
      subCategoryId: subCategoryId.toString(),
      orinbosarIshtirokida: presenceOfDeputy.toString(),
      title: title,
      text: text,
      categoryName: categoryName,
      subCategoryName: subCategoryName,
      imagesList: images,
    );
    try {
      final box = Hive.box(forSendBox);
      box.add(list);
      return true;
    } catch (e) {
      return false;
    }
  }
}
