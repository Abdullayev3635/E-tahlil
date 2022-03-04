import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/usescases/usecase.dart';
import 'package:etahlil/features/login/domain/repositories/login_repository.dart';

class LoginData extends UseCase<String, LoginParams> {
  final LoginRepository loginRepository;

  LoginData({required this.loginRepository});

  @override
  Future<Either<Failure, String>> call(LoginParams params) {
    return loginRepository.sendLogin(params.tel, params.macAddress);
  }
}

class LoginParams extends Equatable {
  final String tel;
  final String macAddress;

  @override
  List<Object?> get props => [tel, macAddress];

  const LoginParams(this.tel, this.macAddress);
}
