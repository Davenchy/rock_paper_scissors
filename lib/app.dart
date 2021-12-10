import 'package:flutter/material.dart';

import 'router.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XO Game',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: const MyRouter().onGenerateRoute,
    );
  }
}
