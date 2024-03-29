import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/features/send_data/data/models/img_model.dart';

abstract class SendDataRepository {
  Future<Either<Failure, bool>> sendData(
      int userId,
      int subId,
      int subCategoryId,
      int presenceOfDeputy,
      String title,
      String text,
      String categoryName,
      String subCategoryName,
      List<ImgModel> images);
}
