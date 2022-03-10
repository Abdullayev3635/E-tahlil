import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/features/home/data/models/sub_category_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, dynamic>> getCategory();
  Future<Either<Failure, List<SubCategoryModel>>> getSubCategory(int id);
}
