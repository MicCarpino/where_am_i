import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/core/utils/extensions.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget tabletOrDesktop;

  const ResponsiveBuilder(
      {Key key, @required this.mobile, @required this.tabletOrDesktop})
      : super(key: key);

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).deviceType == DeviceType.mobile;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).deviceType == DeviceType.tablet;
  }

  static bool isWebOrDesktop(BuildContext context) {
    return MediaQuery.of(context).deviceType == DeviceType.desktop;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, cons) {
        if (isMobile(context)) {
          return mobile;
        } else {
          return tabletOrDesktop;
        }
      },
    );
  }

  static void showsErrorMessage(BuildContext context, String errorMessage) {
    ResponsiveBuilder.isMobile(context)
        ? FlushbarHelper.createError(
            message: errorMessage,
            duration: Duration(seconds: 3),
          ).show(context)
        : Flushbar(
            message: errorMessage,
            duration: Duration(seconds: 6),
            flushbarPosition: FlushbarPosition.TOP,
            maxWidth: MediaQuery.of(context).size.width / 3,
            icon: Icon(
              Icons.warning,
              size: 28.0,
              color: Colors.red[300],
            ),
            leftBarIndicatorColor: Colors.red[300],
            mainButton: MaterialButton(
              color: Colors.red[300],
              child: Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ).show(context);
  }
}
