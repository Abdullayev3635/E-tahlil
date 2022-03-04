import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';

abstract class LoginRepository {
  Future<Either<Failure, String>> sendLogin(String tel, String macAddress);
}
