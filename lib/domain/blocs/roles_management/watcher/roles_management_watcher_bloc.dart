import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';
import 'package:where_am_i/domain/blocs/roles_management/actor/roles_management_actor_bloc.dart';
import 'package:where_am_i/core/utils/extensions.dart';

part 'roles_management_watcher_event.dart';

part 'roles_management_watcher_state.dart';

part 'roles_management_watcher_bloc.freezed.dart';

class RolesManagementWatcherBloc
    extends Bloc<RolesManagementWatcherEvent, RolesManagementWatcherState> {
  RolesManagementWatcherBloc(
    this._userRepository,
    this.rolesManagementActorBloc,
  ) : super(RolesManagementWatcherState.initial()) {
    _actorsSubscription = rolesManagementActorBloc.stream
        .listen((state) => _handleActorStateChange(state));
  }

  final UserRepository _userRepository;

  final RolesManagementActorBloc rolesManagementActorBloc;
  List<User> cachedUsers = List.empty();
  StreamSubscription _actorsSubscription;

  @override
  Stream<RolesManagementWatcherState> mapEventToState(
    RolesManagementWatcherEvent event,
  ) async* {
    yield* event.map(getAllUsers: (e) async* {
      yield RolesManagementWatcherState.loadInProgress();
      final users = await _userRepository.getAllUsers();
      yield users.fold(
        (l) => RolesManagementWatcherState.loadFailure(),
        (users) {
          cachedUsers = users;
          return RolesManagementWatcherState.loadSuccess(users);
        },
      );
    }, onFilterUpdate: (e) async* {
      if (e.filter != null && e.filter.isNotEmpty) {
        final filteredList = cachedUsers.where((user) {
          return e.filter.split(" ").every((pattern) =>
              user.name.containsCaseInsensitive(pattern) ||
              user.surname.containsCaseInsensitive(pattern));
        }).toList();
        yield RolesManagementWatcherState.filteredList(
          filteredList: filteredList,
          filter: e.filter,
        );
      } else {
        yield RolesManagementWatcherState.loadSuccess(cachedUsers);
      }
    }, onListUpdate: (_) async* {
      yield RolesManagementWatcherState.loadInProgress();
      yield state.maybeMap(
        orElse: () {},
        loadSuccess: (successState) =>
            successState.copyWith(users: cachedUsers),
        filteredList: (filterState) {
          final filteredList = cachedUsers.where((user) {
            return filterState.filter.split(" ").every((pattern) =>
                user.name.containsCaseInsensitive(pattern) ||
                user.surname.containsCaseInsensitive(pattern));
          }).toList();
          return filterState.copyWith(
            filteredList: List.of(filteredList),
            filter: filterState.filter,
          );
        },
      );
    });
  }

  _handleActorStateChange(RolesManagementActorState actorState) {
    actorState.maybeMap(
      orElse: () {},
      updateSuccess: (e) {
        final indexToUpdate = cachedUsers
            .indexWhere((element) => element.idResource == e.user.idResource);
        cachedUsers[indexToUpdate] = e.user;
        add(RolesManagementWatcherEvent.onListUpdate());
      },
    );
  }

  @override
  Future<void> close() {
    _actorsSubscription.cancel();
    return super.close();
  }
}
