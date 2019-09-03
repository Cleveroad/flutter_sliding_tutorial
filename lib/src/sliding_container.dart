import 'package:flutter/widgets.dart';
import 'package:flutter_sliding_tutorial/src/sliding_page.dart';

class SlidingContainer extends StatefulWidget {
  final Widget child;
  final double offset;

  SlidingContainer({this.child, this.offset = 100, Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SlidingContainer();
}

class _SlidingContainer extends State<SlidingContainer> {
  int _page;
  ValueNotifier<double> _notifier;

  @override
  void didChangeDependencies() {
    _page = SlidingPage.of(context).page;
    _notifier = SlidingPage.of(context).notifier;
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
        var isCurrentPage = _notifier.value.toInt() == _page;
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
