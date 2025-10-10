import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.blue, height: 300, width: 300),
          Container(
            color: const Color.fromARGB(255, 255, 0, 0),
            height: 200,
            width: 200,
          ),
          Container(
            color: const Color.fromARGB(255, 0, 255, 174),
            height: 100,
            width: 100,
          ),
        ],
      ),
    );
  }
}
