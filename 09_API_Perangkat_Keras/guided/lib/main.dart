import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API Perangkat Keras',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            backgroundColor: Colors.blueGrey[700],
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Perangkat Keras"),
        centerTitle: true,
        elevation: 2,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.settings_applications_rounded,
                size: 80,
                color: Colors.blueGrey,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CameraApp()),
                  );
                },
                child: const Text("Buka Kamera"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _pickImageFromGallery(context);
                },
                child: const Text("Pilih Gambar dari Galeri"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _pickImageFromCamera(context);
                },
                child: const Text("Ambil Gambar dari Kamera"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method untuk memilih gambar dari galeri
  Future<void> _pickImageFromGallery(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      _showImageDialog(context, image);
    }
  }

  // Method untuk mengambil gambar dari kamera
  Future<void> _pickImageFromCamera(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      _showImageDialog(context, image);
    }
  }

  // Method untuk menampilkan dialog dengan gambar yang dipilih
  void _showImageDialog(BuildContext context, XFile image) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Gambar Dipilih'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              image.path,
            ), // Untuk web, gunakan Image.file untuk mobile
            const SizedBox(height: 10),
            Text('Path: ${image.path}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

// Class CameraApp untuk fitur kamera lengkap
class CameraApp extends StatefulWidget {
  const CameraApp({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras![0], ResolutionPreset.medium);
    await _controller!.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kamera'),
        backgroundColor: Colors.blueGrey[700],
      ),
      body: CameraPreview(_controller!),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final XFile? picture = await _controller!.takePicture();
          if (picture != null) {
            // Kembali ke home page dengan gambar yang diambil
            Navigator.pop(context);
          }
        },
        child: const Icon(Icons.camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
