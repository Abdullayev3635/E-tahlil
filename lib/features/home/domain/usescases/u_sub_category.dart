import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/usescases/usecase.dart';
import 'package:etahlil/features/home/data/models/category_model.dart';
import 'package:etahlil/features/home/data/models/sub_caregory_model.dart';
import 'package:etahlil/features/home/domain/repositories/home_repository.dart';

class USubCategory
    extends UseCase<List<SubCategoryModel>, GetSubCategoryParams> {
  final HomeRepository homeRepository;

  USubCategory({required this.homeRepository});

  @override
  Future<Either<Failure, List<SubCategoryModel>>> call(
      GetSubCategoryParams params) {
    return homeRepository.getSubCategory(params.id!);
  }
}

class GetSubCategoryParams extends Equatable {
  final int? id;
  const GetSubCategoryParams({required this.id});
  @override
  List<Object?> get props => [id];
}
