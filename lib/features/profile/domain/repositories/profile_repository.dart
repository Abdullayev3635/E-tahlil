import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';

abstract class ProfRepository {
  Future<Either<Failure, dynamic>> getProf(String userId);
}
