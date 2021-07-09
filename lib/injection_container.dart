import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:where_am_i/data/datasources/local_data_source.dart';
import 'package:where_am_i/data/datasources/remote_data_source.dart';
import 'package:where_am_i/data/repositories/workstation_repository_impl.dart';
import 'package:where_am_i/data/repositories/auth_repository_impl.dart';
import 'package:where_am_i/data/repositories/reservation_repository_impl.dart';
import 'package:where_am_i/data/repositories/user_repository_impl.dart';
import 'package:where_am_i/domain/repositories/reservation_repository.dart';
import 'package:where_am_i/domain/repositories/authentication_repository.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';
import 'package:where_am_i/domain/usecases/perform_log_out.dart';
import 'package:where_am_i/domain/usecases/users/get_all_user_by_filter.dart';
import 'package:where_am_i/domain/usecases/users/get_all_users.dart';
import 'package:where_am_i/domain/usecases/users/get_logged_user.dart';
import 'package:where_am_i/domain/usecases/users/get_user_by_id.dart';
import 'package:where_am_i/domain/blocs/authentication/authentication_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Bloc
  getIt.registerLazySingleton(() => AuthenticationBloc(
        authenticationRepository: getIt(),
        performLogOut: getIt(),
      ));

  // Use Cases
  //User
  getIt.registerLazySingleton(() => PerformLogOut(getIt()));
  getIt.registerLazySingleton(() => GetLoggedUser(getIt()));
  getIt.registerLazySingleton(() => GetAllUsers(getIt()));
  getIt.registerLazySingleton(() => GetUserById(getIt()));
  getIt.registerLazySingleton(() => GetAllUserByFilter(getIt()));
  // Repository
  getIt.registerLazySingleton<AuthenticationRepository>(
      () => (AuthRepositoryImpl(
            localDataSource: getIt(),
            remoteDataSource: getIt(),
          )));
  getIt.registerLazySingleton<UserRepository>(() => (UserRepositoryImpl(
        localDataSource: getIt(),
        remoteDataSource: getIt(),
      )));
  getIt.registerLazySingleton<WorkstationRepository>(
      () => (WorkstationRepositoryImpl(
            localDataSource: getIt(),
            remoteDataSource: getIt(),
          )));
  getIt.registerLazySingleton<ReservationRepository>(
      () => (ReservationRepositoryImpl(
            localDataSource: getIt(),
            remoteDataSource: getIt(),
          )));
  // Data sources
  getIt.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(sharedPreferences: getIt()));

  getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(
      onRevoke: () => getIt<AuthenticationBloc>().add(
            AuthenticationTokenExpired(),
          )));
  // Core
/*  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));*/

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}
