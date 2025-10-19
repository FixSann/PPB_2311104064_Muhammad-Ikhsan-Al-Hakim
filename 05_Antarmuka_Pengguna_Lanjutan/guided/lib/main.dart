import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

List<dynamic> nama = ["San", "Sin", "Sun"];
List<Color> warna = [
  Colors.deepPurpleAccent,
  CupertinoColors.systemCyan,
  CupertinoColors.lightBackgroundGray,
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            // Sliver grid
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  height: 100,
                  width: 100,
                  color: warna[index],
                  child: Text("${nama[index]}"),
                ),
                childCount: nama.length,
              ),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
              ),
            ),
            // Sliver List
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  height: 100,
                  width: 100,
                  color: warna[index],
                  child: Text("${nama[index]}"),
                ),
                childCount: nama.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
