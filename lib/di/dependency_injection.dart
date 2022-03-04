import 'package:etahlil/core/network/network_info.dart';
import 'package:etahlil/features/home/data/datasources/home_remote_datasources.dart';
import 'package:etahlil/features/home/data/repositories/repository_impl.dart';
import 'package:etahlil/features/home/domain/repositories/home_repository.dart';
import 'package:etahlil/features/home/domain/usescases/u_category.dart';
import 'package:etahlil/features/home/domain/usescases/u_sub_category.dart';
import 'package:etahlil/features/home/presentation/bloc/category/category_bloc.dart';
import 'package:etahlil/features/home/presentation/bloc/subCategory/sub_category_bloc.dart';
import 'package:etahlil/features/lock/data/datasources/lock_local_datasources.dart';
import 'package:etahlil/features/lock/data/repositories/lock_repositories.dart';
import 'package:etahlil/features/lock/domain/bloc/pass_bloc.dart';
import 'package:etahlil/features/lock/domain/repositories/lock_repositories.dart';
import 'package:etahlil/features/lock/domain/usescases/u_lock.dart';
import 'package:etahlil/features/login/data/datasources/login_remote_datasources.dart';
import 'package:etahlil/features/login/data/repositories/login_repository_impl.dart';
import 'package:etahlil/features/login/domain/repositories/login_repository.dart';
import 'package:etahlil/features/login/domain/usescases/u_login.dart';
import 'package:etahlil/features/login/presentation/bloc/login_bloc.dart';
import 'package:etahlil/features/new_history/data/datasoursec/new_history_remote_datasources.dart';
import 'package:etahlil/features/new_history/data/repositories/new_history_remository_impl.dart';
import 'package:etahlil/features/new_history/domain/repository/new_history_repository.dart';
import 'package:etahlil/features/new_history/domain/usescases/u_new_history.dart';
import 'package:etahlil/features/new_history/presentetion/bloc/new_history_bloc.dart';
import 'package:etahlil/features/old_history/data/datasoursec/old_history_remote_datasources.dart';
import 'package:etahlil/features/old_history/data/repositories/old_history_remository_impl.dart';
import 'package:etahlil/features/old_history/domain/repository/old_history_repository.dart';
import 'package:etahlil/features/old_history/domain/usescases/u_old_history.dart';
import 'package:etahlil/features/old_history/presentetion/bloc/old_history_bloc.dart';
import 'package:etahlil/features/send_data/data/datasoursec/send_data_local_datasources.dart';
import 'package:etahlil/features/send_data/data/datasoursec/send_data_remote_datasources.dart';
import 'package:etahlil/features/send_data/data/repositories/send_data_repositoryimpl.dart';
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
  //home
  di.registerFactory(
    () => CategoryBloc(home: di()),
  );
  di.registerFactory(
    () => SubCategoryBloc(subCategory: di()),
  );
  //new history
  di.registerFactory(
    () => NewHistoryBloc(newHistory: di()),
  );
  //old history
  di.registerFactory(
    () => OldHistoryBloc(oldHistory: di()),
  );
  //login
  di.registerFactory(
    () => LoginBloc(loginData: di()),
  );

  ///Repositories
  // sendData
  di.registerLazySingleton<SendDataRepository>(
    () => SendDataRepositoryImpl(
        networkInfo: di(),
        dataRemoteDatasource: di(),
        dataLocalDatasource: di()),
  );
  // lock
  di.registerLazySingleton<PassRepository>(
    () => PassRepositoryImpl(passLocalDataSource: di()),
  );

  // home
  di.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(networkInfo: di(), homeRemoteDatasourceImpl: di()),
  );

  // new history
  di.registerLazySingleton<NewHistoryRepository>(
    () => NewHistoryRepositoryImpl(
        networkInfo: di(), newHistoryRemoteDatasourceImpl: di()),
  );
  // old history
  di.registerLazySingleton<OldHistoryRepository>(
    () => OldHistoryRepositoryImpl(
        networkInfo: di(), oldHistoryRemoteDatasourceImpl: di()),
  );
  // login
  di.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(networkInfo: di(), loginRemoteDatasource: di()),
  );

  /// UsesCases
  // sendData
  di.registerLazySingleton(() => SendData(sendDataRepository: di()));
  // lock
  di.registerLazySingleton(() => Pass(repository: di()));
  // home
  di.registerLazySingleton(() => UCategory(homeRepository: di()));
  di.registerLazySingleton(() => USubCategory(homeRepository: di()));
  //new history
  di.registerLazySingleton(() => UNewHistory(newHistoryRepo: di()));
  //old history
  di.registerLazySingleton(() => UOldHistory(oldHistoryRepo: di()));
  //login
  di.registerLazySingleton(() => LoginData(loginRepository: di()));

  /// Data sources
  //send data
  di.registerLazySingleton(
    () => SendDataRemoteDatasourceImpl(),
  );
  di.registerLazySingleton(
    () => SendDataLocalDatasourceImpl(),
  );
  //lock
  di.registerLazySingleton(
    () => PassLocalDataSourceImpl(sharedPreferences: di()),
  );
  //new history
  di.registerLazySingleton(
    () => NewHistoryRemoteDatasourceImpl(),
  );
  //old history
  di.registerLazySingleton(
    () => OldHistoryRemoteDatasourceImpl(),
  );
  //home
  di.registerLazySingleton(
    () => HomeRemoteDatasourceImpl(),
  );
  //login
  di.registerLazySingleton(
    () => LoginRemoteDatasourceImpl(),
  );

  /// Network Info
  di.registerLazySingleton(() => InternetConnectionChecker());

  di.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(di()));

  /// Local cache
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  di.registerLazySingleton(() => sharedPreferences);
}
