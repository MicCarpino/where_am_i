import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/domain/blocs/authentication/authentication_bloc.dart';
import 'package:where_am_i/domain/blocs/home/home_cubit.dart';
import 'package:where_am_i/domain/entities/user.dart';

class DesktopDrawer extends StatelessWidget {
  final iconSizeMultiplier = 0.125;
  final tileSpacingMultiplier = 0.05;

  @override
  Widget build(BuildContext context) {
    final User loggedUser = BlocProvider.of<AuthenticationBloc>(context)
        .state
        .authenticatedUser
        .user;
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              _buildHeader(context, loggedUser),
              _buildItem(
                context,
                Pages.workplaces_page,
                Icons.home,
                'Home',
              ),
              _buildItem(
                context,
                Pages.my_presences_page,
                Icons.event_available,
                'Le mie presenze',
              ),
              if (loggedUser?.isStaffOrAdmin())
                _buildItem(
                  context,
                  Pages.presences_management_page,
                  Icons.supervisor_account,
                  'Gestione presenze',
                ),
              if (loggedUser?.idRole == ROLE_ADMIN)
                _buildItem(
                  context,
                  Pages.users_management_page,
                  Icons.lock_open,
                  'Gestione utenze',
                ),
            ],
          ),
        ),
        _buildLogoutItem(context)
      ],
    );
  }

  Widget _buildItem(
      BuildContext context, Pages pageItem, IconData icon, String text) {
    final isCurrentPage =
        pageItem == BlocProvider.of<HomeCubit>(context).state.currentPage;
    return LayoutBuilder(
      builder: (context, constraints) => Ink(
        color: isCurrentPage ? dncOrange : null,
        child: ListTile(
          contentPadding:
              EdgeInsets.all(constraints.maxWidth * tileSpacingMultiplier),
          horizontalTitleGap: constraints.maxWidth * tileSpacingMultiplier,
          leading: Icon(
            icon,
            size: constraints.maxWidth * iconSizeMultiplier,
            color: isCurrentPage ? Colors.white : Colors.black87,
          ),
          title: AutoSizeText(text,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  color: isCurrentPage ? Colors.white : Colors.black87)),
          onTap: () {
            if (isCurrentPage) {
              BlocProvider.of<HomeCubit>(context).changePage(pageItem);
            }
            //close drawer
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  _buildHeader(BuildContext context, User loggedUser) {
    return DrawerHeader(
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(image: AssetImage('assets/dnc_def_logo.png')),
              if (state.authenticatedUser != null)
                AutoSizeText(
                  'Ciao ${loggedUser?.name}',
                  maxLines: 2,
                  minFontSize: 18,
                  maxFontSize: 20,
                  style: TextStyle(
                    color: dncBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              SizedBox(height: 4),
              if (state.assignedWorkstation != null)
                _buildAssignedWorkplaceSection(context)
            ]);
      }),
    );
  }

  Widget _buildLogoutItem(BuildContext context) {
    return Container(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Column(
          children: <Widget>[
            LayoutBuilder(
              builder: (context, constraints) => ListTile(
                  contentPadding: EdgeInsets.all(
                      constraints.maxWidth * tileSpacingMultiplier),
                  horizontalTitleGap:
                      constraints.maxWidth * tileSpacingMultiplier,
                  leading: Icon(
                    Icons.exit_to_app,
                    size: constraints.maxWidth * iconSizeMultiplier,
                    color: Colors.black87,
                  ),
                  title: Text('Logout'),
                  onTap: () => context
                      .read<AuthenticationBloc>()
                      .add(AuthenticationLogoutRequested())),
            )
          ],
        ),
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
    return AutoSizeText(
      'Oggi lavori $workplaceIndicationLabel',
      style: TextStyle(color: dncBlue, fontWeight: FontWeight.bold),
    );
  }
}
