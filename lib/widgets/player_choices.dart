import 'package:flutter/material.dart';

import '../constants.dart';

class PlayerChoices extends StatelessWidget {
  const PlayerChoices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (final choice in List.from(GameChoice.values)..shuffle())
          Draggable<GameChoice>(
            data: choice,
            feedback: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Material(
                color: Colors.red,
                child: Container(
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: Text('$choice'),
                ),
              ),
            ),
            child: Container(
              width: 100,
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text('$choice'),
            ),
          ),
      ],
    );
  }
}
