import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/features/old_history/data/models/old_history_model.dart';

abstract class OldHistoryRepository {
  Future<Either<Failure, List<OldHistoryModel>>> getOldHistory(int userId);
}
