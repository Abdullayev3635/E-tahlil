import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/usescases/usecase.dart';
import 'package:etahlil/features/kutilmoqda/data/model/not_send_model.dart';
import 'package:etahlil/features/kutilmoqda/domain/repository/yuborilmagan_repository.dart';

class NotSend extends UseCase<bool, NotSendParams> {
  final NotSendRepository notSendRepository;

  NotSend({required this.notSendRepository});

  @override
  Future<Either<Failure, bool>> call(NotSendParams params) {
    return notSendRepository.setNotSends(params.lists);
  }
}

class NotSendParams extends Equatable {
  final List<NotSendModel> lists;

  @override
  List<Object?> get props => [lists];

  const NotSendParams(this.lists);
}
