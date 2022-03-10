import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/usescases/usecase.dart';
import 'package:etahlil/features/home/data/models/category_model.dart';
import 'package:etahlil/features/home/domain/repositories/home_repository.dart';

class UCategory extends UseCase<dynamic, GetCategoryParams> {
  final HomeRepository homeRepository;

  UCategory({required this.homeRepository});

  @override
  Future<Either<Failure, dynamic>> call(GetCategoryParams params) {
    return homeRepository.getCategory();
  }
}

class GetCategoryParams extends Equatable {
  @override
  List<Object?> get props => [];
}
