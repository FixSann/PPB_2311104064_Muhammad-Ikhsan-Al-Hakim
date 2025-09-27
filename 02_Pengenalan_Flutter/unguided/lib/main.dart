import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Homepage());
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Aplikasi Gua",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 157, 68),
      ),
      body: Center(
        child: Row(
          children: [
            Column(
              children: [
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 411,
                  color: const Color.fromARGB(255, 0, 200, 83),
                  child: Center(
                    child: Text(
                      "Muhammad Ikhsan Al Hakim",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 411,
                  color: const Color.fromARGB(255, 50, 205, 50),
                  child: Center(
                    child: Text(
                      "2311104064",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 411,
                  color: const Color.fromARGB(255, 0, 255, 100),
                  child: Center(
                    child: Text(
                      "S1 Software Engineering",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 411,
                  color: const Color.fromARGB(255, 144, 238, 144),
                  child: Center(
                    child: Text(
                      "04 Maret 2006",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 411,
                  color: const Color.fromARGB(255, 173, 255, 47),
                  child: Center(
                    child: Text(
                      "Laki-Laki",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 411,
                  color: const Color.fromARGB(255, 152, 251, 152),
                  child: Center(
                    child: Text(
                      "Lahir di Palembang",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 411,
                  color: const Color.fromARGB(255, 127, 255, 212),
                  child: Center(
                    child: Text(
                      "main",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
