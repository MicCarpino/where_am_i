import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/presentation/home/drawer_widget.dart';
import 'package:where_am_i/presentation/home/home_page.dart';
import 'package:where_am_i/presentation/my_presences/my_presences_page.dart';
import 'package:where_am_i/presentation/presences_management/presences_management_page.dart';
import 'package:where_am_i/presentation/roles_management/role_management_page.dart';

class HomeScreen extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomeScreen());
  }
  final String title = "Civico 26/B";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Pages _bodyContent;
  String _title;
  User loggedUser;

  @override
  void initState() {
    super.initState();
    //default view
    _bodyContent = Pages.workplaces_page;
    setState(() {
      _title = widget.title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AutoSizeText(_title,maxLines:1, style: TextStyle(color: Colors.white)),
          backgroundColor: dncBlue,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer:  DrawerWidget(_updateTitleAndBodyContent, _bodyContent),
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
        return RolesManagementPage();
        break;
      default:
        //workplaces need callback function in order to change the title
        //depending on visualized view pager's page
        return HomePage(_updateTitle);
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