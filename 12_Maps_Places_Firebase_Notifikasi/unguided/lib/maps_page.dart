import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'place_picker.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  static const LatLng _initialPosition = LatLng(-7.4305826, 109.2492681);

  Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId("initial"),
      position: _initialPosition,
      infoWindow: InfoWindow(title: "Lokasi Awal"),
    ),
  };

  String lokasiInfo = "Belum memilih lokasi";

  Future<void> _openPlacePicker() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const PickPlacePage()),
    );

    if (result != null) {
      setState(() {
        lokasiInfo =
            "${result['name']}\n${result['address']}\nLat: ${result['lat']}, Lng: ${result['lng']}";

        _markers = {
          Marker(
            markerId: const MarkerId("picked"),
            position: LatLng(result['lat'], result['lng']),
            infoWindow: InfoWindow(title: result['name']),
          ),
        };
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Maps & Places")),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: _initialPosition,
                zoom: 14,
              ),
              myLocationEnabled: true,
              markers: _markers,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: _openPlacePicker,
                  child: const Text("Pilih Lokasi"),
                ),
                const SizedBox(height: 10),
                Text(lokasiInfo, textAlign: TextAlign.center),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
