import 'package:flutter/material.dart';

class GameBar extends StatelessWidget {
  const GameBar({
    Key? key,
    required this.playerName,
    required this.timer,
    required this.onMenuPressed,
    this.color = Colors.white,
    this.backgroundColor = Colors.blue,
  }) : super(key: key);

  final String playerName;
  final int timer;
  final VoidCallback onMenuPressed;
  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: backgroundColor,
      child: Row(
        children: [
          Text(
            playerName,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const Spacer(),
          Icon(Icons.timer, size: 32, color: color),
          const SizedBox(width: 5),
          Text(
            timer.toString().padLeft(2, '0'),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(width: 14),
          IconButton(
            onPressed: onMenuPressed,
            icon: Icon(Icons.menu_rounded, size: 32, color: color),
          ),
        ],
      ),
    );
  }
}
