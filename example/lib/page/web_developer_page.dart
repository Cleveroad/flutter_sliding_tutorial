import 'package:flutter/material.dart';
import 'package:flutter_sliding_tutorial/flutter_sliding_tutorial.dart';

class WebDevelopersPage extends StatelessWidget {
  const WebDevelopersPage(
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
              widthFactor: 0.45,
              heightFactor: 0.25,
              child: SlidingContainer(
                  offset: 300,
                  child: Image.asset(
                    'assets/s_1_1.png',
                  )),
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.5),
            child: FractionallySizedBox(
              widthFactor: 0.25,
              heightFactor: 0.10,
              child: SlidingContainer(
                  offset: 170,
                  child: Image.asset(
                    'assets/s_1_8.png',
                  )),
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.30),
            child: FractionallySizedBox(
              widthFactor: 0.15,
              heightFactor: 0.1,
              child: SlidingContainer(
                  offset: 50,
                  child: Image.asset(
                    'assets/s_1_5.png',
                  )),
            ),
          ),
          Align(
            alignment: const Alignment(0.05, -0.45),
            child: FractionallySizedBox(
              widthFactor: 0.15,
              heightFactor: 0.8,
              child: SlidingContainer(
                  offset: 150,
                  child: Image.asset(
                    'assets/s_1_3.png',
                  )),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.15),
            child: FractionallySizedBox(
              widthFactor: 0.13,
              heightFactor: 0.1,
              child: SlidingContainer(
                  offset: 50,
                  child: Image.asset(
                    'assets/s_1_4.png',
                  )),
            ),
          ),
          Align(
            alignment: const Alignment(-0.5, 0),
            child: FractionallySizedBox(
              widthFactor: 0.20,
              heightFactor: 0.07,
              child: SlidingContainer(
                  child: Image.asset(
                'assets/s_1_6.png',
              )),
            ),
          ),
          Align(
            alignment: const Alignment(-0.5, -0.25),
            child: FractionallySizedBox(
              widthFactor: 0.17,
              heightFactor: 0.08,
              child: SlidingContainer(
                  offset: 240,
                  child: Image.asset(
                    'assets/s_1_7.png',
                  )),
            ),
          ),
          Align(
            alignment: const Alignment(0.65, -0.35),
            child: FractionallySizedBox(
              widthFactor: 0.19,
              heightFactor: 0.06,
              child: SlidingContainer(
                  offset: 850,
                  child: Image.asset(
                    'assets/s_1_2.png',
                  )),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.78),
            child: SlidingContainer(
              offset: 250,
              child: Text(
                'Web \nDeveloper'.toUpperCase(),
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
