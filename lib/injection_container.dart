import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:where_am_i/data/repositories/reservation_repository_impl.dart';
import 'package:where_am_i/domain/repositories/reservation_repository.dart';
import 'package:where_am_i/domain/usecases/get_all_users_presences_by_date.dart';
import 'package:where_am_i/domain/usecases/get_users.dart';
import 'package:where_am_i/domain/usecases/get_workstations_by_id_resource.dart';
import 'package:where_am_i/domain/usecases/update_user_presences.dart';
import 'package:where_am_i/presentation/bloc/users/users_bloc.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/usecases/get_logged_user.dart';

import 'package:where_am_i/data/datasources/local_data_source.dart';
import 'package:where_am_i/data/datasources/remote_data_source.dart';
import 'package:where_am_i/data/repositories/workstation_repository_impl.dart';
import 'package:where_am_i/data/repositories/auth_repository_impl.dart';
import 'package:where_am_i/domain/repositories/auth_repository.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';
import 'package:where_am_i/domain/usecases/get_reservations_by_date.dart';
import 'package:where_am_i/domain/usecases/get_workstations_by_date.dart';
import 'package:where_am_i/domain/usecases/perform_log_in.dart';
import 'package:where_am_i/domain/usecases/perform_log_out.dart';
import 'package:where_am_i/presentation/bloc/home/home_bloc.dart';
import 'package:where_am_i/presentation/bloc/login/login_bloc.dart';
import 'package:where_am_i/presentation/bloc/reservation/reservation_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => LoginBloc(performLogIn: sl()));
  sl.registerFactory(() => HomeBloc(performLogOut: sl()));
  sl.registerFactory(() => WorkstationBloc(
      getWorkstationsByDate: sl(),
      getWorkstationsByIdResource: sl(),
      getAllUserPresencesByDate: sl(),
      updateUserPresences: sl()));
  sl.registerFactory(() => ReservationsBloc(getReservations: sl()));
  sl.registerFactory(() => UsersBloc(getUsers: sl()));

  // Use Cases
  //User
  sl.registerLazySingleton(() => PerformLogIn(sl()));
  sl.registerLazySingleton(() => PerformLogOut(sl()));
  sl.registerLazySingleton(() => GetLoggedUser(sl()));
  sl.registerLazySingleton(() => GetAllUsers(sl()));
  //Workstation
  sl.registerLazySingleton(() => GetWorkstationsByDate(sl(), sl()));
  sl.registerLazySingleton(() => GetWorkstationsByIdResource(sl()));
  sl.registerLazySingleton(() => GetAllUserPresencesByDate(sl(), sl()));
  sl.registerLazySingleton(() => UpdateUserPresences(sl()));
  //Reservation
  sl.registerLazySingleton(() => GetReservationsByDate(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => (AuthRepositoryImpl(
        localDataSource: sl(),
        remoteDataSource: sl(),
      )));
  sl.registerLazySingleton<UserRepository>(() => (UserRepositoryImpl(
        localDataSource: sl(),
        remoteDataSource: sl(),
      )));
  sl.registerLazySingleton<WorkstationRepository>(
      () => (WorkstationRepositoryImpl(
            localDataSource: sl(),
            remoteDataSource: sl(),
          )));
  sl.registerLazySingleton<ReservationRepository>(
      () => (ReservationRepositoryImpl(
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
