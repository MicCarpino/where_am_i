import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/presentation/core/round_clipper.dart';
import 'package:where_am_i/presentation/responsive_builder.dart';

class DncAnimatedLogo extends StatefulWidget {
  @override
  _DncAnimatedLogoState createState() => _DncAnimatedLogoState();
}

class _DncAnimatedLogoState extends State<DncAnimatedLogo>
    with SingleTickerProviderStateMixin {
  AnimationController _scaleAnimationController;

  initState() {
    super.initState();
    _scaleAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )
      ..forward()
      ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  MediaQuery.of(context).size.width / (ResponsiveBuilder.isMobile(context) ? 2 : 4),
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: 6,
          padding: EdgeInsets.all(8.0),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (_, index) => getAnimatedWidget(index)),
    );
  }

  Widget getAnimatedWidget(int index) {
    var beginInterval = 0.1 * index;
    var endInterval = (0.1 * index) + 0.1;
    final Animation<double> animationSequence = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 1.0, end: 1.1), weight: 50),
      TweenSequenceItem(tween: Tween<double>(begin: 1.1, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(
      parent: _scaleAnimationController,
      curve: Interval(beginInterval, endInterval, curve: Curves.linear),
    ));
    return ScaleTransition(
      scale: animationSequence,
      alignment: Alignment.center,
      child: index == 5 ? createClippedCircle() : createClippedSquare(),
    );
  }

  Widget createClippedSquare() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          width: 50,
          height: 50,
          color: dncOrangeLight,
          child: ClipPath(
            clipper: RoundClipper(),
            child: Container(color: dncOrange),
          ),
        ),
      ),
    );
  }

  Widget createClippedCircle() {
    return ClipOval(
      child: Container(
        width: 50,
        height: 50,
        color: dncLightBlue,
        child: ClipPath(
          clipper: RoundClipper(),
          child: Container(color: dncBlue),
        ),
      ),
    );
  }

  @override
  dispose() {
    _scaleAnimationController.dispose();
    super.dispose();
  }
}
