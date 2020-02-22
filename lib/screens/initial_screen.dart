import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:idea_note/model/settings_model.dart';
import 'package:idea_note/route.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            children: <Widget>[
              const Center(
                child: Text('チュートリアル1'),
              ),
              const Center(
                child: Text('チュートリアル2'),
              ),
              const Center(
                child: Text('チュートリアル3'),
              ),
              Center(
                child: RaisedButton(
                  child: Text('完了', style: themeData.textTheme.button),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () async {
                    final settingsModel =
                        Provider.of<SettingsModel>(context, listen: false);
                    await settingsModel.setUpCompleted();
                    await Navigator.of(context)
                        .pushReplacementNamed(RoutePath.home);
                  },
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              children: <Widget>[
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SmoothPageIndicator(
                    controller: _pageController, // PageController
                    count: 4,
                    effect: const WormEffect(), // your preferred effect
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
