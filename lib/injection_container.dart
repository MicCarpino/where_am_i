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
import 'package:where_am_i/domain/repositories/authentication_repository.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';
import 'package:where_am_i/domain/usecases/get_all_user_presences_to_end_of_month.dart';
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
import 'package:where_am_i/domain/usecases/workstations/insert_all_workstations.dart';
import 'package:where_am_i/domain/usecases/workstations/insert_workstation.dart';
import 'package:where_am_i/domain/usecases/workstations/remove_workstation.dart';
import 'package:where_am_i/domain/usecases/workstations/update_all_workstations.dart';
import 'package:where_am_i/domain/usecases/workstations/update_workstation.dart';
import 'package:where_am_i/domain/usecases/workstations/update_workstation_status.dart';
import 'package:where_am_i/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:where_am_i/presentation/bloc/login/login_bloc.dart';
import 'package:where_am_i/presentation/bloc/reservation/reservation_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/watcher/workstation_watcher_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/bloc/users_management/users_management_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation_assignment/workstation_assignement_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton(() => UserService());
  // Bloc
  getIt.registerLazySingleton(() => AuthenticationBloc(
        authenticationRepository: getIt(),
        performLogOut: getIt(),
      ));
  getIt.registerLazySingleton(() => LoginBloc(
        performLogIn: getIt(),
        performLogOut: getIt(),
        getLoggedUser: getIt(),
      ));
  getIt.registerFactory(() => WorkstationBloc(
        getWorkstationsByDate: getIt(),
        updateWorkstation: getIt(),
        updateAllWorkstations: getIt(),
        userService: getIt(),
      ));
  getIt.registerFactory(() => WorkstationWatcherBloc(getIt(), getIt()));
  getIt.registerFactory(() => WorkstationAssignementBloc(
        getAllUserPresencesToEndOfMonth: getIt(),
      ));
  getIt.registerFactory(() => ReservationsBloc(
        getReservations: getIt(),
        insertReservation: getIt(),
        updateReservationStatus: getIt(),
        deleteReservation: getIt(),
      ));
  getIt.registerFactory(
      () => UsersManagementBloc(getUsers: getIt(), updateUser: getIt()));

  // Use Cases
  //User
  getIt.registerLazySingleton(() => PerformLogIn(getIt()));
  getIt.registerLazySingleton(() => PerformLogOut(getIt()));
  getIt.registerLazySingleton(() => GetLoggedUser(getIt()));
  getIt.registerLazySingleton(() => GetAllUsers(getIt()));
  getIt.registerLazySingleton(() => GetUserById(getIt()));
  getIt.registerLazySingleton(() => GetAllUserByFilter(getIt()));
  getIt.registerLazySingleton(() => UpdateUser(getIt()));
  //Workstation
  getIt.registerLazySingleton(() => GetWorkstationsByDate(getIt(), getIt()));
  getIt
      .registerLazySingleton(() => GetAllUserPresencesByDate(getIt(), getIt()));
  getIt.registerLazySingleton(() => GetAllUserPresencesToEndOfMonth(getIt()));
  getIt.registerLazySingleton(() => UpdateWorkstation(getIt()));
  getIt.registerLazySingleton(() => UpdateAllWorkstations(getIt()));
  getIt.registerLazySingleton(() => UpdateWorkstationStatus(getIt()));
  getIt.registerLazySingleton(() => GetUserPresences(getIt(), getIt()));
  getIt.registerLazySingleton(() => InsertWorkstation(getIt()));
  getIt.registerLazySingleton(() => InsertAllWorkstations(getIt()));
  getIt.registerLazySingleton(() => RemoveWorkstation(getIt()));
  //Reservation
  getIt.registerLazySingleton(() => GetReservationsByDate(getIt()));
  getIt.registerLazySingleton(() => InsertReservation(getIt()));
  getIt.registerLazySingleton(() => UpdateReservation(getIt()));
  getIt.registerLazySingleton(() => DeleteReservation(getIt()));

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
  getIt.registerLazySingleton(() => sharedPreferences);
}
