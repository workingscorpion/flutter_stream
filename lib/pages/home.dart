import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;
  final StreamController<int> streamController = StreamController();

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: streamController.stream,
          initialData: counter,
          builder: (context, snapshot) => Text('You hit me: ${snapshot.data} times'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          streamController.sink.add(counter++);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
