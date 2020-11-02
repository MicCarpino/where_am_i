import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/presentation/bloc/home/home_bloc.dart';
import 'package:where_am_i/presentation/screen/login_screen.dart';
import 'package:where_am_i/user_service.dart';

enum Pages {
  workplaces_page,
  my_presences_page,
  presences_management_page,
  users_management_page
}

final sl = GetIt.instance;

class DrawerWidget extends StatefulWidget {
  final Function(String, Pages) setTitleAndPage;
  final Pages currentPage;

  DrawerWidget(this.setTitleAndPage, this.currentPage);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  User loggedUser = sl<UserService>().getLoggedUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
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
              loggedUser.idRole >= ROLE_STAFF
                  ? _buildItem(
                      drawerItemRelatedPage: Pages.presences_management_page,
                      icon: Icons.supervisor_account,
                      text: 'Gestione presenze',
                    )
                  : Container(),
              loggedUser.idRole == ROLE_ADMIN
                  ? _buildItem(
                      drawerItemRelatedPage: Pages.users_management_page,
                      icon: Icons.lock_open,
                      text: 'Gestione utenze',
                    )
                  : Container(),
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
                            onTap: () async {
                              sl<HomeBloc>().add(OnLogoutButtonClick());
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                                (Route<dynamic> route) => false,
                              );
                            })
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
                widget.setTitleAndPage('Civico 26B', drawerItemRelatedPage);
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
        // decoration: BoxDecoration(color: dncBlue),
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image(image: AssetImage('assets/dnc_def_logo.png'), width: 200),
        Text('Ciao ${loggedUser?.name}',
            style: TextStyle(
                color: dncBlue, fontSize: 20, fontWeight: FontWeight.bold)),
        Text('Oggi lavori al ',
            style: TextStyle(
                color: dncBlue, fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    ));
  }
}
