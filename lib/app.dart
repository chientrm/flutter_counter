import 'package:flutter/material.dart';

import 'home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}
