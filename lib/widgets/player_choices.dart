import 'package:flutter/material.dart';
import 'package:xo_game/utils/game_choices.dart';

import '../constants.dart';

class PlayerChoices extends StatelessWidget {
  const PlayerChoices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // TODO: fix shuffle not working between players becuase no set state between them
        for (final choice in List.from(GameChoice.values)..shuffle())
          Draggable<GameChoice>(
            data: choice,
            feedback: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                gameChoiceImagePath(choice),
                width: 100,
                height: 100,
              ),
            ),
            child: _buildChild(choice),
            childWhenDragging: _buildChild(),
          ),
      ],
    );
  }

  Widget _buildChild([GameChoice? choice]) {
    return Container(
      width: 100,
      height: 100,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.blue,
          width: 2,
        ),
      ),
      child: choice != null
          ? Image.asset(
              gameChoiceImagePath(choice),
            )
          : null,
    );
  }
}
