import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:where_am_i/data/datasources/local_data_source.dart';
import 'package:where_am_i/data/datasources/remote_data_source.dart';
import 'package:where_am_i/data/repositories/login_repository_impl.dart';
import 'package:where_am_i/domain/repositories/login_repository.dart';
import 'package:where_am_i/domain/usecases/perform_user_authentication.dart';
import 'package:where_am_i/presentation/bloc/login/login_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Number trivia
  // Bloc
  sl.registerFactory(() => LoginBloc(performUserAuthentication: sl(),checkUserAlreadyLogged:sl() ));
  // Use Cases
  sl.registerLazySingleton(() => PerformUserAuthentication(sl()));
  sl.registerLazySingleton(() => CheckUserAlreadyLogged());
  // Repository
  sl.registerLazySingleton<LoginRepository>(
      () => (LoginRepositoryImpl(
            localDataSource: sl(),
            remoteDataSource: sl(),
          )));
  // Data sources
  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: sl()));
  // Core
/*  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));*/

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
}
