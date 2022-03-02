import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/features/lock/data/datasources/lock_local_datasources.dart';
import 'package:etahlil/features/lock/domain/repositories/lock_repositories.dart';

class PassRepositoryImpl implements PassRepository {
  final PassLocalDataSourceImpl passLocalDataSource;

  PassRepositoryImpl({required this.passLocalDataSource});

  @override
  Future<Either<Failure, bool>> setCompile(String pass) async {
    try {
      final result = await passLocalDataSource.setCompile(pass);
      return Right(result);
    } on LocalFailure {
      return const Left(ServerFailure("Киритилган пароль нотўғри"));
    }
  }
}
