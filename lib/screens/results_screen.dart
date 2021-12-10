import 'package:flutter/material.dart';

import '../constants.dart';

class ResultsScreenArguments {
  const ResultsScreenArguments({
    required this.player1Choice,
    required this.player2Choice,
  });

  final GameChoice player1Choice;
  final GameChoice player2Choice;
}

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({Key? key, required this.arguments}) : super(key: key);

  static const String routeName = '/results';
  final ResultsScreenArguments arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
    );
  }
}
