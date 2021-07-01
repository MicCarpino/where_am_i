import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/domain/blocs/authentication/authentication_bloc.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/presentation/home/drawer/mobile_drawer_item.dart';
import 'package:where_am_i/presentation/responsive_builder.dart';

import 'desktop_drawer_item.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({@required this.device});

  final DeviceType device;

  @override
  Widget build(BuildContext context) {
    final User loggedUser = BlocProvider.of<AuthenticationBloc>(context)
        .state
        .authenticatedUser
        .user;
    final drawerBody = Column(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              _buildHeader(context, loggedUser),
              _buildDrawerItem(
                Pages.workplaces_page,
                Icons.home,
                'Home',
              ),
              _buildDrawerItem(
                Pages.my_presences_page,
                Icons.event_available,
                'Le mie presenze',
              ),
              if (loggedUser?.isStaffOrAdmin())
                _buildDrawerItem(
                  Pages.presences_management_page,
                  Icons.supervisor_account,
                  'Gestione presenze',
                ),
              if (loggedUser?.idRole == ROLE_ADMIN)
                _buildDrawerItem(
                  Pages.users_management_page,
                  Icons.lock_open,
                  'Gestione utenze',
                )
            ],
          ),
        ),
        _buildLogoutItem(context),
      ],
    );
    return ResponsiveBuilder(
      mobile: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        child: Drawer(child: drawerBody),
      ),
      tabletOrDesktop: drawerBody,
    );
  }

  Widget _buildHeader(BuildContext context, User loggedUser) {
    return DrawerHeader(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(image: AssetImage('assets/dnc_def_logo.png'), width: 200),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state.authenticatedUser != null)
                    Text(
                      'Ciao ${loggedUser?.name?.split(" ")?.first}',
                      style: TextStyle(
                        color: dncBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  SizedBox(height: 4),
                  if (state.assignedWorkstation != null)
                    _buildAssignedWorkplaceSection(context)
                ]);
          }),
        ],
      ),
    );
  }

  Widget _buildAssignedWorkplaceSection(BuildContext context) {
    int assignedWorkstation =
        BlocProvider.of<AuthenticationBloc>(context).state.assignedWorkstation;
    String workplaceIndicationLabel;
    if (assignedWorkstation == null) {
      return Container();
    } else if (assignedWorkstation >= 1 && assignedWorkstation <= 18) {
      workplaceIndicationLabel = 'al 26/B';
    } else if (assignedWorkstation >= 76 && assignedWorkstation <= 91) {
      workplaceIndicationLabel = 'al 26/A 1°piano';
    } else if (assignedWorkstation >= 50 && assignedWorkstation <= 75) {
      workplaceIndicationLabel = 'al 26/A 2°piano';
    } else if (assignedWorkstation >= 19 && assignedWorkstation <= 34) {
      workplaceIndicationLabel = 'al 24';
    } else if (assignedWorkstation >= 43 && assignedWorkstation <= 46) {
      workplaceIndicationLabel = 'in amministrazione';
    } else if (assignedWorkstation >= 47 && assignedWorkstation <= 49) {
      workplaceIndicationLabel = 'in dirigenza';
    }
    return Text('Oggi lavori $workplaceIndicationLabel',
        style: TextStyle(
          color: dncBlue,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ));
  }

  Widget _buildDrawerItem(Pages page, IconData icon, String label) =>
      device == DeviceType.mobile
          ? MobileDrawerItem(page, icon, label)
          : DesktopDrawerItem(page, icon, label);

  Widget _buildLogoutItem(BuildContext context) {
    final performLogoutFunction = () =>
        context.read<AuthenticationBloc>().add(AuthenticationLogoutRequested());
    return device == DeviceType.mobile
        ? MobileDrawerItem.logoutItem(performLogoutFunction)
        : DesktopDrawerItem.logoutItem(performLogoutFunction);
  }
}
