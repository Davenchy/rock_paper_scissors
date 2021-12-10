import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import 'results_screen.dart';
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
  late Ticker ticker;

  Duration timer = Duration.zero;

  GameChoice? player1Choice;
  GameChoice? player2Choice;

  bool isPlayer2 = false;

  bool get isComputerPlaying => widget.arguments.isComputerPlaying;
  String get player2Name => isComputerPlaying ? 'Computer' : 'Player 2';

  @override
  void initState() {
    ticker = Ticker(onTick);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
      );

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context2) {
          return AlertDialog(
            content: const Text('Are you ready?'),
            actions: [
              ElevatedButton(
                child: const Text('Start'),
                onPressed: () {
                  Navigator.of(context2).pop();
                  ticker.start();
                },
              ),
              TextButton(
                child: const Text('Back'),
                onPressed: () {
                  Navigator.of(context2).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GameBar(
                playerName: isPlayer2
                    ? isComputerPlaying
                        ? 'Computer'
                        : 'Player2'
                    : 'Player1',
                timer: (kChoiceWaitDuration - timer).inSeconds,
                onMenuPressed: () => Navigator.pop(context),
              ),
              ChoiceMaker(
                // choice: isPlayer2 ? player2Choice : player1Choice,
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
    ticker.stop();
    setState(() {
      if (isPlayer2) {
        player2Choice = choice;
      } else {
        player1Choice = choice;
      }
    });

    if (!isPlayer2) {
      showDialog(
        context: context,
        barrierDismissible: !isComputerPlaying,
        builder: (context) {
          return AlertDialog(
            title: Text('Now it\'s $player2Name turn'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  setState(
                    () {
                      isPlayer2 = true;
                      if (isComputerPlaying) player2Choice = getRandomChoice();
                    },
                  );

                  if (isComputerPlaying) {
                    Timer(
                      const Duration(milliseconds: 500),
                      () {
                        Navigator.pop(context);
                        showResults();
                      },
                    );
                  } else {
                    ticker.start();
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          );
        },
      );
    } else {
      showResults();
    }
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
        isPlayer2Computer: isComputerPlaying,
      ),
    );
  }

  onTick(Duration elapsed) {
    // TODO: optimize this
    setState(() => timer = elapsed);
    if (elapsed < kChoiceWaitDuration) return;

    ticker.stop();
    setState(() => timer = Duration.zero);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Time is up!'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                if (isPlayer2) {
                  setState(() => player2Choice = getRandomChoice());
                  showResults();
                } else {
                  setState(() {
                    isPlayer2 = true;
                    player1Choice = getRandomChoice();
                    if (isComputerPlaying) {
                      player2Choice = getRandomChoice();
                      showResults();
                    } else {
                      ticker.start();
                      Navigator.pop(context);
                    }
                  });
                }
              },
            ),
          ],
        );
      },
    );
  }
}
