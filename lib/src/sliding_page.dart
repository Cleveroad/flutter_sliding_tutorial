import 'package:flutter/widgets.dart';

class SlidingPage extends InheritedWidget {
  final int page;
  final ValueNotifier<double> notifier;

  SlidingPage(
      {Widget child, @required this.page, @required this.notifier, Key key})
      : super(child: child, key: key);

  @override
  bool updateShouldNotify(SlidingPage old) =>
      old.page != page || old.notifier != notifier;

  static SlidingPage of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(SlidingPage);
}
