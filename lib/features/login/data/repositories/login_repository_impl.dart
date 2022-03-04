import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/network/network_info.dart';
import 'package:etahlil/features/login/data/datasources/login_remote_datasources.dart';
import 'package:etahlil/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDatasourceImpl loginRemoteDatasource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl(
      {required this.loginRemoteDatasource, required this.networkInfo});

  @override
  Future<Either<Failure, String>> sendLogin(
      String tel, String macAddress) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await loginRemoteDatasource.setData(tel, macAddress);
        return Right(result);
      } on ServerFailure {
        return const Left(ServerFailure("Маълумот юкланишда хатолик бўлди"));
      }
    } else {
      return const Left(
          NoConnectionFailure("Интернет билан алоқани қайта текширинг"));
    }
  }
}
