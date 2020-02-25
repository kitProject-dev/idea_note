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
    final settingsModel = Provider.of<SettingsModel>(context, listen: false);
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
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Scrollbar(
                    child: Column(
                      children: [
                        const Text('タイトル設定。'),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RaisedButton(
                              child: Text('デフォルトを利用',
                                  style: themeData.textTheme.button),
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              onPressed: () async {
                                await settingsModel.clearWords();
                                await _pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                            ),
                            RaisedButton(
                              child:
                                  Text('設定', style: themeData.textTheme.button),
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              onPressed: () async {
                                final result = await Navigator.of(context)
                                    .pushNamed(RoutePath.settingTitle) as bool;
                                if (result) {
                                  await _pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                }
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: RaisedButton(
                  child: Text('完了', style: themeData.textTheme.button),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () async {
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
                    count: 5,
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
