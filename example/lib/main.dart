import 'package:example_flutter_sliding_tutorial/sliding_tutorial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_tutorial/flutter_sliding_tutorial.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExamplePage(),
    );
  }
}

class ExamplePage extends StatefulWidget {
  ExamplePage({
    Key? key,
  }) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final ValueNotifier<double> notifier = ValueNotifier(0);
  int pageCount = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
        children: <Widget>[
          /// [StatefulWidget] with [PageView] and [AnimatedBackgroundColor].
          SlidingTutorial(
            pageCount: pageCount,
            notifier: notifier,
          ),

          /// Separator.
          Align(
            alignment: Alignment(0, 0.85),
            child: Container(
              width: double.infinity,
              height: 0.5,
              color: Colors.white,
            ),
          ),

          /// [SlidingIndicator] for [PageView] in [SlidingTutorial].
          Align(
            alignment: Alignment(0, 0.94),
            child: SlidingIndicator(
              indicatorCount: pageCount,
              notifier: notifier,
              activeIndicator: Icon(
                Icons.check_circle,
                size: 10,
                color: Color(0xFF29B6F6),
              ),
              inActiveIndicator: SvgPicture.asset(
                "assets/hollow_circle.svg",
              ),
              margin: 8,
              sizeIndicator: 10,
            ),
          )
        ],
      )),
    );
  }
}
