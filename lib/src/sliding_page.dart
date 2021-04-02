import 'package:flutter/widgets.dart';

/// [SlidingPage] widget for notifying it's child widget about
/// about [page] change or [notifier] change.
///
/// [page] index of this [SlidingPage] in [PageView].
///
/// [notifier] value notifier from [ScrollController] of parent [PageView].
class SlidingPage extends InheritedWidget {
  final int page;
  final ValueNotifier<double> notifier;

  SlidingPage({
    required Widget child,
    required this.page,
    required this.notifier,
    Key? key,
  }) : super(child: child, key: key);

  @override
  bool updateShouldNotify(SlidingPage old) =>
      old.page != page || old.notifier != notifier;

  static SlidingPage? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();
}
