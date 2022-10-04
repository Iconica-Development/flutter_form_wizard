import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_example/route.dart';

void main() {
  runApp(const ProviderScope(child: FormsExample()));
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
      home: const FormsHomePage(title: 'Flutter Forms'),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        var routes = getRoutes();
        if (routes.containsKey(settings.name)) {
          return PageRouteBuilder(
            pageBuilder: (_, __, ___) => routes[settings.name]!(context),
            settings: settings,
          );
        } else {
          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => const Text('Page not found'),
          );
        }
      },
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
          onPressed: (() => Navigator.of(context).pushNamed('/form')),
          child: const Text('Create form'),
        ),
      ),
    );
  }
}
