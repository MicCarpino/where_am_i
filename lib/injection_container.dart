import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:where_am_i/data/user_service.dart';

import 'package:where_am_i/data/datasources/local_data_source.dart';
import 'package:where_am_i/data/datasources/remote_data_source.dart';
import 'package:where_am_i/data/repositories/workstation_repository_impl.dart';
import 'package:where_am_i/data/repositories/auth_repository_impl.dart';
import 'package:where_am_i/data/repositories/reservation_repository_impl.dart';
import 'package:where_am_i/data/repositories/user_repository_impl.dart';
import 'package:where_am_i/domain/repositories/reservation_repository.dart';
import 'package:where_am_i/domain/repositories/auth_repository.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';
import 'package:where_am_i/domain/usecases/get_workstations_by_date.dart';
import 'package:where_am_i/domain/usecases/perform_log_in.dart';
import 'package:where_am_i/domain/usecases/perform_log_out.dart';
import 'package:where_am_i/domain/usecases/get_all_users_presences_by_date.dart';
import 'package:where_am_i/domain/usecases/reservations/delete_reservation.dart';
import 'package:where_am_i/domain/usecases/reservations/get_reservations_by_date.dart';
import 'package:where_am_i/domain/usecases/reservations/insert_reservation.dart';
import 'package:where_am_i/domain/usecases/reservations/update_reservation_status.dart';
import 'package:where_am_i/domain/usecases/users/get_all_user_by_filter.dart';
import 'package:where_am_i/domain/usecases/users/get_all_users.dart';
import 'package:where_am_i/domain/usecases/users/get_logged_user.dart';
import 'package:where_am_i/domain/usecases/users/get_user_by_id.dart';
import 'package:where_am_i/domain/usecases/users/update_user.dart';
import 'package:where_am_i/domain/usecases/workstations/get_user_presences.dart';
import 'package:where_am_i/domain/usecases/workstations/insert_workstation.dart';
import 'package:where_am_i/domain/usecases/workstations/remove_workstation.dart';
import 'package:where_am_i/domain/usecases/workstations/update_workstation.dart';
import 'package:where_am_i/presentation/bloc/home/home_bloc.dart';
import 'package:where_am_i/presentation/bloc/login/login_bloc.dart';
import 'package:where_am_i/presentation/bloc/reservation/reservation_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/bloc/my_presences/my_presences_bloc.dart';
import 'package:where_am_i/presentation/bloc/presences_management/presences_management_bloc.dart';
import 'package:where_am_i/presentation/bloc/users_management/users_management_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => UserService());
  // Bloc
  sl.registerFactory(() => LoginBloc(performLogIn: sl()));
  sl.registerFactory(() => HomeBloc(performLogOut: sl()));
  sl.registerFactory(() => WorkstationBloc(
        getWorkstationsByDate: sl(),
        updateWorkstation: sl(),
        userService: sl(),
      ));
  sl.registerFactory(() => ReservationsBloc(
        getReservations: sl(),
        insertReservation: sl(),
        updateReservationStatus: sl(),
        deleteReservation: sl(),
      ));
  sl.registerFactory(
      () => UsersManagementBloc(getUsers: sl(), updateUser: sl()));
  sl.registerFactory(() => PresencesManagementBloc(
        getAllUserPresencesByDate: sl(),
        insertUserPresence: sl(),
        updateUserPresence: sl(),
        removeUserPresence: sl(),
      ));
  sl.registerFactory(() => MyPresencesBloc(
        getUserPresences: sl(),
        insertUserPresence: sl(),
        updateUserPresence: sl(),
        removeUserPresence: sl(),
        getLoggedUser: sl(),
      ));

  // Use Cases
  //User
  sl.registerLazySingleton(() => PerformLogIn(sl()));
  sl.registerLazySingleton(() => PerformLogOut(sl()));
  sl.registerLazySingleton(() => GetLoggedUser(sl()));
  sl.registerLazySingleton(() => GetAllUsers(sl()));
  sl.registerLazySingleton(() => GetUserById(sl()));
  sl.registerLazySingleton(() => GetAllUserByFilter(sl()));
  sl.registerLazySingleton(() => UpdateUser(sl()));
  //Workstation
  sl.registerLazySingleton(() => GetWorkstationsByDate(sl(), sl()));
  sl.registerLazySingleton(() => GetAllUserPresencesByDate(sl(), sl()));
  sl.registerLazySingleton(() => UpdateWorkstation(sl()));
  sl.registerLazySingleton(() => GetUserPresences(sl(), sl()));
  sl.registerLazySingleton(() => InsertWorkstation(sl()));
  sl.registerLazySingleton(() => RemoveWorkstation(sl()));
  //Reservation
  sl.registerLazySingleton(() => GetReservationsByDate(sl()));
  sl.registerLazySingleton(() => InsertReservation(sl()));
  sl.registerLazySingleton(() => UpdateReservation(sl()));
  sl.registerLazySingleton(() => DeleteReservation(sl()));

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

  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
  // Core
/*  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));*/

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
