import 'dart:math' as math;

import 'package:flutter/widgets.dart';

class SlidingIndicator extends StatelessWidget {
  final ValueNotifier<double> notifier;
  final Widget activeIndicator;
  final Widget inActiveIndicator;
  final int indicatorCount;
  final double sizeIndicator;
  final double margin;

  const SlidingIndicator({
    Key key,
    @required this.notifier,
    @required this.activeIndicator,
    @required this.inActiveIndicator,
    @required this.indicatorCount,
    this.sizeIndicator = 10,
    this.margin = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(indicatorCount, (i) {
                return Container(
                    margin: EdgeInsets.only(
                        left: i == 0 ? 0 : margin, right: margin),
                    child: Container(
                        width: sizeIndicator,
                        height: sizeIndicator,
                        child: inActiveIndicator));
              }),
            ),
            AnimatedBuilder(
              animation: notifier,
              builder: (context, anim) {
                var correctScroll = notifier.value;
                return Transform.translate(
                    offset:
                        Offset((margin * 2 + sizeIndicator) * correctScroll, 0),
                    child: Transform.rotate(
                      angle: 2 * math.pi * correctScroll,
                      child: Container(
                          width: sizeIndicator,
                          height: sizeIndicator,
                          child: activeIndicator),
                    ));
              },
            ),
          ],
        )
      ],
    );
  }
}
