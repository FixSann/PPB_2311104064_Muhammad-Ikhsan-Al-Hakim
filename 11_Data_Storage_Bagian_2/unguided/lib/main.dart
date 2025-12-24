import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://xehuxnxdsfdyobjxikhz.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhlaHV4bnhkc2ZkeW9ianhpa2h6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM0NTQzNjQsImV4cCI6MjA3OTAzMDM2NH0.dR1iMI78vxGrLCgtaXTJf1EhntxQtQfDePPSQ9VII88',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // 👈 INI HOME PAGE
    );
  }
}

// ================= HOME PAGE =================
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final supabase = Supabase.instance.client;
  List dataBuku = [];

  @override
  void initState() {
    super.initState();
    ambilData();
  }

  Future<void> ambilData() async {
    final response = await supabase.from('perpustakaan').select();
    setState(() {
      dataBuku = response;
    });

    print('DATA BUKU DARI SUPABASE:');
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Buku')),
      body: ListView.builder(
        itemCount: dataBuku.length,
        itemBuilder: (context, index) {
          final buku = dataBuku[index];
          return ListTile(
            title: Text(buku['judul']),
            subtitle: Text(
              '${buku['penulis']} • ${buku['tahun_terbit']} • ${buku['genre']}',
            ),
          );
        },
      ),
    );
  }
}
