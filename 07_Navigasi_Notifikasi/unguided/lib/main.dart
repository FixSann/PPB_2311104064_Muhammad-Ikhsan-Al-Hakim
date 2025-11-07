import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/cart_page.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(const AcerStoreApp());
}

class AcerStoreApp extends StatefulWidget {
  const AcerStoreApp({super.key});

  @override
  _AcerStoreAppState createState() => _AcerStoreAppState();
}

class _AcerStoreAppState extends State<AcerStoreApp> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  int _selectedIndex = 0;
  String? _userEmail;
  final List<Map<String, dynamic>> _cartItems = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onLogin(String email) {
    setState(() {
      _userEmail = email;
    });
  }

  // ✅ Tambah ke Keranjang (SnackBar hanya di sini → tidak double)
  void _addToCart(Map<String, dynamic> item) {
    setState(() {
      _cartItems.add(item);
    });

    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            "${item['name']} berhasil dimasukkan ke keranjang!",
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.teal,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 250),
      ),
    );
  }

  // ✅ Hapus item keranjang
  void _removeFromCart(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  // ✅ Checkout → hapus item terpilih sekaligus
  void _checkoutItems(List<int> selectedIndexes) {
    selectedIndexes.sort((a, b) => b.compareTo(a));
    setState(() {
      for (var index in selectedIndexes) {
        _cartItems.removeAt(index);
      }
    });

    _scaffoldMessengerKey.currentState?.showSnackBar(
      const SnackBar(
        content: Center(
          child: Text(
            "Checkout Berhasil!",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.teal,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 250),
      ),
    );
  }

  // ✅ Logout
  void _logout() {
    setState(() {
      _userEmail = null;
      _selectedIndex = 0;
      _cartItems.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      title: 'Acer Store',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: _userEmail == null
          ? LoginPage(onLogin: _onLogin)
          : Scaffold(
              body: IndexedStack(
                index: _selectedIndex,
                children: [
                  HomePage(
                    userName: _userEmail!,
                    cartItems: _cartItems,
                    onAddToCart: _addToCart,
                  ),
                  CartPage(
                    cartItems: _cartItems,
                    onRemove: _removeFromCart,
                    onCheckout:
                        _checkoutItems, // ✅ checkout dikirim ke CartPage
                  ),
                  ProfilePage(
                    userEmail: _userEmail!,
                    onLogout: _logout, // ✅ LOGOUT FIX
                  ),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.teal,
                onTap: _onItemTapped,
                items: [
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const Icon(Icons.shopping_cart),
                        if (_cartItems.isNotEmpty)
                          Positioned(
                            right: -6,
                            top: -2,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '${_cartItems.length}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    label: 'Keranjang',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
    );
  }
}
