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
        assert(settings.arguments is GameScreenArguments, 'Invalid arguments');
        return MaterialPageRoute<void>(
          builder: (BuildContext context) => GameScreen(
            arguments: settings.arguments as GameScreenArguments,
          ),
        );
      case ResultsScreen.routeName:
        assert(
            settings.arguments is ResultsScreenArguments, 'Invalid arguments');
        return MaterialPageRoute<void>(
          builder: (BuildContext context) => ResultsScreen(
            arguments: settings.arguments as ResultsScreenArguments,
          ),
        );
      default:
        return null;
    }
  }
}
