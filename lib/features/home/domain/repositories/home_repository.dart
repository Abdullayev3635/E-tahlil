import 'package:dartz/dartz.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/features/home/data/models/category_model.dart';
import 'package:etahlil/features/home/data/models/sub_caregory_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CategoryModel>>> getCategory();
  Future<Either<Failure, List<SubCategoryModel>>> getSubCategory(int id);
}
