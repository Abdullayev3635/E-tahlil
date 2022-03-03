import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/features/new_history/data/models/new_history_model.dart';

abstract class NewHistoryRepository {
  Future<Either<Failure, List<NewHistoryModel>>> getNewHistory(int userId);
}
