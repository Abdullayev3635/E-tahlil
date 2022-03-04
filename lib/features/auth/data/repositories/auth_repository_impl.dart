import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/network/network_info.dart';
import 'package:etahlil/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:etahlil/features/auth/data/model/auth_model.dart';
import 'package:etahlil/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasourceImpl authRemoteDatasource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl(
      {required this.authRemoteDatasource, required this.networkInfo});

  @override
  Future<Either<Failure, List<UserModel>>> sendAuth(String code) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await authRemoteDatasource.setData(code);
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
