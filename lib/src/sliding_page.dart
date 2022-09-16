import 'package:flutter/widgets.dart';

/// [SlidingPage] widget for notifying it's child widget about
/// about [page] change or [notifier] change.
///
/// [page] index of this [SlidingPage] in [PageView].
///
/// [notifier] value notifier from [ScrollController] of parent [PageView].
class SlidingPage extends InheritedWidget {
  const SlidingPage({
    required super.child,
    required this.page,
    required this.notifier,
    super.key,
  });

  final int page;
  final ValueNotifier<double> notifier;

  @override
  bool updateShouldNotify(SlidingPage oldWidget) =>
      oldWidget.page != page || oldWidget.notifier != notifier;

  static SlidingPage? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();
}
