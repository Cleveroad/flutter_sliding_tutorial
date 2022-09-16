import 'package:flutter/material.dart';
import 'package:flutter_sliding_tutorial/flutter_sliding_tutorial.dart';

class WebAnalyticsPage extends StatelessWidget {
  const WebAnalyticsPage(
    this.page,
    this.notifier, {
    super.key,
  });

  final int page;
  final ValueNotifier<double> notifier;

  @override
  Widget build(BuildContext context) {
    return SlidingPage(
      page: page,
      notifier: notifier,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: FractionallySizedBox(
              widthFactor: 0.5,
              heightFactor: 0.35,
              child: SlidingContainer(
                  offset: 300,
                  child: Image.asset(
                    'assets/s_0_1.png',
                  )),
            ),
          ),
          Align(
            alignment: const Alignment(-0.7, 0.30),
            child: FractionallySizedBox(
              widthFactor: 0.3,
              heightFactor: 0.25,
              child: SlidingContainer(
                  child: Image.asset(
                'assets/s_0_3.png',
              )),
            ),
          ),
          Align(
            alignment: const Alignment(-0.7, -0.08),
            child: FractionallySizedBox(
              widthFactor: 0.20,
              heightFactor: 0.15,
              child: SlidingContainer(
                  child: Image.asset(
                'assets/s_0_4.png',
              )),
            ),
          ),
          Align(
            alignment: const Alignment(-0.92, -0.45),
            child: FractionallySizedBox(
              widthFactor: 0.06,
              heightFactor: 0.06,
              child: SlidingContainer(
                  offset: 150,
                  child: Image.asset(
                    'assets/s_0_6.png',
                  )),
            ),
          ),
          Align(
            alignment: const Alignment(-0.72, -0.46),
            child: FractionallySizedBox(
              widthFactor: 0.09,
              heightFactor: 0.08,
              child: SlidingContainer(
                  offset: 50,
                  child: Image.asset(
                    'assets/s_0_7.png',
                  )),
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.50),
            child: FractionallySizedBox(
              widthFactor: 0.45,
              heightFactor: 0.15,
              child: SlidingContainer(
                  offset: 140,
                  child: Image.asset(
                    'assets/s_0_5.png',
                  )),
            ),
          ),
          Align(
            alignment: const Alignment(0.7, -0.40),
            child: FractionallySizedBox(
              widthFactor: 0.12,
              heightFactor: 0.10,
              child: SlidingContainer(
                  offset: 140,
                  child: Image.asset(
                    'assets/s_0_2.png',
                  )),
            ),
          ),
          Align(
            alignment: const Alignment(0.65, -0.2),
            child: FractionallySizedBox(
              widthFactor: 0.08,
              heightFactor: 0.06,
              child: SlidingContainer(
                  offset: 140,
                  child: Image.asset(
                    'assets/s_0_8.png',
                  )),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.78),
            child: SlidingContainer(
              offset: 250,
              child: Text(
                'Web \nAnalytics'.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
