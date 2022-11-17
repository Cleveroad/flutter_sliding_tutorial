import 'dart:math' as math;

import 'package:flutter/material.dart';
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
  const SlidingIndicator({
    required this.notifier,
    required this.activeIndicator,
    required this.inActiveIndicator,
    required this.indicatorCount,
    this.activeIndicatorSize = 10,
    this.inactiveIndicatorSize = 10,
    this.margin = 8,
    super.key,
  });

  final ValueNotifier<double> notifier;
  final Widget activeIndicator;
  final Widget inActiveIndicator;
  final double activeIndicatorSize;
  final double inactiveIndicatorSize;
  final int indicatorCount;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                indicatorCount,
                (i) {
                  return Container(
                    margin: EdgeInsets.only(
                      left: i == 0 ? 0 : margin,
                      right: i == indicatorCount - 1 ? 0 : margin,
                    ),
                    child: Container(
                      width: inactiveIndicatorSize,
                      height: inactiveIndicatorSize,
                      child: FittedBox(child: inActiveIndicator),
                    ),
                  );
                },
              ),
            ),
            Transform.translate(
              offset: Offset(
                inactiveIndicatorSize / 2 - activeIndicatorSize / 2,
                0,
              ),
              child: AnimatedBuilder(
                animation: notifier,
                builder: (context, anim) {
                  final correctScroll = notifier.value;
                  return Transform.translate(
                    offset: Offset(
                      (margin * 2 + inactiveIndicatorSize) * correctScroll,
                      0,
                    ),
                    child: Transform.rotate(
                      angle: 2 * math.pi * correctScroll,
                      child: Container(
                        width: activeIndicatorSize,
                        height: activeIndicatorSize,
                        child: FittedBox(child: activeIndicator),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
