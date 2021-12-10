import 'dart:math';

import 'package:flutter/material.dart';
import 'package:xo_game/screens/results_screen.dart';

import '../constants.dart';
import '../widgets/choice_maker.dart';
import '../widgets/game_bar.dart';
import '../widgets/player_choices.dart';

class GameScreenArguments {
  const GameScreenArguments({required this.isComputerPlaying});

  final bool isComputerPlaying;
}

class GameScreen extends StatefulWidget {
  const GameScreen({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  static const String routeName = '/game';

  final GameScreenArguments arguments;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  GameChoice? player1Choice;
  GameChoice? player2Choice;

  bool isPlayer2 = false;

  bool get isComputerPlaying => widget.arguments.isComputerPlaying;

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
                onChoice: onPlayerChoice,
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

  onPlayerChoice(GameChoice choice) {
    // TODO: delay show results for both player2 and computer
    setState(() {
      if (!isPlayer2) {
        player1Choice = choice;
        isPlayer2 = true;

        if (isComputerPlaying) {
          player2Choice = getRandomChoice();
          showResults();
        }
      } else {
        player2Choice = choice;
        showResults();
      }
    });
  }

  GameChoice getRandomChoice() {
    final random = Random();
    const choices = GameChoice.values;
    return choices[random.nextInt(choices.length)];
  }

  void showResults() {
    assert(player1Choice != null, 'player1 choice can not be null');
    assert(player2Choice != null, 'player2 choice can not be null');

    Navigator.pushReplacementNamed(
      context,
      ResultsScreen.routeName,
      arguments: ResultsScreenArguments(
        player1Choice: player1Choice!,
        player2Choice: player2Choice!,
      ),
    );
  }
}
