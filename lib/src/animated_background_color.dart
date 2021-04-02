import 'package:flutter/widgets.dart';
import 'package:flutter_sliding_tutorial/flutter_sliding_tutorial.dart';

/// [AnimatedBackgroundColor] background widget. Animates color
/// change when scrolling to new [SlidingPage] in [PageView].
///
/// [pageController] controller of [PageView]. Used for animated color transition.
///
/// [pageCount] total count of [SlidingPage] in [PageView].
///
/// [colors] array of colors for transition. [colors] length can be different from
/// [pageCount], then color change will cycle through available colors.
///
/// [child] widget displayed over [AnimatedBackgroundColor].
class AnimatedBackgroundColor extends StatelessWidget {
  final PageController pageController;
  final int pageCount;
  final List<Color> colors;
  final Widget child;

  AnimatedBackgroundColor({
    required this.child,
    required this.pageController,
    required this.pageCount,
    this.colors = const [
      Color(0xFFAAAAAA),
      Color(0xFF669900),
      Color(0xFFCC0000),
      Color(0xFF0099CC),
      Color(0xFFAA66CC),
      Color(0xFFFF8800),
    ],
  }) : super();

  @override
  Widget build(BuildContext context) {
    var background = TweenSequence<Color?>(
        List<TweenSequenceItem<Color?>>.generate(pageCount, (i) {
      return TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: colors[i % colors.length],
          end: colors[(i + 1) % colors.length],
        ),
      );
    }));

    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        var color =
            pageController.hasClients ? pageController.page! / pageCount : .0;
        return DecoratedBox(
          decoration: BoxDecoration(
            color: background.evaluate(AlwaysStoppedAnimation(color)),
          ),
          child: child,
        );
      },
      child: child,
    );
  }
}
