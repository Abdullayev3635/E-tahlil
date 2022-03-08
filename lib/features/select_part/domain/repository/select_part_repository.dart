import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';

abstract class SelectPartRepository {
  Future<Either<Failure, dynamic>> getSelectPart(int userId);
  Future<Either<Failure, dynamic>> getSelectSubPart(String categoryId);
}
