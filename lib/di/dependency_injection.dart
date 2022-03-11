import 'package:etahlil/core/network/network_info.dart';
import 'package:etahlil/core/photo/image_picker_utils.dart';
import 'package:etahlil/core/location/location_service.dart';
import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/features/auth/data/datasources/auth_locat_datasources.dart';
import 'package:etahlil/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:etahlil/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:etahlil/features/auth/domain/repositories/auth_repository.dart';
import 'package:etahlil/features/auth/domain/usescases/auth.dart';
import 'package:etahlil/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:etahlil/features/home/data/datasources/home_local_datasources.dart';
import 'package:etahlil/features/home/data/datasources/home_remote_datasources.dart';
import 'package:etahlil/features/home/data/models/category_model.dart';
import 'package:etahlil/features/home/data/models/sub_category_model.dart';
import 'package:etahlil/features/home/data/repositories/repository_impl.dart';
import 'package:etahlil/features/home/domain/repositories/home_repository.dart';
import 'package:etahlil/features/home/domain/usescases/u_category.dart';
import 'package:etahlil/features/home/domain/usescases/u_sub_category.dart';
import 'package:etahlil/features/home/presentation/bloc/category/category_bloc.dart';
import 'package:etahlil/features/home/presentation/bloc/subCategory/sub_category_bloc.dart';
import 'package:etahlil/features/kutilmoqda/data/datasoursec/yuborilmagan_local_datasources.dart';
import 'package:etahlil/features/kutilmoqda/data/model/not_send_model.dart';
import 'package:etahlil/features/kutilmoqda/data/repositories/yuborilmagan_repository_impl.dart';
import 'package:etahlil/features/kutilmoqda/domain/repository/yuborilmagan_repository.dart';
import 'package:etahlil/features/kutilmoqda/domain/usescases/u_not_send.dart';
import 'package:etahlil/features/kutilmoqda/domain/usescases/u_not_send_local.dart';
import 'package:etahlil/features/kutilmoqda/presentetion/bloc/not_send_bloc.dart';
import 'package:etahlil/features/lock/data/datasources/lock_local_datasources.dart';
import 'package:etahlil/features/lock/data/repositories/lock_repositories.dart';
import 'package:etahlil/features/lock/domain/bloc/pass_bloc.dart';
import 'package:etahlil/features/lock/domain/repositories/lock_repositories.dart';
import 'package:etahlil/features/lock/domain/usescases/u_lock.dart';
import 'package:etahlil/features/login/data/datasources/login_locat_datasources.dart';
import 'package:etahlil/features/login/data/datasources/login_remote_datasources.dart';
import 'package:etahlil/features/login/data/repositories/login_repository_impl.dart';
import 'package:etahlil/features/login/domain/repositories/login_repository.dart';
import 'package:etahlil/features/login/domain/usescases/u_login.dart';
import 'package:etahlil/features/login/presentation/bloc/login_bloc.dart';
import 'package:etahlil/features/new_history/data/datasoursec/new_history_local_datasources.dart';
import 'package:etahlil/features/new_history/data/datasoursec/new_history_remote_datasources.dart';
import 'package:etahlil/features/new_history/data/models/new_history_model.dart';
import 'package:etahlil/features/new_history/data/repositories/new_history_remository_impl.dart';
import 'package:etahlil/features/new_history/domain/repository/new_history_repository.dart';
import 'package:etahlil/features/new_history/domain/usescases/u_new_history.dart';
import 'package:etahlil/features/new_history/presentetion/bloc/new_history_bloc.dart';
import 'package:etahlil/features/old_history/data/datasoursec/old_history_local_datasources.dart';
import 'package:etahlil/features/old_history/data/datasoursec/old_history_remote_datasources.dart';
import 'package:etahlil/features/old_history/data/models/old_history_model.dart';
import 'package:etahlil/features/old_history/data/repositories/old_history_remository_impl.dart';
import 'package:etahlil/features/old_history/domain/repository/old_history_repository.dart';
import 'package:etahlil/features/old_history/domain/usescases/u_old_history.dart';
import 'package:etahlil/features/old_history/presentetion/bloc/old_history_bloc.dart';
import 'package:etahlil/features/profile/data/datasources/profile_local_datasources.dart';
import 'package:etahlil/features/profile/data/datasources/profile_remote_datasources.dart';
import 'package:etahlil/features/profile/data/models/prof_model.dart';
import 'package:etahlil/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:etahlil/features/profile/domain/usescases/u_profile.dart';
import 'package:etahlil/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:etahlil/features/select_part/data/datasoursec/select_part_local_datasources.dart';
import 'package:etahlil/features/select_part/data/datasoursec/select_part_remote_datasources.dart';
import 'package:etahlil/features/select_part/data/repositories/select_part_remository_impl.dart';
import 'package:etahlil/features/select_part/domain/repository/select_part_repository.dart';
import 'package:etahlil/features/select_part/domain/usescases/u_select_part.dart';
import 'package:etahlil/features/select_part/domain/usescases/u_select_sub_part.dart';
import 'package:etahlil/features/select_part/presentetion/bloc/select_part_bloc.dart';
import 'package:etahlil/features/send_data/data/datasoursec/send_data_local_datasources.dart';
import 'package:etahlil/features/send_data/data/datasoursec/send_data_remote_datasources.dart';
import 'package:etahlil/features/send_data/data/models/img_model.dart';
import 'package:etahlil/features/send_data/data/repositories/send_data_repositoryimpl.dart';
import 'package:etahlil/features/send_data/domain/repository/send_data_repository.dart';
import 'package:etahlil/features/send_data/domain/usescase/u_send_data.dart';
import 'package:etahlil/features/send_data/presentetion/bloc/send_data_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
  //auth
  di.registerFactory(
    () => AuthBloc(authData: di()),
  );
  //profile
  di.registerFactory(
    () => ProfileBloc(profData: di()),
  );
  //selects
  di.registerFactory(
    () => SelectPartBloc(uSelectPart: di(), uSelectSubPart: di()),
  );
  //not send
  di.registerFactory(
    () => NotSendBloc(notSend: di(), notSendLocal: di()),
  );

  ///Repositories
  // sendData
  di.registerLazySingleton<SendDataRepository>(
    () => SendDataRepositoryImpl(
        networkInfo: di(),
        dataRemoteDatasource: di(),
        sharedPreferences: di(),
        dataLocalDatasource: di()),
  );
  // lock
  di.registerLazySingleton<PassRepository>(
    () => PassRepositoryImpl(passLocalDataSource: di()),
  );

  // home
  di.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
        networkInfo: di(),
        homeRemoteDatasourceImpl: di(),
        homeLocalDatasourceImpl: di()),
  );

  // new history
  di.registerLazySingleton<NewHistoryRepository>(
    () => NewHistoryRepositoryImpl(
        networkInfo: di(),
        newHistoryRemoteDatasourceImpl: di(),
        newHistoryLocalDatasourceImpl: di()),
  );
  // old history
  di.registerLazySingleton<OldHistoryRepository>(
    () => OldHistoryRepositoryImpl(
        networkInfo: di(),
        oldHistoryRemoteDatasourceImpl: di(),
        oldHistoryLocalDatasourceImpl: di()),
  );
  // login
  di.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
        networkInfo: di(),
        loginRemoteDatasource: di(),
        loginLocalDatasource: di()),
  );
  // auth
  di.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
        networkInfo: di(),
        authRemoteDatasource: di(),
        authLocalDatasource: di()),
  );
  // profile
  di.registerLazySingleton(
    () => ProfRepositoryImpl(
        networkInfo: di(),
        profRemoteDatasource: di(),
        profLocalDatasource: di()),
  );
  // selects
  di.registerLazySingleton<SelectPartRepository>(
    () => SelectPartRepositoryImpl(
      networkInfo: di(),
      selectPartRemoteDatasourceImpl: di(),
      selectPartLocalDatasourceImpl: di(),
    ),
  );
  // not send
  di.registerLazySingleton<NotSendRepository>(
    () => NotSendRepositoryImpl(notSendDataSourcesImpl: di()),
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
  //auth
  di.registerLazySingleton(() => AuthData(authRepository: di()));
  //profile
  di.registerLazySingleton(() => ProfData(profRepository: di()));
  //selects
  di.registerLazySingleton(() => USelectPart(selectPartRepo: di()));
  //selects
  di.registerLazySingleton(() => USelectSubPart(selectPartRepo: di()));
  //selects
  di.registerLazySingleton(() => NotSend(notSendRepository: di()));
  di.registerLazySingleton(() => NotSendLocal(notSendRepository: di()));

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
    () => NewHistoryRemoteDatasourceImpl(di()),
  );
  di.registerLazySingleton(
    () => NewHistoryDataSourcesImpl(),
  );
  //old history
  di.registerLazySingleton(
    () => OldHistoryRemoteDatasourceImpl(di()),
  );
  di.registerLazySingleton(
    () => OldHistoryDataSourcesImpl(),
  );
  //home
  di.registerLazySingleton(
    () => HomeRemoteDatasourceImpl(sharedPreferences: di()),
  );
  di.registerLazySingleton(
    () => CategoryLocalDataSourceImpl(),
  );
  //login
  di.registerLazySingleton(
    () => LoginRemoteDatasourceImpl(),
  );
  //login
  di.registerLazySingleton(
    () => LoginLocalDataSourceImpl(sharedPreferences: di()),
  );
  //auth
  di.registerLazySingleton(
    () => AuthRemoteDatasourceImpl(),
  );
  //auth
  di.registerLazySingleton(
    () => AuthLocalDataSourceImpl(sharedPreferences: di()),
  );
  //profile
  di.registerLazySingleton(
    () => ProfRemoteDatasourceImpl(),
  );
  di.registerLazySingleton(
    () => ProfileLocalDataSourcesImpl(),
  );
  //selects
  di.registerLazySingleton(
    () => SelectPartRemoteDatasourceImpl(sharedPreferences: di()),
  );
  di.registerLazySingleton<SelectPartLocalDatasource>(
    () => SelectPartLocalDatasourceImpl(),
  );
  //not send
  di.registerLazySingleton(
    () => NotSendDataSourcesImpl(),
  );

  /// Image picker
  di.registerLazySingleton<ImagePickerUtils>(() => ImagePickerUtilsImpl());

  /// Location Service
  di.registerLazySingleton<LocationService>(() => LocationServiceImpl());

  /// Network Info
  di.registerLazySingleton(() => InternetConnectionChecker());

  di.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(di()));

  /// Local cache
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  di.registerLazySingleton(() => sharedPreferences);

  /// Local datasource
  await Hive.initFlutter();
  // home
  Hive.registerAdapter(CategoryModelAdapter());
  await Hive.openBox(categoryBox);

  Hive.registerAdapter(SubCategoryModelAdapter());
  await Hive.openBox(subCategoryBox);
  // new history
  Hive.registerAdapter(NewHistoryModelAdapter());
  await Hive.openBox(newHistoryBox);
  // old history
  Hive.registerAdapter(OldHistoryModelAdapter());
  await Hive.openBox(oldHistoryBox);
  // profile
  Hive.registerAdapter(ProfModelAdapter());
  await Hive.openBox<ProfModel>(profileBox);
  // notSendData
  Hive.registerAdapter(NotSendModelAdapter());
  Hive.registerAdapter(ImgModelAdapter());
  await Hive.openBox(forSendBox);
}
