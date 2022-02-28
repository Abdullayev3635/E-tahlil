import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/usescases/usecase.dart';
import 'package:etahlil/features/send_data/data/models/send_model.dart';
import 'package:etahlil/features/send_data/domain/repository/send_data_repository.dart';

class SendData extends UseCase<bool, SendDataParams> {
  final SendDataRepository sendDataRepository;

  SendData({required this.sendDataRepository});

  @override
  Future<Either<Failure, bool>> call(SendDataParams params) {
    return sendDataRepository.sendData(
        params.userId, params.subId, params.title, params.text, params.images);
  }
}

class SendDataParams extends Equatable {
  final int userId;
  final int subId;
  final String title;
  final String text;
  final List<SendModel> images;

  @override
  List<Object?> get props => [userId, subId, title, text, images];

  SendDataParams(this.userId, this.subId, this.title, this.text, this.images);
}
