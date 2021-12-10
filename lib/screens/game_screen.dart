import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/choice_maker.dart';
import '../widgets/game_bar.dart';
import '../widgets/player_choices.dart';

class GameScreenArguments {
  const GameScreenArguments({required this.isComputerPlaying});

  final bool isComputerPlaying;
}

class GameScreen extends StatelessWidget {
  const GameScreen({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  static const String routeName = '/game';

  final GameScreenArguments arguments;

  bool get isComputerPlaying => arguments.isComputerPlaying;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GameBar(
                playerName: 'Player1',
                timer: 6,
                onMenuPressed: () => Navigator.pop(context),
              ),
              ChoiceMaker(
                onChoice: (GameChoice choice) {},
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: PlayerChoices(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
