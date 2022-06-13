import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/usescases/usecase.dart';
import 'package:etahlil/features/kutilmoqda/data/model/not_send_model1.dart';
import 'package:etahlil/features/kutilmoqda/domain/repository/yuborilmagan_repository.dart';

class NotSendLocal extends UseCase<List<NotSendModel>, NotSendParamsLocal> {
  final NotSendRepository notSendRepository;

  NotSendLocal({required this.notSendRepository});

  @override
  Future<Either<Failure, List<NotSendModel>>> call(NotSendParamsLocal params) {
    return notSendRepository.getNotSends();
  }
}

class NotSendParamsLocal extends Equatable {
  @override
  List<Object?> get props => [];
}
