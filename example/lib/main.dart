import 'package:flutter/material.dart';

void main() {
  runApp(const FormsExample());
}

class FormsExample extends StatelessWidget {
  const FormsExample({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Forms Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FormsHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class FormsHomePage extends StatefulWidget {
  const FormsHomePage({super.key, required this.title});

  final String title;

  @override
  State<FormsHomePage> createState() => _FormsHomePageState();
}

class _FormsHomePageState extends State<FormsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (() => createForm()),
          child: const Text('Create form'),
        ),
      ),
    );
  }

  void createForm() {}
}
