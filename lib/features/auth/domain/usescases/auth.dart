import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/usescases/usecase.dart';
import 'package:etahlil/features/auth/data/model/auth_model.dart';
import 'package:etahlil/features/auth/domain/repositories/auth_repository.dart';

class AuthData extends UseCase<bool, AuthParams> {
  final AuthRepository authRepository;

  AuthData({required this.authRepository});

  @override
  Future<Either<Failure, bool>> call(AuthParams params) {
    return authRepository.sendAuth(params.code, params.tel, params.mac);
  }
}

class AuthParams extends Equatable {
  final String code;
  final String tel;
  final String mac;
  @override
  List<Object?> get props => [code];

  const AuthParams(this.code, this.tel, this.mac);
}
