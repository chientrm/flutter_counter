import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_counter/stream_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    final controller = StreamController<int>();
    controller.add(0);
    return CStreamBuilder(
      stream: controller.stream,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(title: const Text('Defund Stateful')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$snapshot',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => controller.add(snapshot + 1),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
