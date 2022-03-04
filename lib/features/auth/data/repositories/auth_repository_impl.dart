import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/network/network_info.dart';
import 'package:etahlil/features/auth/data/datasources/auth_locat_datasources.dart';
import 'package:etahlil/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:etahlil/features/auth/data/model/auth_model.dart';
import 'package:etahlil/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasourceImpl authRemoteDatasource;
  final AuthLocalDataSourceImpl authLocalDatasource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl(
      {required this.authRemoteDatasource,
      required this.authLocalDatasource,
      required this.networkInfo});

  @override
  Future<Either<Failure, bool>> sendAuth(
      String code, String tel, String mac) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await authRemoteDatasource.setData(code, tel, mac);
        if (result == "0") {
          return const Right(false);
        } else {
          try {
            final resultLocal = await authLocalDatasource.setDataLocal(result);
            return Right(resultLocal);
          } on LocalFailure {
            return const Left(LocalFailure("маълумотлар нотўғри"));
          }
        }
      } on ServerFailure {
        return const Left(ServerFailure("Маълумот юкланишда хатолик бўлди"));
      } on InputFormatterFailure {
        return const Left(InputFormatterFailure("Маълумотда хатолик бўлди"));
      }
    } else {
      return const Left(
          NoConnectionFailure("Интернет билан алоқани қайта текширинг"));
    }
  }
}
