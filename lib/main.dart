import 'package:flutter/material.dart';

List<String> titles = <String>['Cloud', 'Beach', 'Sunny'];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const int tabsCount = 3;

    return DefaultTabController(
      length: tabsCount, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Order list'),
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
        ),
      ),
    );
  }
}

