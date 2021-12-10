import 'package:flutter/material.dart';

import '../constants.dart';

class ChoiceMaker extends StatefulWidget {
  const ChoiceMaker({
    Key? key,
    required this.onChoice,
  }) : super(key: key);

  final ValueChanged<GameChoice> onChoice;

  @override
  State<ChoiceMaker> createState() => _ChoiceMakerState();
}

class _ChoiceMakerState extends State<ChoiceMaker> {
  GameChoice? currentChoice;

  @override
  Widget build(BuildContext context) {
    return DragTarget<GameChoice>(
      onAccept: (GameChoice choice) {
        widget.onChoice(choice);
        setState(() => currentChoice = choice);
      },
      builder: (context, candidateData, rejectedData) {
        return AspectRatio(
          aspectRatio: 1,
          child: GestureDetector(
            child: Container(
              margin: const EdgeInsets.all(64.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: Colors.blue, width: 6),
              ),
              child: candidateData.isEmpty
                  ? currentChoice == null
                      ? const Icon(
                          Icons.add,
                          size: 60,
                          color: Colors.blue,
                        )
                      : Text(
                          currentChoice.toString(),
                        )
                  : Text(
                      candidateData.first.toString(),
                    ),
            ),
          ),
        );
      },
    );
  }
}
