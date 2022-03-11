import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/features/kutilmoqda/data/datasoursec/yuborilmagan_local_datasources.dart';
import 'package:etahlil/features/kutilmoqda/data/model/not_send_model.dart';
import 'package:etahlil/features/kutilmoqda/domain/repository/yuborilmagan_repository.dart';

class NotSendRepositoryImpl extends NotSendRepository {
  final NotSendDataSourcesImpl notSendDataSourcesImpl;

  NotSendRepositoryImpl({required this.notSendDataSourcesImpl});

  @override
  Future<Either<Failure, List<NotSendModel>>> getNotSends() async {
    try {
      final result = await notSendDataSourcesImpl.getNotSends();
      return Right(result);
    } on LocalFailure {
      return const Left(ServerFailure("Маълумот юкланишда хатолик бўлди"));
    }
  }

  @override
  Future<Either<Failure, bool>> setNotSends(List<NotSendModel> list) {
    // TODO: implement setNotSends
    throw UnimplementedError();
  }
}
