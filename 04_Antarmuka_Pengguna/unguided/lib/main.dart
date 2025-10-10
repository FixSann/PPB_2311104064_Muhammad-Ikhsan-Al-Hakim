import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata Banyumas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const RekomendasiWisataPage(),
    );
  }
}

class RekomendasiWisataPage extends StatelessWidget {
  const RekomendasiWisataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Data wisata Banyumas
    final List<TempatWisata> daftarWisata = [
      TempatWisata(
        nama: 'Baturraden',
        foto:
            'https://www.joglosemarbus.com/uploads/berita_image/IN_20250131092446_3.lokawisata-baturraden.png',
        deskripsi:
            'Baturraden adalah sebuah objek wisata alam yang terletak di lereng Gunung Slamet, sekitar 15 kilometer dari pusat kota Purwokerto, Kabupaten Banyumas, Jawa Tengah. Terkenal dengan pemandangan alamnya yang indah dan udara yang sejuk, Baturraden menjadi destinasi favorit wisatawan lokal maupun mancanegara.',
        lokasi: 'Kunjungi Sekarang',
      ),
      TempatWisata(
        nama: 'Curug Cipendok',
        foto: 'https://cdn.antaranews.com/cache/1200x800/2018/10/view-deck.jpg',
        deskripsi:
            'Curug Cipendok merupakan air terjun setinggi 92 meter yang terletak di kawasan hutan lindung lereng Gunung Slamet. Keindahan alam yang masih alami dan suasana yang tenang membuat tempat ini cocok untuk refreshing.',
        lokasi: 'Kunjungi Sekarang',
      ),

      TempatWisata(
        nama: 'Telaga Sunyi',
        foto:
            'https://visitjawatengah.jatengprov.go.id/assets/images/730c64c2-1e01-41d2-8e4a-36e813e98252.jpg',
        deskripsi:
            'Telaga Sunyi adalah danau alami yang dikelilingi oleh pepohonan pinus. Suasananya yang tenang dan damai membuat tempat ini ideal untuk bersantai dan menikmati keindahan alam.',
        lokasi: 'Kunjungi Sekarang',
      ),
      TempatWisata(
        nama: 'Museum Wayang Sendang Mas',
        foto:
            'https://cdn.paradisotour.co.id/wp-content/uploads/2025/01/Museum-Wayang-Sendang-Mas.webp',
        deskripsi:
            'Museum yang menyimpan berbagai koleksi wayang dari berbagai daerah di Indonesia. Tempat ini menjadi sarana edukasi budaya yang penting untuk melestarikan seni pewayangan.',
        lokasi: 'Kunjungi Sekarang',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rekomendasi Wisata',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 2,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: daftarWisata.length,
        itemBuilder: (context, index) {
          return WisataCard(wisata: daftarWisata[index]);
        },
      ),
    );
  }
}

class WisataCard extends StatelessWidget {
  final TempatWisata wisata;

  const WisataCard({Key? key, required this.wisata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          // Nama Wisata
          Text(
            wisata.nama,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          // Foto Wisata
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              wisata.foto,
              width: 300,
              height: 200,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: 300,
                  height: 200,
                  color: Colors.grey[300],
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 300,
                  height: 200,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.image_not_supported,
                    size: 50,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          // Deskripsi Wisata
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              wisata.deskripsi,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 16),
          // Tombol Lokasi
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Membuka lokasi ${wisata.nama}'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            child: Text(
              wisata.lokasi,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

// Model class untuk Tempat Wisata
class TempatWisata {
  final String nama;
  final String foto;
  final String deskripsi;
  final String lokasi;

  TempatWisata({
    required this.nama,
    required this.foto,
    required this.deskripsi,
    required this.lokasi,
  });
}
