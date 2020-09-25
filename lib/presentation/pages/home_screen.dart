import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/usecases/perform_log_out.dart';
import 'package:where_am_i/presentation/bloc/home/home_bloc.dart';
import 'package:where_am_i/presentation/widgets/date_picker.dart';
import 'package:where_am_i/presentation/widgets/room_24.dart';
import 'package:where_am_i/presentation/widgets/room_26A.dart';
import 'package:where_am_i/presentation/widgets/room_26B.dart';

import 'login_screen.dart';

final sl = GetIt.instance;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeBloc _homeBloc;
  int _currentItem = 0;
  String _title;

  List<Widget> pages = [
    Room26B(),
    Room26A(),
    Room24(),
  ];

  @override
  void initState() {
    _title = "CIVICO 26/B";
    _homeBloc = sl<HomeBloc>();
    _homeBloc.add(FetchLists());
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
        body: Column(children: [
          DatePicker(),
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoadingState) {
                      return Center(child: CircularProgressIndicator());
                    } else if(state is ListsFetchCompletedState){
                      print(state.workstationsList.toString());
                      return pages[index];
                    } else {
                      return pages[index];
                    }
                  },
                );
              },
              onPageChanged: (pageIndex) {
                switch (pageIndex) {
                  case 0:
                    _setAppBarTitle("CIVICO 26/B");
                    break;
                  case 1:
                    _setAppBarTitle("CIVICO 26/A");
                    break;
                  case 2:
                    _setAppBarTitle("CIVICO 24");
                    break;
                }
              },
              itemCount: pages.length,
            ),
          )
        ]));
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
                  text: 'Le mie presenze'),
              _createDrawerItem(
                  position: 2,
                  icon: Icons.supervisor_account,
                  text: 'Gestione presenze'),
              _createDrawerItem(
                  position: 3, icon: Icons.lock_open, text: 'Gestione utenze')
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

  Widget _createDrawerItem(
      {int position, IconData icon, String text, GestureTapCallback onTap}) {
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

  _setAppBarTitle(String title) {
    setState(() {
      _title = title;
    });
  }
}
