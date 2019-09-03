import 'package:example_flutter_sliding_tutorial/page/e_commerce_page.dart';
import 'package:example_flutter_sliding_tutorial/page/web_analytics_page.dart';
import 'package:example_flutter_sliding_tutorial/page/web_developer_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sliding_tutorial/flutter_sliding_tutorial.dart';

class SlidingTutorial extends StatefulWidget {
  final ValueNotifier<double> notifier;
  final int pageCount;

  const SlidingTutorial(
      {Key key, @required this.notifier, @required this.pageCount})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SlidingTutorial();
}

class _SlidingTutorial extends State<SlidingTutorial> {
  var _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    _pageController..addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBackgroundColor(
        pageController: _pageController,
        pageCount: widget.pageCount,
        child: Container(
            child: PageView(
                controller: _pageController,
                children: List<Widget>.generate(
                    widget.pageCount, (index) => _getPageByIndex(index)))));
  }

  Widget _getPageByIndex(int index) {
    switch (index % 3) {
      case 0:
        return WebAnalyticsPage(index, widget.notifier);
      case 1:
        return WebDevelopersPage(index, widget.notifier);
      case 2:
        return ECommercePage(index, widget.notifier);
      default:
        throw ArgumentError("Unknown position: $index");
    }
  }

  _onScroll() {
    widget.notifier?.value = _pageController.page;
  }
}
