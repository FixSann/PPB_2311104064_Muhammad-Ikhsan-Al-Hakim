import 'package:flutter/material.dart';
import 'product_detail_page.dart';
import 'cart_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  final String userName;
  final Function(Map<String, dynamic>) onAddToCart;
  final List<Map<String, dynamic>> cartItems;

  const HomePage({
    super.key,
    required this.userName,
    required this.onAddToCart,
    required this.cartItems,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentBanner = 0;
  final PageController _bannerController = PageController();

  final List<String> _bannerImages = [
    'assets/images/banner1.jpg',
    'assets/images/banner2.jpg',
    'assets/images/banner3.jpg',
  ];

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Acer Aspire 5',
      'price': 8000000,
      'image': 'assets/images/aspire5.jpg',
      'desc':
          'Acer Aspire 5 merupakan laptop yang dirancang untuk kebutuhan produktivitas sehari-hari, belajar, hiburan, hingga pekerjaan ringan hingga menengah. Dengan desain tipis dan bobot yang ringan, laptop ini mudah dibawa dan nyaman digunakan dimanapun. Mengusung performa prosesor generasi terbaru serta kapasitas RAM yang memadai, Aspire 5 mampu memberikan kinerja yang stabil dan responsif. Laptop ini juga dilengkapi layar berukuran 15.6 inci beresolusi Full HD yang menghasilkan tampilan tajam dan nyaman untuk kegiatan mengetik, menonton film, hingga meeting online. Selain itu, sistem pendingin yang optimal menjaga suhu tetap stabil saat digunakan dalam waktu lama.',
    },
    {
      'name': 'Acer Nitro 5',
      'price': 14000000,
      'image': 'assets/images/nitro5.jpg',
      'desc':
          'Laptop gaming Acer Nitro 5 adalah pilihan yang sangat cocok bagi pengguna yang mencari performa serius untuk game, konten kreatif ringan, dan multitasking – namun tetap dengan harga yang relatif bersahabat. Dengan kombinasi prosesor generasi baru, kartu grafis dedicated, dan layar yang mendukung refresh rate tinggi, Nitro 5 mampu menghadirkan pengalaman yang smooth baik untuk gaming maupun produktivitas. Nitro 5 hadir dalam beberapa varian (Intel maupun AMD) dan telah diperbarui secara berkala dengan hardware terbaru. Sebagai contoh, salah satu model menggunakan prosesor Intel Core i7 generasi ke-12 bersama GPU NVIDIA GeForce RTX 3050.',
    },
    {
      'name': 'Acer Swift X',
      'price': 13000000,
      'image': 'assets/images/swiftx.jpg',
      'desc':
          'Laptop Acer Swift X 14 merupakan pilihan ideal bagi pengguna yang mencari perpaduan antara performa tinggi dan portabilitas. Meskipun ukurannya kompak (~14,5 inci untuk varian terbaru), Swift X 14 dilengkapi dengan prosesor kelas atas serta GPU dedicated sehingga cocok untuk kegiatan produktivitas berat, pembuatan konten, bahkan gaming ringan. Dengan desain yang tipis dan bobot relatif ringan untuk kelasnya, laptop ini mendukung pengguna yang mobile bisa dibawa ke kampus, kantor, coworking, atau untuk kerja remote.',
    },
    {
      'name': 'Acer Predator Helios 300',
      'price': 20000000,
      'image': 'assets/images/helios300.jpg',
      'desc':
          'Acer Predator Helios 300 adalah laptop gaming yang dirancang untuk memberikan performa tinggi dan stabil dalam berbagai aktivitas berat, mulai dari bermain game AAA, editing video, 3D rendering, hingga multitasking profesional. Helios 300 menawarkan kombinasi antara kekuatan hardware, desain gaming futuristik, serta sistem pendinginan canggih yang membuat laptop ini tetap bertenaga meskipun digunakan dalam waktu lama.',
    },
  ];

  @override
  void initState() {
    super.initState();
    // Auto slide banner tiap 3 detik
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) return false;
      setState(() {
        _currentBanner = (_currentBanner + 1) % _bannerImages.length;
      });
      _bannerController.animateToPage(
        _currentBanner,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
      return true;
    });
  }

  void _addToCart(Map<String, dynamic> product) {
    widget.onAddToCart(product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Acer Store',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Banner Slider
            SizedBox(
              height: 180,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    controller: _bannerController,
                    itemCount: _bannerImages.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentBanner = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          _bannerImages[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      );
                    },
                  ),

                  // Indicator dots
                  Positioned(
                    bottom: 10,
                    child: Row(
                      children: List.generate(_bannerImages.length, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: _currentBanner == index ? 20 : 8,
                          decoration: BoxDecoration(
                            color: _currentBanner == index
                                ? Colors.teal
                                : Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Grid Produk
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          product: product,
                          onAddToCart: _addToCart,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.asset(
                              product['image'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Rp ${product['price']}",
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
