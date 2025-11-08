import 'package:flutter/material.dart';

void main() {
  runApp(const LatihanMemilihGambarApp());
}

class LatihanMemilihGambarApp extends StatelessWidget {
  const LatihanMemilihGambarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Latihan Memilih Gambar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const LatihanMemilihGambarPage(),
    );
  }
}

class LatihanMemilihGambarPage extends StatelessWidget {
  const LatihanMemilihGambarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F8), // warna background lembut
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        title: const Text(
          "Latihan Memilih Gambar",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container gambar
              Container(
                width: 250,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Icon(
                    Icons.image_outlined,
                    color: Colors.grey,
                    size: 100,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Tombol Camera dan Gallery
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Tombol Camera
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.black87,
                    ),
                    label: const Text(
                      "Camera",
                      style: TextStyle(color: Colors.black87),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      elevation: 0,
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Tombol Gallery
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.photo_library_outlined,
                      color: Colors.black87,
                    ),
                    label: const Text(
                      "Gallery",
                      style: TextStyle(color: Colors.black87),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      elevation: 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // Tombol Hapus Gambar
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(220, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  "Hapus Gambar",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
