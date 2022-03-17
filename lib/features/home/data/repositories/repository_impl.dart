import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/network/network_info.dart';
import 'package:etahlil/features/home/data/datasources/home_local_datasources.dart';
import 'package:etahlil/features/home/data/datasources/home_remote_datasources.dart';
import 'package:etahlil/features/home/data/models/category_model1.dart';
import 'package:etahlil/features/home/data/models/sub_category_model.dart';
import 'package:etahlil/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDatasourceImpl homeRemoteDatasourceImpl;
  final CategoryLocalDataSourceImpl homeLocalDatasourceImpl;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl(
      {required this.homeRemoteDatasourceImpl,
      required this.homeLocalDatasourceImpl,
      required this.networkInfo});

  @override
  Future<Either<Failure, dynamic>> getCategory() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await homeRemoteDatasourceImpl.getCategory();
        homeLocalDatasourceImpl.setCategory(result);
        return Right(result);
      } on ServerFailure {
        return const Left(ServerFailure("Маълумот юкланишда хатолик бўлди"));
      }
    } else {
      try {
        final result = await homeLocalDatasourceImpl.getCategory();
        return Right(result);
      } on LocalFailure {
        return const Left(ServerFailure("Маълумот юкланишда хатолик бўлди"));
      }
    }
  }

  @override
  Future<Either<Failure, List<SubCategoryModel>>> getSubCategory(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await homeRemoteDatasourceImpl.getSubCategory(id);
        homeLocalDatasourceImpl.setSubCategory(result);
        return Right(result);
      } on ServerFailure {
        return const Left(ServerFailure("Маълумот юкланишда хатолик бўлди"));
      }
    } else {
      try {
        final result = await homeLocalDatasourceImpl.getSubCategory();
        return Right(result);
      } on LocalFailure {
        return const Left(ServerFailure("Маълумот юкланишда хатолик бўлди"));
      }
    }
  }
}
