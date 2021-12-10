import 'package:flutter/material.dart';

import 'game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'XO - Game',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 150),
            HomeNavButton(
              text: 'Player VS Player',
              onPressed: () => Navigator.pushNamed(
                context,
                GameScreen.routeName,
                arguments: const GameScreenArguments(isComputerPlaying: false),
              ),
            ),
            const SizedBox(height: 20),
            HomeNavButton(
              text: 'Player VS Computer',
              onPressed: () => Navigator.pushNamed(
                context,
                GameScreen.routeName,
                arguments: const GameScreenArguments(isComputerPlaying: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeNavButton extends StatelessWidget {
  const HomeNavButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  static const TextStyle buttonStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 60,
      child: ElevatedButton(
        child: Text(text, style: buttonStyle),
        onPressed: onPressed,
      ),
    );
  }
}
