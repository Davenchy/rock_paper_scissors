import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/game_screen.dart';
import 'screens/results_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XO Game',
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        GameScreen.routeName: (context) => const GameScreen(),
        ResultsScreen.routeName: (context) => const ResultsScreen(),
      },
    );
  }
}
