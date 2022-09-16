import 'package:flutter/widgets.dart';
import 'package:flutter_sliding_tutorial/src/sliding_page.dart';

/// [SlidingContainer] widget that moves [child] based on [offset] and [SlidingPage]
/// scroll position and page.
///
/// [child] widget to be move separately from [PageView] on swipe for parallax effect.
///
/// [offset] value for tweaking parallax movement of [child].
/// Different values can be used to find best solution.
class SlidingContainer extends StatefulWidget {
  const SlidingContainer({
    required this.child,
    this.offset = 100,
    super.key,
  });

  final Widget child;
  final double offset;

  @override
  State<StatefulWidget> createState() => _SlidingContainer();
}

class _SlidingContainer extends State<SlidingContainer> {
  int? _page;
  late ValueNotifier<double> _notifier;

  @override
  void didChangeDependencies() {
    _page = SlidingPage.of(context)?.page;
    _notifier = SlidingPage.of(context)!.notifier;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _notifier,
      builder: (context, anim) {
        var offsetX =
            (_notifier.value - _notifier.value.toInt()) * widget.offset;
        offsetX *= -1;
        final isCurrentPage = _notifier.value.toInt() == _page;
        return Transform.translate(
            offset: Offset(
                (_page == 0)
                    ? offsetX
                    : (offsetX == 0)
                        ? 0
                        : isCurrentPage && _page != 0
                            ? offsetX
                            : offsetX + widget.offset,
                0),
            child: widget.child);
      },
    );
  }
}
