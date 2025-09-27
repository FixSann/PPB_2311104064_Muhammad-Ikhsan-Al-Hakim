import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Homepage());
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Aplikasi Gua")),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.black,
            child: Center(
              child: Container(height: 50, width: 50, color: Colors.redAccent),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 100,
            width: 100,
            color: Colors.blueAccent,
            child: Center(
              child: Container(height: 50, width: 50, color: Colors.redAccent),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 100,
            width: 100,
            color: Colors.green,
            child: Center(
              child: Container(height: 50, width: 50, color: Colors.redAccent),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 100,
            width: 100,
            color: Colors.pink,
            child: Center(
              child: Container(height: 50, width: 50, color: Colors.redAccent),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 100,
            width: 100,
            color: Colors.grey,
            child: Center(
              child: Container(height: 50, width: 50, color: Colors.redAccent),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 100,
            width: 100,
            color: Colors.yellow,
            child: Center(
              child: Container(height: 50, width: 50, color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );
  }
}
