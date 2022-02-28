import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';

abstract class PassRepository {
  Future<Either<Failure, bool>> setCompile(String pass);
}
