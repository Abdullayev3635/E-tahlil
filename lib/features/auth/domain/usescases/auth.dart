import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/usescases/usecase.dart';
import 'package:etahlil/features/auth/data/model/auth_model.dart';
import 'package:etahlil/features/auth/domain/repositories/auth_repository.dart';

class AuthData extends UseCase<List<UserModel>, AuthParams> {
  final AuthRepository authRepository;

  AuthData({required this.authRepository});

  @override
  Future<Either<Failure, List<UserModel>>> call(AuthParams params) {
    return authRepository.sendAuth(params.code);
  }
}

class AuthParams extends Equatable {
  final String code;
  @override
  List<Object?> get props => [code];

  const AuthParams(this.code);
}
