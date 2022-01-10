import 'package:example_flutter_sliding_tutorial/page/e_commerce_page.dart';
import 'package:example_flutter_sliding_tutorial/page/web_analytics_page.dart';
import 'package:example_flutter_sliding_tutorial/page/web_developer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sliding_tutorial/flutter_sliding_tutorial.dart';

class SlidingTutorial extends StatefulWidget {
  const SlidingTutorial({
    required this.controller,
    required this.notifier,
    required this.pageCount,
    Key? key,
  }) : super(key: key);

  final ValueNotifier<double> notifier;
  final int pageCount;
  final PageController controller;

  @override
  State<StatefulWidget> createState() => _SlidingTutorial();
}

class _SlidingTutorial extends State<SlidingTutorial> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = widget.controller;

    /// Listen to [PageView] position updates.
    _pageController..addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBackgroundColor(
      pageController: _pageController,
      pageCount: widget.pageCount,

      /// You can use your own color list for page background
      colors: [
        Colors.red,
        Colors.yellow,
        Colors.blueAccent,
      ],
      child: Container(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: List<Widget>.generate(
                widget.pageCount,
                (index) => _getPageByIndex(index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Create different [SlidingPage] for indexes.
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

  /// Notify [SlidingPage] about current page changes.
  _onScroll() {
    widget.notifier.value = _pageController.page ?? 0;
  }
}
