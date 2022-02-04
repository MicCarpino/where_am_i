import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/domain/blocs/roles_management/watcher/roles_management_watcher_bloc.dart';
import 'package:where_am_i/domain/blocs/roles_management/actor/roles_management_actor_bloc.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';
import 'package:where_am_i/presentation/core/centered_loading.dart';
import 'package:where_am_i/presentation/core/loading_overlay.dart';
import 'package:where_am_i/presentation/core/retry_widget.dart';
import 'package:where_am_i/presentation/responsive_builder.dart';
import 'package:where_am_i/presentation/roles_management/role_management_list.dart';

import '../../injection_container.dart';

// the page where the an user with admin role che manage other resources role for the app
class RolesManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //create new instances of bloc classes used in this section
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
        listener: (context, state) {
          LoadingOverlay.dismissIfShowing(context);
          return state.maybeMap(
            //show the loading overlay when a role assignment action (api call) is in progress
            actionInProgress: (_) => LoadingOverlay.show(context),
            //show the error occurred when a role assignment action fails
            updateFailure: (e) => ResponsiveBuilder.showsErrorMessage(
              context,
              e.failure.getErrorMessageFromFailure(),
            ),
            orElse: () {},
          );
        },
        child: BlocBuilder<RolesManagementWatcherBloc,
            RolesManagementWatcherState>(
          builder: (context, state) {
            return state.map(
                initial: (_) => Container(),
                //roles fetch in progress, show loading indicator
                loadInProgress: (_) => Center(child: CenteredLoading()),
                // roles fetch successul, build the resources list
                loadSuccess: (e) => RoleManagementList(users: e.users),
                //roles fetch failed, show the retry button and define his callback
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
