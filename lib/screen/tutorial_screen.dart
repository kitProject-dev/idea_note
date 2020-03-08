import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:idea_note/page/tutorial/tutorial1_page.dart';
import 'package:idea_note/page/tutorial/tutorial2_page.dart';
import 'package:idea_note/page/tutorial/tutorial3_page.dart';
import 'package:idea_note/page/tutorial/tutorial4_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TutorialScreen extends StatefulWidget {
  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            children: <Widget>[
              Tutorial1Page(_pageController),
              Tutorial2Page(_pageController),
              Tutorial3Page(_pageController),
              Tutorial4Page(),
            ],
          ),
          Center(
            child: Column(
              children: <Widget>[
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 35),
                  child: SmoothPageIndicator(
                    controller: _pageController, // PageController
                    count: 4,
                    effect: WormEffect(
                        activeDotColor: Colors.blueGrey[400],
                        dotColor: Colors.blueGrey[100]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
