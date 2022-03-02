import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/network/network_info.dart';
import 'package:etahlil/features/home/data/datasources/home_remote_datasources.dart';
import 'package:etahlil/features/home/data/models/category_model.dart';
import 'package:etahlil/features/home/data/models/sub_caregory_model.dart';
import 'package:etahlil/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDatasourceImpl homeRemoteDatasourceImpl;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl(
      {required this.homeRemoteDatasourceImpl, required this.networkInfo});

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategory() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await homeRemoteDatasourceImpl.getCategory();
        return Right(result);
      } on ServerFailure {
        return const Left(ServerFailure("Маълумот юкланишда хатолик бўлди"));
      }
    } else {
      return const Left(
          NoConnectionFailure("Интернет билан алоқани қайта текширинг"));
    }
  }

  @override
  Future<Either<Failure, List<SubCategoryModel>>> getSubCategory(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await homeRemoteDatasourceImpl.getSubCategory(id);
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
