import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/presentation/pages/workplaces_page.dart';
import 'package:where_am_i/presentation/pages/my_presences_page.dart';
import 'package:where_am_i/presentation/pages/presences_management_page.dart';
import 'package:where_am_i/presentation/pages/users_management_page.dart';
import 'package:where_am_i/presentation/widgets/drawer_widget.dart';

final sl = GetIt.instance;

class HomeScreen extends StatefulWidget {
  final String title = "Civico 26B";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Pages _bodyContent;
  String _title;
  User loggedUser;

  @override
  void initState() {
    setState(() {
      _title = widget.title;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title, style: TextStyle(color: Colors.white)),
          backgroundColor: dncBlue,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: DrawerWidget(_updateTitleAndBodyContent,_bodyContent),
        body: _getBodyContent());
  }

  Widget _getBodyContent() {
    //title setting is delegated to the drawer
    switch (_bodyContent) {
      case Pages.my_presences_page:
        return MyPresencesPage();
        break;
      case Pages.presences_management_page:
        return PresencesManagementPage();
        break;
      case Pages.users_management_page:
        return UsersManagementPage();
        break;
      default:
        //workplaces need callback function in order to change the title
        //depending on visualized view pager's page
        return WorkplacesPage(_updateTitle);
    }
  }

  _updateTitle(String newTitle) {
    setState(() {
      _title = newTitle;
    });
  }

  _updateTitleAndBodyContent(String newTitle, Pages newBodyContent) {
    setState(() {
      _title = newTitle;
      _bodyContent = newBodyContent;
    });
  }
}
