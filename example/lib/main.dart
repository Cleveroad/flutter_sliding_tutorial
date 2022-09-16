import 'package:example_flutter_sliding_tutorial/sliding_tutorial.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_tutorial/flutter_sliding_tutorial.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      home: const ExamplePage(),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({
    super.key,
  });

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final ValueNotifier<double> notifier = ValueNotifier(0);
  final _pageCtrl = PageController();
  int pageCount = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
        children: <Widget>[
          /// [StatefulWidget] with [PageView] and [AnimatedBackgroundColor].
          SlidingTutorial(
            controller: _pageCtrl,
            pageCount: pageCount,
            notifier: notifier,
          ),

          /// Separator.
          Align(
            alignment: const Alignment(0, 0.85),
            child: Container(
              width: double.infinity,
              height: 0.5,
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                _pageCtrl.previousPage(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.linear,
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
                textDirection: TextDirection.rtl,
              ),
              onPressed: () {
                _pageCtrl.nextPage(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.linear,
                );
              },
            ),
          ),

          /// [SlidingIndicator] for [PageView] in [SlidingTutorial].
          Align(
            alignment: const Alignment(0, 0.94),
            child: SlidingIndicator(
              indicatorCount: pageCount,
              notifier: notifier,
              activeIndicator: const Icon(
                Icons.check_circle,
                color: Color(0xFF29B6F6),
              ),
              inActiveIndicator: SvgPicture.asset(
                'assets/hollow_circle.svg',
              ),
              inactiveIndicatorSize: 14,
              activeIndicatorSize: 14,
            ),
          )
        ],
      )),
    );
  }
}
