import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/core/utils/extensions.dart';

//This class defines UI appearance depending on device screen size in order to build
//mobile or web/desktop layouts
class ResponsiveBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget tabletOrDesktop;

  //this constructor takes 2 widgets, one for mobile layout and 1 for tablet/desktop/web layout
  const ResponsiveBuilder(
      {Key key, @required this.mobile, @required this.tabletOrDesktop})
      : super(key: key);

  //screen size lower than 600
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).deviceType == DeviceType.mobile;
  }

  //screen size from 600 to 1500
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).deviceType == DeviceType.tablet;
  }

  //screen size higher than 1500
  static bool isWebOrDesktop(BuildContext context) {
    return MediaQuery.of(context).deviceType == DeviceType.desktop;
  }

  //the build method returns the mobile or desktop widget depending on device "type"
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

  //show the flushbar from bottom on mobile or a larger one from above on desktop
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

  //build a default dialog on mobile or a larger one on tablet/desktop
  static Dialog buildDialog(BuildContext context, Widget dialogContent) {
    if (isMobile(context)) {
      return Dialog(child: dialogContent);
    } else {
      return Dialog(
        child: Container(
          width:
              MediaQuery.of(context).size.width / (isTablet(context) ? 2 : 3),
          child: dialogContent,
        ),
      );
    }
  }
}
