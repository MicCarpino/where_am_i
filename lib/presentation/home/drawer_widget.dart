import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/domain/blocs/authentication/authentication_bloc.dart';
import 'package:where_am_i/domain/blocs/home/home_cubit.dart';
import 'package:where_am_i/domain/entities/user.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User loggedUser = BlocProvider.of<AuthenticationBloc>(context)
        .state
        .authenticatedUser
        .user;
    return Column(
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
        Container(
            child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
                  children: <Widget>[
                    ListTile(
                        leading: Icon(Icons.exit_to_app, color: Colors.black87),
                        title: Text('Logout'),
                        onTap: () => context
                            .read<AuthenticationBloc>()
                            .add(AuthenticationLogoutRequested()))
                  ],
                )))
      ],
    );
  }

  Widget _buildItem(
      BuildContext context, Pages pageItem, IconData icon, String text) {
    final isCurrentPage =
        pageItem == BlocProvider.of<HomeCubit>(context).state.currentPage;
    return Container(margin: EdgeInsets.all(4),
      child: Ink(
        color: isCurrentPage ? dncOrange : null,
        child: ListTile(
          leading: Icon(
            icon,
            color: isCurrentPage ? Colors.white : Colors.black87,
          ),
          title: AutoSizeText(text,
              maxLines: 1,
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

/*
  Widget _buildItem(
      BuildContext context, Pages pageItem, IconData icon, String text) {
    final isCurrentPage =
        pageItem == BlocProvider.of<HomeCubit>(context).state.currentPage;
    return Container(
      color: isCurrentPage ? dncOrange : null,
      child: InkWell(onTap: () {
        if (isCurrentPage) {
          BlocProvider.of<HomeCubit>(context).changePage(pageItem);
        }
        //close drawer
        Navigator.pop(context);
      },hoverColor: dncOrangeTransparent,
        child: Row(
          children: [
            Icon(icon, color: isCurrentPage ? Colors.white : Colors.black87),
            AutoSizeText(text,
                maxLines: 1,
                style: TextStyle(
                    color: isCurrentPage ? Colors.white : Colors.black87)),
          ],
        ),
      ),
    );
  }*/

  _buildHeader(BuildContext context, User loggedUser) {
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
}
