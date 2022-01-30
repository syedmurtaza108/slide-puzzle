// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:very_good_slide_puzzle/introduction/introduction_page.dart';
import 'package:very_good_slide_puzzle/puzzle/puzzle.dart';
import 'package:very_good_slide_puzzle/splash/splash_page.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();

    Future<void>.delayed(const Duration(milliseconds: 20), () {
      precacheImage(
        Image.asset('assets/images/shuffle_icon.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/simple_dash_large.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/simple_dash_medium.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/simple_dash_small.png').image,
        context,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case SplashPage.route:
            return MaterialPageRoute<void>(
              builder: (context) => const SplashPage(),
              settings: settings,
            );
          case PuzzlePage.route:
            return MaterialPageRoute<void>(
              builder: (context) => const PuzzlePage(),
              settings: settings,
            );
          case IntroductionAnimationScreen.route:
            return MaterialPageRoute<void>(
              builder: (context) => const IntroductionAnimationScreen(),
              settings: settings,
            );
        }
      },
      initialRoute: SplashPage.route,
    );
  }
}
