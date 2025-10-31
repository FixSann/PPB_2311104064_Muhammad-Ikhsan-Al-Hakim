import 'package:flutter/material.dart';
import 'pages/secondPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Halaman 1",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, _createSmoothRoute());
              },
              child: const Text("Pergi ke Halaman 2"),
            ),
          ],
        ),
      ),
    );
  }

  // 🔥 Transisi halus ke kiri (masuk Halaman 2)
  Route _createSmoothRoute() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 600), // durasi halus
      reverseTransitionDuration: const Duration(milliseconds: 600),
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SecondPage(title: "Halaman 2"),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // dari kanan
        const end = Offset.zero; // ke tengah
        final curve = Curves.easeInOutCubic; // kurva lembut

        final tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: FadeTransition(
            // ✨ efek fade lembut juga
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }
}
