import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/domain/blocs/authentication/authentication_bloc.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/presentation/responsive_builder.dart';

class MobileDrawer extends StatefulWidget {
  final Function(String, Pages) setTitleAndPage;
  final Pages currentPage;

  MobileDrawer(this.setTitleAndPage, this.currentPage);

  @override
  _MobileDrawerState createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer> {
  User loggedUser;

  @override
  void initState() {
    super.initState();
    loggedUser =
        context.read<AuthenticationBloc>().state.authenticatedUser.user;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *
          (ResponsiveBuilder.isMobile(context) ? 0.65 : 0.25),
      child: Drawer(
        child: Column(
          children: [
            Expanded(
                child: ListView(padding: EdgeInsets.zero, children: <Widget>[
                  _buildHeader(),
                  _buildItem(
                    drawerItemRelatedPage: Pages.workplaces_page,
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  _buildItem(
                    drawerItemRelatedPage: Pages.my_presences_page,
                    icon: Icons.event_available,
                    text: 'Le mie presenze',
                  ),
                  if (loggedUser?.isStaffOrAdmin())
                    _buildItem(
                      drawerItemRelatedPage: Pages.presences_management_page,
                      icon: Icons.supervisor_account,
                      text: 'Gestione presenze',
                    ),
                  if (loggedUser?.idRole == ROLE_ADMIN)
                    _buildItem(
                      drawerItemRelatedPage: Pages.users_management_page,
                      icon: Icons.lock_open,
                      text: 'Gestione utenze',
                    )
                ])),
            Container(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                            leading:
                            Icon(Icons.exit_to_app, color: Colors.black87),
                            title: Text('Logout'),
                            onTap: () => context
                                .read<AuthenticationBloc>()
                                .add(AuthenticationLogoutRequested()))
                      ],
                    )))
          ],
        ),
      ),
    );
  }

  Widget _buildItem({Pages drawerItemRelatedPage, IconData icon, String text}) {
    return Ink(
      color: widget.currentPage == drawerItemRelatedPage ? dncOrange : null,
      child: ListTile(
        title: Row(
          children: <Widget>[
            Icon(
              icon,
              color: drawerItemRelatedPage == widget.currentPage
                  ? Colors.white
                  : Colors.black87,
            ),
            Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(text,
                    style: TextStyle(
                        color: drawerItemRelatedPage == widget.currentPage
                            ? Colors.white
                            : Colors.black87)))
          ],
        ),
        onTap: () {
          setState(() {
            switch (drawerItemRelatedPage) {
              case Pages.my_presences_page:
                widget.setTitleAndPage(
                    'Le mie presenze', drawerItemRelatedPage);
                break;
              case Pages.presences_management_page:
                widget.setTitleAndPage(
                    'Gestione presenze', drawerItemRelatedPage);
                break;
              case Pages.users_management_page:
                widget.setTitleAndPage(
                    'Gestione utenze', drawerItemRelatedPage);
                break;
              case Pages.workplaces_page:
                widget.setTitleAndPage('Civico 26/B', drawerItemRelatedPage);
                break;
            }
          });
          //close drawer
          Navigator.pop(context);
        },
      ),
    );
  }

  _buildHeader() {
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
                          'Ciao ${loggedUser?.name}',
                          style: TextStyle(
                            color: dncBlue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      SizedBox(height: 4),
                      if (state.assignedWorkstation != null)
                        _buildAssignedWorkplaceSection(state.assignedWorkstation)
                    ]);
              }),
        ],
      ),
    );
  }

  Widget _buildAssignedWorkplaceSection(int codeWorkstation) {
    int assignedWorkstation =
        context.read<AuthenticationBloc>().state.assignedWorkstation;
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
}
