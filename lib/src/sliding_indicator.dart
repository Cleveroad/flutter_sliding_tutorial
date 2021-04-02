import 'dart:math' as math;

import 'package:flutter/widgets.dart';
import 'package:flutter_sliding_tutorial/flutter_sliding_tutorial.dart';

/// [SlidingIndicator] - widget for indication of current page position in
/// tutorial with rotation transition of [activeIndicator] between [inActiveIndicator].
///
/// [notifier] [ValueNotifier] with double value for animated transition of [activeIndicator].
///
/// [activeIndicator] widget that indicates current [SlidingPage] in [PageView].
///
/// [inActiveIndicator] widget that shows all [SlidingPage] in [PageView].
///
/// [indicatorCount] total count of [inActiveIndicator] widgets in [SlidingIndicator].
///
/// [sizeIndicator] size of [activeIndicator] and [inActiveIndicator] widgets.
///
/// [margin] space between [inActiveIndicator] widgets.
class SlidingIndicator extends StatelessWidget {
  final ValueNotifier<double> notifier;
  final Widget activeIndicator;
  final Widget inActiveIndicator;
  final int indicatorCount;
  final double sizeIndicator;
  final double margin;

  const SlidingIndicator({
    required this.notifier,
    required this.activeIndicator,
    required this.inActiveIndicator,
    required this.indicatorCount,
    this.sizeIndicator = 10,
    this.margin = 8,
    Key? key,
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
