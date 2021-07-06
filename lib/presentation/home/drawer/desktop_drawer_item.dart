import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/domain/blocs/home/home_cubit.dart';

final double iconSizeMultiplier = 0.125;
final tileSpacingMultiplier = 0.01;

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
      builder: (context, constraints) {
        var iconSize = constraints.maxWidth * iconSizeMultiplier;
        if (iconSize < 20) {
          iconSize = 20;
        } else if (iconSize > 24) {
          iconSize = 24;
        }
        return Ink(
          color: isCurrentPage ? dncOrange : null,
          child: ListTile(
            leading: Icon(
              icon,
              color: isCurrentPage ? Colors.white : Colors.black87,
              size: iconSize,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
            horizontalTitleGap: 8,
            minLeadingWidth: 18,
            title: AutoSizeText(text,
                overflow: TextOverflow.ellipsis,
                minFontSize: 10,
                maxFontSize: 24,
                maxLines: 2,
                wrapWords: true,
                style: TextStyle(
                    color: isCurrentPage ? Colors.white : Colors.black87)),
            onTap: () {
              if (!isCurrentPage) {
                BlocProvider.of<HomeCubit>(context).changePage(pageItem);
              }
            },
          ),
        );
      },
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
