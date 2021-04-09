import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/core/utils/extensions.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget tabletOrDesktop;

  const ResponsiveBuilder({Key key, @required this.mobile, @required this.tabletOrDesktop})
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
}
