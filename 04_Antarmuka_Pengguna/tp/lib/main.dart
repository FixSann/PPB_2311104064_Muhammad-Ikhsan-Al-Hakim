import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Rekomendasi Wisata"),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Candi borobudur",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Image.network(
                  "https://torch.id/cdn/shop/articles/Artikel_173_-_Preview.webp?v=1713644561.jpg",
                  width: 250,
                ),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Candi Borobudur adalah candi Buddha terbesar di dunia yang terletak di Magelang, Jawa Tengah, Indonesia. "
                    "Candi ini dibangun pada abad ke-8 oleh Dinasti Syailendra dan menjadi salah satu situs warisan dunia UNESCO. "
                    "Dengan arsitektur megah berbentuk stupa berundak, Borobudur menjadi ikon budaya Indonesia "
                    "dan destinasi wisata religi maupun sejarah yang terkenal di seluruh dunia.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
