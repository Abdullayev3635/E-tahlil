import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/features/kutilmoqda/data/model/not_send_model1.dart';


abstract class NotSendRepository {
  Future<Either<Failure, List<NotSendModel>>> getNotSends();
  Future<Either<Failure, dynamic>> setNotSends(NotSendModel notSendModel,);
}
