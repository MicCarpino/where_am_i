import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/presentation/bloc/home/home_bloc.dart';
import 'package:where_am_i/presentation/bloc/reservation/reservation_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/pages/home_page.dart';
import 'package:where_am_i/presentation/pages/my_presences_page.dart';
import 'package:where_am_i/presentation/pages/presences_management_page.dart';
import 'package:where_am_i/presentation/pages/users_management_page.dart';

import 'login_screen.dart';

final sl = GetIt.instance;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  HomeBloc _homeBloc = sl<HomeBloc>();
  WorkstationBloc _workstationBloc = sl<WorkstationBloc>();
  ReservationsBloc _reservationsBloc = sl<ReservationsBloc>();
  int _currentItem = 0;
  String _title;

  @override
  void initState() {
    _title = "CIVICO 26/B";
    _homeBloc.visualizedDateStream.listen((date) {
      _workstationBloc.add(FetchWorkstationsLists(dateToFetch: date));
      _reservationsBloc.add(FetchReservationsList(dateToFetch: date));
    });
    _homeBloc..add(OnNewDate(date: DateTime.now()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _homeBloc,
      child: _buildHomePage(context),
    );
  }

  Widget _buildHomePage(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title, style: TextStyle(color: Colors.white)),
          backgroundColor: dncBlue,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: _buildDrawer(context),
        body: MultiBlocProvider(providers: [
          BlocProvider<HomeBloc>(create: (context) => _homeBloc),
          BlocProvider<WorkstationBloc>(create: (context) => _workstationBloc),
          BlocProvider<ReservationsBloc>(create: (context) => _reservationsBloc)
        ], child: HomePage(setAppBarTitle)));
  }

  Widget _buildMyPresencesPage(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title, style: TextStyle(color: Colors.white)),
          backgroundColor: dncBlue,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: _buildDrawer(context),
        body: BlocProvider(
          create: (BuildContext context) => _workstationBloc,
          child: MyPresencesPage(setAppBarTitle),
        ));
  }

  Widget _buildPresencesManagementPage(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title, style: TextStyle(color: Colors.white)),
          backgroundColor: dncBlue,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: _buildDrawer(context),
        body: BlocProvider(
          create: (BuildContext context) => _workstationBloc,
          child: PresencesManagementPage(setAppBarTitle),
        ));
  }

  Widget _buildUsersManagementPage(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title, style: TextStyle(color: Colors.white)),
          backgroundColor: dncBlue,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: _buildDrawer(context),
        body: BlocProvider(
          create: (BuildContext context) => _workstationBloc,
          child: UsersManagementPage(setAppBarTitle),
        ));
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
              _createDrawerItem(position: 0, icon: Icons.home, text: 'Home'),
              _createDrawerItem(
                  position: 1,
                  icon: Icons.event_available,
                  text: 'Le mie presenze',
                  onTap: () => _buildMyPresencesPage(context)),
              _createDrawerItem(
                  position: 2,
                  icon: Icons.supervisor_account,
                  text: 'Gestione presenze',
                  onTap: () => _buildPresencesManagementPage(context)),
              _createDrawerItem(
                  position: 3,
                  icon: Icons.lock_open,
                  text: 'Gestione utenze',
                  onTap: () => _buildUsersManagementPage(context))
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
    int position,
    IconData icon,
    String text,
    GestureTapCallback onTap,
  }) {
    return Ink(
      color: position == _currentItem ? dncOrange : null,
      child: ListTile(
        title: Row(
          children: <Widget>[
            Icon(icon,
                color:
                    position == _currentItem ? Colors.white : Colors.black87),
            Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(text,
                    style: TextStyle(
                        color: position == _currentItem
                            ? Colors.white
                            : Colors.black87)))
          ],
        ),
        onTap: () {
          Navigator.pop(context);
          setState(() {
            _currentItem = position;
          });
        },
      ),
    );
  }

//TODO:remove empty space at header bottom
  _createDrawerHeader() {
    return DrawerHeader(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: AssetImage('assets/dnc_def_logo.png'), width: 200),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ciao Giangianni',
                style: TextStyle(
                    color: dncBlue, fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Oggi lavori al ',
                style: TextStyle(
                    color: dncBlue, fontSize: 16, fontWeight: FontWeight.bold))
          ],
        ),
      ],
    ));
  }

  setAppBarTitle(String title) {
    setState(() {
      _title = title;
    });
  }

  @override
  void dispose() {
    _reservationsBloc.close();
    _workstationBloc.close();
    super.dispose();
  }
}
