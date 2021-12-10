import 'package:flutter/material.dart';

import '../widgets/results_bar.dart';
import '../widgets/game_choice_card.dart';
import '../constants.dart';
import 'game_screen.dart';

class ResultsScreenArguments {
  const ResultsScreenArguments({
    required this.player1Choice,
    required this.player2Choice,
    required this.isPlayer2Computer,
  });

  final GameChoice player1Choice;
  final GameChoice player2Choice;
  final bool isPlayer2Computer;
}

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({Key? key, required this.arguments}) : super(key: key);

  static const String routeName = '/results';
  static const TextStyle kPlayerNameTextStyle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );

  final ResultsScreenArguments arguments;

  String get player2Name =>
      arguments.isPlayer2Computer ? 'Computer' : 'Player 2';

  String? get winnerName {
    if (arguments.player1Choice == arguments.player2Choice) {
      return null;
    } else if (arguments.player1Choice == GameChoice.rock &&
            arguments.player2Choice == GameChoice.scissors ||
        arguments.player1Choice == GameChoice.paper &&
            arguments.player2Choice == GameChoice.rock ||
        arguments.player1Choice == GameChoice.scissors &&
            arguments.player2Choice == GameChoice.paper) {
      return 'Player 1';
    } else {
      return player2Name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Player1', style: kPlayerNameTextStyle),
              GameChoiceCard(choice: arguments.player1Choice, size: 150),
              ResultsBar(
                winnerName: winnerName,
                onMenuPressed: () => Navigator.pop(context),
                onReplayPressed: () => Navigator.popAndPushNamed(
                  context,
                  GameScreen.routeName,
                  arguments: GameScreenArguments(
                    isComputerPlaying: arguments.isPlayer2Computer,
                  ),
                ),
              ),
              GameChoiceCard(choice: arguments.player2Choice, size: 150),
              Text(player2Name, style: kPlayerNameTextStyle),
            ],
          ),
        ),
      ),
    );
  }
}
