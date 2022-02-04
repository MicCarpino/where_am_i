import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/domain/blocs/home/home_cubit.dart';

//Drawer widget for mobile version
class MobileDrawerItem extends StatelessWidget {
  const MobileDrawerItem(this.pageItem, this.icon, this.text);

  final Pages pageItem;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isCurrentPage =
        pageItem == BlocProvider.of<HomeCubit>(context).state.currentPage;
    // mark the drawer item with orange color and turn icon and text white
    // if matches the current section selection
    return Ink(
      color: isCurrentPage ? dncOrange : null,
      child: ListTile(
        leading: Icon(
          icon,
          color: isCurrentPage ? Colors.white : Colors.black87,
        ),
        title: Text(text,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
                color: isCurrentPage ? Colors.white : Colors.black87)),
        onTap: () {
          if (!isCurrentPage) {
            BlocProvider.of<HomeCubit>(context).changePage(pageItem);
          }
          //close drawer
          Navigator.pop(context);
        },
      ),
    );
  }

  static Widget logoutItem(Function logout) {
    return Container(
        child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Column(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.exit_to_app, color: Colors.black87),
                    title: Text('Logout'),
                    //add a logout event to the Authentication Bloc
                    onTap: logout)
              ],
            )));
  }
}
