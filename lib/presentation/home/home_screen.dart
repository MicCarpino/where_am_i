import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/domain/blocs/home/home_cubit.dart';
import 'package:where_am_i/presentation/home/home_page.dart';
import 'package:where_am_i/presentation/my_presences/my_presences_page.dart';
import 'package:where_am_i/presentation/presences_management/presences_management_page.dart';
import 'package:where_am_i/presentation/responsive_builder.dart';
import 'package:where_am_i/presentation/roles_management/role_management_page.dart';

import 'drawer/drawer_widget.dart';

//In the "home screen" are rendered all app sections reachable from the drawer
class HomeScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) => ResponsiveBuilder(
          //build mobile layout featuring the title bar
          mobile: Scaffold(
            appBar: AppBar(title: Text(state.title)),
            body: getPageBody(state.currentPage),
            drawer: Drawer(child: DrawerWidget(device: DeviceType.mobile)),
          ),
          //draw a larger layout for tablet/desktop/web
          tabletOrDesktop: Scaffold(
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width * 0.15,
                    maxWidth: MediaQuery.of(context).size.width * 0.18,
                  ),
                  child: DrawerWidget(device: DeviceType.desktop),
                ),
                Expanded(child: getPageBody(state.currentPage)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //return the section to be rendered depending on value of "HomeState"
  Widget getPageBody(Pages currentPage) {
    switch (currentPage) {
      case Pages.workplaces_page:
        return HomePage();
      case Pages.my_presences_page:
        return MyPresencesPage();
      case Pages.presences_management_page:
        return PresencesManagementPage();
      case Pages.users_management_page:
        return RolesManagementPage();
      default:
        return null;
    }
  }
}
