import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

List<dynamic> nama = ["Loki", "Moon", "Wheel", "trustplace", "santafe"];
List<Color> warna = [
  Colors.amber,
  Colors.blue,
  Colors.yellow,
  Colors.red,
  Colors.green,
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) =>
                    Container(height: 100, width: 100, color: warna[index]),
                childCount: nama.length,
              ),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
              ),
            ),
            //Sliverlist
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
