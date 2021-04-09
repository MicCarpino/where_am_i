import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/domain/blocs/home/home_cubit.dart';
import 'package:where_am_i/presentation/home/drawer/desktop_drawer.dart';
import 'package:where_am_i/presentation/home/home_page.dart';
import 'package:where_am_i/presentation/my_presences/my_presences_page.dart';
import 'package:where_am_i/presentation/presences_management/presences_management_page.dart';
import 'package:where_am_i/presentation/responsive_builder.dart';
import 'package:where_am_i/presentation/roles_management/role_management_page.dart';

import 'drawer/mobile_drawer.dart';

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
          mobile: Scaffold(
            appBar: AppBar(title: Text(state.currentPage.getPageTitle())),
            body: getPageBody(state.currentPage),
            drawer: Drawer(child: MobileDrawer()),
          ),
          desktop: Scaffold(
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: DesktopDrawer(),
                ),
                Expanded(child: getPageBody(state.currentPage)),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
