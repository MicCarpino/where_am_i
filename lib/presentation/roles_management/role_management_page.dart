import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/domain/blocs/roles_management/watcher/roles_management_watcher_bloc.dart';
import 'package:where_am_i/domain/blocs/roles_management/actor/roles_management_actor_bloc.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';
import 'package:where_am_i/presentation/core/centered_loading.dart';
import 'package:where_am_i/presentation/core/retry_widget.dart';
import 'package:where_am_i/presentation/responsive_builder.dart';
import 'package:where_am_i/presentation/roles_management/role_management_list.dart';

import '../../injection_container.dart';

class RolesManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RolesManagementActorBloc>(
          create: (_) => RolesManagementActorBloc(getIt<UserRepository>()),
        ),
        BlocProvider<RolesManagementWatcherBloc>(
          create: (context) => RolesManagementWatcherBloc(
              getIt<UserRepository>(), context.read<RolesManagementActorBloc>())
            ..add(RolesManagementWatcherEvent.getAllUsers()),
        ),
      ],
      child: BlocListener<RolesManagementActorBloc, RolesManagementActorState>(
        listener: (context, state) => state.maybeMap(
            orElse: () {},
            updateFailure: (e) => ResponsiveBuilder.showsErrorMessage(
                  context,
                  e.failure.getErrorMessageFromFailure(),
                )),
        child: BlocBuilder<RolesManagementWatcherBloc,
            RolesManagementWatcherState>(
          builder: (context, state) {
            return state.map(
                initial: (_) => Container(),
                loadInProgress: (_) => Center(child: CenteredLoading()),
                loadSuccess: (e) => RoleManagementList(users: e.users),
                loadFailure: (_) => Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: RetryWidget(
                          onTryAgainPressed: () => context
                              .read<RolesManagementWatcherBloc>()
                              .add(RolesManagementWatcherEvent.getAllUsers())),
                    )),
                filteredList: (e) => RoleManagementList(users: e.filteredList));
          },
        ),
      ),
    );
  }
}
