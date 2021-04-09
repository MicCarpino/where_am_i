import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/domain/blocs/home/home_cubit.dart';

final double iconSizeMultiplier = 0.125;
final tileSpacingMultiplier = 0.05;

class DesktopDrawerItem extends StatelessWidget {
  const DesktopDrawerItem(this.pageItem, this.icon, this.text);

  final Pages pageItem;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isCurrentPage =
        pageItem == BlocProvider.of<HomeCubit>(context).state.currentPage;
    return LayoutBuilder(
      builder: (context, constraints) => Ink(
        color: isCurrentPage ? dncOrange : null,
        child: ListTile(
          contentPadding:
              EdgeInsets.all(constraints.maxWidth * tileSpacingMultiplier),
          horizontalTitleGap: constraints.maxWidth * tileSpacingMultiplier,
          leading: Icon(
            icon,
            size: constraints.maxWidth * iconSizeMultiplier,
            color: isCurrentPage ? Colors.white : Colors.black87,
          ),
          title: AutoSizeText(text,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  color: isCurrentPage ? Colors.white : Colors.black87)),
          onTap: () {
            if (!isCurrentPage) {
              BlocProvider.of<HomeCubit>(context).changePage(pageItem);
            }
          },
        ),
      ),
    );
  }

  static Widget logoutItem(Function logout) {
    return Container(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Column(
          children: <Widget>[
            LayoutBuilder(
              builder: (context, constraints) => ListTile(
                  contentPadding: EdgeInsets.all(
                      constraints.maxWidth * tileSpacingMultiplier),
                  horizontalTitleGap:
                      constraints.maxWidth * tileSpacingMultiplier,
                  leading: Icon(
                    Icons.exit_to_app,
                    size: constraints.maxWidth * iconSizeMultiplier,
                    color: Colors.black87,
                  ),
                  title: Text('Logout'),
                  onTap: logout),
            )
          ],
        ),
      ),
    );
  }

}
