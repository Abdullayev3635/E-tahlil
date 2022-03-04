import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/features/auth/data/model/auth_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, List<UserModel>>> sendAuth(String code);
}
