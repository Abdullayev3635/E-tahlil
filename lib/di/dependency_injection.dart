import 'package:etahlil/core/network/network_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final di = GetIt.instance;
//di is referred to as Service Locator

Future<void> init() async {
  ///Blocs

  // di.registerFactory(
  //       () => UserLoginBloc(
  //     loginUser: di(),
  //     fetchToken: di(),
  //   )..add(CheckLoginStatusEvent()),
  // );

  ///Use cases

  // di.registerLazySingleton(() => LoginUser(repository: di()));


  ///Repositories

  // di.registerLazySingleton<LoginRepository>(
  //       () => LoginRepositoryImpl(
  //     networkInfo: di(),
  //     localDataSource: di(),
  //     remoteDataSource: di(),
  //   ),
  // );

  /// Data sources

  // di.registerLazySingleton<LoginRemoteDataSource>(
  //       () => LoginRemoteDataSourceImpl(
  //     restClientService: di(),
  //   ),
  // );

  // di.registerLazySingleton<LoginLocalDataSource>(
  //       () => LoginLocalDataSourceImpl(
  //     sharedPreferences: di(),
  //   ),
  // );



  /// Local cache
  final SharedPreferences sharedPreferences =
  await SharedPreferences.getInstance();
  di.registerLazySingleton(() => sharedPreferences);

  di.registerLazySingleton(() => InternetConnectionChecker());

  /// Network
  di.registerLazySingleton(() => APIWeb());

}