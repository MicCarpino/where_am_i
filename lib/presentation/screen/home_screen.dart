import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/data/datasources/local_data_source.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/presentation/bloc/home/home_bloc.dart';
import 'package:where_am_i/presentation/pages/home_page.dart';
import 'package:where_am_i/presentation/pages/my_presences_page.dart';
import 'package:where_am_i/presentation/pages/presences_management_page.dart';
import 'package:where_am_i/presentation/pages/users_management_page.dart';

import 'login_screen.dart';

final sl = GetIt.instance;

enum Pages {
  home_page,
  my_presences_page,
  presences_management_page,
  users_management_page
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc _homeBloc = sl<HomeBloc>();
  Pages _bodyContent;
  String _title;
  User loggedUser;

  @override
  void initState() {
    _bodyContent = Pages.home_page;
    _title = "CIVICO 26/B";
    super.initState();
    sl<LocalDataSource>().getCachedUser().then((authenticatedUser) {
      setState(() => loggedUser = authenticatedUser.user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title, style: TextStyle(color: Colors.white)),
          backgroundColor: dncBlue,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: _buildDrawer(context),
        body: _getBodyContent());
  }

  Widget _getBodyContent() {
    switch (_bodyContent) {
      case Pages.my_presences_page:
        return MyPresencesPage(_setAppBarTitle);
        break;
      case Pages.presences_management_page:
        return PresencesManagementPage(_setAppBarTitle);
        break;
      case Pages.users_management_page:
        return UsersManagementPage(_setAppBarTitle);
        break;
      default:
        return _buildHomePage(context);
    }
  }

  Widget _buildHomePage(BuildContext context) {
    return HomePage(_setAppBarTitle);
  }

  _buildDrawer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      child: Drawer(
        child: Column(
          children: [
            Expanded(
                child: ListView(padding: EdgeInsets.zero, children: <Widget>[
              _createDrawerHeader(),
              _createDrawerItem(
                itemPage: Pages.home_page,
                icon: Icons.home,
                text: 'Home',
              ),
              _createDrawerItem(
                itemPage: Pages.my_presences_page,
                icon: Icons.event_available,
                text: 'Le mie presenze',
              ),
              loggedUser.idRole >= ROLE_STAFF
                  ? _createDrawerItem(
                      itemPage: Pages.presences_management_page,
                      icon: Icons.supervisor_account,
                      text: 'Gestione presenze',
                    )
                  : Container(),
              loggedUser.idRole == ROLE_ADMIN
                  ? _createDrawerItem(
                      itemPage: Pages.users_management_page,
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
                              _homeBloc.add(OnLogoutButtonClick());
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

  Widget _createDrawerItem({
    Pages itemPage,
    IconData icon,
    String text,
    GestureTapCallback onTap,
  }) {
    return Ink(
      color: itemPage == _bodyContent ? dncOrange : null,
      child: ListTile(
        title: Row(
          children: <Widget>[
            Icon(icon,
                color:
                    itemPage == _bodyContent ? Colors.white : Colors.black87),
            Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(text,
                    style: TextStyle(
                        color: itemPage == _bodyContent
                            ? Colors.white
                            : Colors.black87)))
          ],
        ),
        onTap: () {
          //close drawer
          Navigator.pop(context);
          setState(() {
            _bodyContent = itemPage;
          });
        },
      ),
    );
  }

  _createDrawerHeader() {
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

  _setAppBarTitle(String title) {
    setState(() {
      _title = title;
    });
  }
}
