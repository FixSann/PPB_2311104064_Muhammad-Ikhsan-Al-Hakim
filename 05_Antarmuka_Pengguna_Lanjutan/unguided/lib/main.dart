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
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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
        kategori: 'Wisata Alam',
        rating: 4.5,
      ),
      TempatWisata(
        nama: 'Curug Cipendok',
        foto: 'https://cdn.antaranews.com/cache/1200x800/2018/10/view-deck.jpg',
        deskripsi:
            'Curug Cipendok merupakan air terjun setinggi 92 meter yang terletak di kawasan hutan lindung lereng Gunung Slamet. Keindahan alam yang masih alami dan suasana yang tenang membuat tempat ini cocok untuk refreshing.',
        kategori: 'Air Terjun',
        rating: 4.7,
      ),
      TempatWisata(
        nama: 'Telaga Sunyi',
        foto:
            'https://visitjawatengah.jatengprov.go.id/assets/images/730c64c2-1e01-41d2-8e4a-36e813e98252.jpg',
        deskripsi:
            'Telaga Sunyi adalah danau alami yang dikelilingi oleh pepohonan pinus. Suasananya yang tenang dan damai membuat tempat ini ideal untuk bersantai dan menikmati keindahan alam.',
        kategori: 'Danau',
        rating: 4.3,
      ),
      TempatWisata(
        nama: 'Museum Wayang Sendang Mas',
        foto:
            'https://cdn.paradisotour.co.id/wp-content/uploads/2025/01/Museum-Wayang-Sendang-Mas.webp',
        deskripsi:
            'Museum yang menyimpan berbagai koleksi wayang dari berbagai daerah di Indonesia. Tempat ini menjadi sarana edukasi budaya yang penting untuk melestarikan seni pewayangan.',
        kategori: 'Museum',
        rating: 4.4,
      ),
      TempatWisata(
        nama: 'Small World Purwokerto',
        foto:
            'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgKl2dwqQiuXwCEd3FKRoY_UgsRZd8wunGWfg2BDp4XOO_BGNTfTkWzFFQzg2NkliVAdOlPSNQqqATvgnLTpuprejl6K1K81813aDbQ31XpP22KvvYd621jzrjcDYpOOSXATaEJqKDVTVKTRtFS7eBOAxF42oA05NCk1wlrAv3GC9w8vtlW2MK2L2BW/s1600/20220817_084919646.jpg',
        deskripsi:
            'Taman miniatur yang menampilkan replika bangunan ikonik dunia dalam skala kecil. Cocok untuk berfoto dan edukasi keluarga.',
        kategori: 'Taman Wisata',
        rating: 4.2,
      ),
      TempatWisata(
        nama: 'Owabong Water Park',
        foto:
            'https://www.nativeindonesia.com/foto/2023/04/owabong-waterpark-purbalingga.jpg',
        deskripsi:
            'Taman air terbesar di Jawa Tengah dengan berbagai wahana air yang seru dan menantang. Destinasi favorit untuk liburan keluarga.',
        kategori: 'Water Park',
        rating: 4.6,
      ),
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar dengan efek parallax
          SliverAppBar(
            expandedHeight: 280.0,
            floating: false,
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.deepPurple,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Wisata Banyumas',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 3,
                      color: Colors.black45,
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://www.joglosemarbus.com/uploads/berita_image/IN_20250131092446_3.lokawisata-baturraden.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.deepPurple[300],
                        child: const Icon(
                          Icons.landscape,
                          size: 80,
                          color: Colors.white54,
                        ),
                      );
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: const Column(
                        children: [
                          Text(
                            'Jelajahi Keindahan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 2,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Kabupaten Banyumas',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Header Section
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.deepPurple.shade50, Colors.white],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.place,
                          color: Colors.deepPurple.shade700,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Destinasi Populer',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            Text(
                              '${daftarWisata.length} tempat wisata menanti Anda',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // SliverList untuk menampilkan daftar wisata
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return WisataCard(wisata: daftarWisata[index], index: index);
            }, childCount: daftarWisata.length),
          ),

          // Footer
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(color: Colors.deepPurple.shade50),
              child: Column(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.deepPurple.shade300,
                    size: 32,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Terima kasih telah mengunjungi',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Wisata Banyumas',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '© 2025 Rekomendasi Wisata Banyumas',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WisataCard extends StatelessWidget {
  final TempatWisata wisata;
  final int index;

  const WisataCard({Key? key, required this.wisata, required this.index})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, index == 0 ? 8 : 12, 20, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image dengan Overlay
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    wisata.foto,
                    width: double.infinity,
                    height: 220,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: 220,
                        color: Colors.grey[300],
                        child: Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                : null,
                            color: Colors.deepPurple,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 220,
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
                // Kategori Badge
                Positioned(
                  top: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      wisata.kategori,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                // Rating Badge
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Colors.white, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          wisata.rating.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Content Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama Wisata
                  Text(
                    wisata.nama,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Divider
                  Container(
                    width: 50,
                    height: 3,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Deskripsi
                  Text(
                    wisata.deskripsi,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),

                  // Action Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Membuka lokasi ${wisata.nama}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            backgroundColor: Colors.deepPurple,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: const Icon(Icons.map, size: 20),
                      label: const Text(
                        'Lihat Lokasi',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Model class untuk Tempat Wisata
class TempatWisata {
  final String nama;
  final String foto;
  final String deskripsi;
  final String kategori;
  final double rating;

  TempatWisata({
    required this.nama,
    required this.foto,
    required this.deskripsi,
    required this.kategori,
    required this.rating,
  });
}
