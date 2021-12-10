import 'package:flutter/material.dart';

import 'screens/game_screen.dart';
import 'screens/home_screen.dart';
import 'screens/results_screen.dart';

class MyRouter {
  const MyRouter();

  Route? onGenerateRoute(RouteSettings settings) {
    final String? name = settings.name;

    switch (name ?? '') {
      case HomeScreen.routeName:
        return MaterialPageRoute<void>(
          builder: (BuildContext context) => const HomeScreen(),
        );

      case GameScreen.routeName:
        return MaterialPageRoute<void>(
          builder: (BuildContext context) => const GameScreen(),
        );
      case ResultsScreen.routeName:
        return MaterialPageRoute<void>(
          builder: (BuildContext context) => const ResultsScreen(),
        );
      default:
        return null;
    }
  }
}
