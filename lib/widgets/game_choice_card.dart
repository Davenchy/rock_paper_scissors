import 'package:flutter/material.dart';

import '../utils/game_choices.dart';
import '../constants.dart';

class GameChoiceCard extends StatelessWidget {
  const GameChoiceCard({
    Key? key,
    required this.choice,
    this.size = 20,
  }) : super(key: key);

  final GameChoice choice;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue, width: 4),
      ),
      child: Image.asset(
        gameChoiceImagePath(choice),
        width: size,
        height: size,
      ),
    );
  }
}
