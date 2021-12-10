import 'package:flutter/material.dart';

import '../utils/game_choices.dart';
import '../constants.dart';

class ChoiceMaker extends StatelessWidget {
  const ChoiceMaker({
    Key? key,
    this.choice,
    required this.onChoice,
  }) : super(key: key);

  final GameChoice? choice;
  final ValueChanged<GameChoice> onChoice;

  @override
  Widget build(BuildContext context) {
    return DragTarget<GameChoice>(
      onAccept: onChoice,
      builder: (context, candidateData, rejectedData) {
        return AspectRatio(
          aspectRatio: 1,
          child: Container(
            margin: const EdgeInsets.all(64.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: Colors.blue, width: 6),
            ),
            alignment: Alignment.center,
            child: candidateData.isEmpty
                ? choice == null
                    ? const Icon(
                        Icons.add_rounded,
                        size: 60,
                        color: Colors.blue,
                      )
                    : _buildGameChoiceImage(choice!)
                : _buildGameChoiceImage(candidateData.first!, 0.5),
          ),
        );
      },
    );
  }

  Widget _buildGameChoiceImage(GameChoice choice, [double opacity = 1.0]) {
    return Opacity(
      opacity: opacity,
      child: Image.asset(
        gameChoiceImagePath(choice),
        width: 150,
        height: 150,
      ),
    );
  }
}
