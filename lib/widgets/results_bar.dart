import 'package:flutter/material.dart';

import 'inner_rounds_clipper.dart';

class ResultsBar extends StatelessWidget {
  const ResultsBar({
    Key? key,
    required this.player2Name,
    required this.onReplayPressed,
    required this.onMenuPressed,
  }) : super(key: key);

  final String player2Name;
  final VoidCallback onReplayPressed;
  final VoidCallback onMenuPressed;

  @override
  Widget build(BuildContext context) {
    return InnerRoundsClipper(
      roundsHeight: 40,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.refresh, size: 30, color: Colors.white),
              onPressed: onReplayPressed,
            ),
            Text(
              'Winner $player2Name',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.menu_rounded,
                size: 30,
                color: Colors.white,
              ),
              onPressed: onMenuPressed,
            ),
          ],
        ),
      ),
    );
  }
}
