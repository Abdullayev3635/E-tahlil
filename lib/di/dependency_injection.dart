import 'package:etahlil/core/network/network_info.dart';
import 'package:etahlil/features/lock/data/datasources/lock_local_datasources.dart';
import 'package:etahlil/features/lock/data/repositories/lock_repositories.dart';
import 'package:etahlil/features/lock/domain/bloc/pass_bloc.dart';
import 'package:etahlil/features/lock/domain/repositories/lock_repositories.dart';
import 'package:etahlil/features/lock/domain/usescases/u_lock.dart';
import 'package:etahlil/features/send_data/data/datasoursec/send_data_local_datasources.dart';
import 'package:etahlil/features/send_data/data/datasoursec/send_data_remote_datasources.dart';
import 'package:etahlil/features/send_data/data/repositories/send_data_repository.dart';
import 'package:etahlil/features/send_data/domain/repository/send_data_repository.dart';
import 'package:etahlil/features/send_data/domain/usescase/u_send_data.dart';
import 'package:etahlil/features/send_data/presentetion/bloc/send_data_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final di = GetIt.instance;
//di is referred to as Service Locator

Future<void> init() async {
  /// Blocs
  // sendData
  di.registerFactory(
    () => SendDataBloc(
      sendData: di(),
    ),
  );
  //lock
  di.registerFactory(
    () => PassBloc(
      pass: di(),
    ),
  );

  ///Repositories
  // sendData
  di.registerLazySingleton<SendDataRepository>(
    () => SendDataRepositoryImpl(networkInfo: di(), dataRemoteDatasource: di()),
  );
  // lock
  di.registerLazySingleton<PassRepository>(
    () => PassRepositoryImpl(passLocalDataSource: di()),
  );

  /// UsesCases
  // sendData
  di.registerLazySingleton(() => SendData(sendDataRepository: di()));
  // lock
  di.registerLazySingleton(() => Pass(repository: di()));

  /// Data sources

  //send data
  di.registerLazySingleton<SendDataLocalDatasource>(
    () => SendDataLocalDatasourceImpl(),
  );
  di.registerLazySingleton<SendDataRemoteDatasource>(
    () => SendDataRemoteDatasourceImpl(networkInfo: di()),
  );
  //lock
  di.registerLazySingleton(() => PassLocalDataSource(sharedPreferences: di()));

  /// Network Info
  di.registerLazySingleton(() => InternetConnectionChecker());

  di.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(di()));

  /// Local cache
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  di.registerLazySingleton(() => sharedPreferences);
}
