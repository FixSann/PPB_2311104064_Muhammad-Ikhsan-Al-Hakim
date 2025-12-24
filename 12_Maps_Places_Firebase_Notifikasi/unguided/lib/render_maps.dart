import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RenderMaps extends StatefulWidget {
  const RenderMaps({super.key});

  @override
  State<RenderMaps> createState() => _RenderMapsState();
}

class _RenderMapsState extends State<RenderMaps> {
  static final LatLng _defaultLocation = const LatLng(-7.417404, 109.251143);
  static final CameraPosition _cameraPosition = CameraPosition(
    target: _defaultLocation,
    zoom: 14.0,
  );

  Set<Marker> _createMarker() {
    return {
      Marker(
        markerId: const MarkerId('Gor Satria'),
        position: _defaultLocation,
      ),
      Marker(
        markerId: const MarkerId('Marker 2'),
        position: LatLng(-7.403080, 109.259509),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Render Maps API')),
      body: GoogleMap(
        initialCameraPosition: _cameraPosition,
        markers: _createMarker(),
        myLocationEnabled: true,
      ),
    );
  }
}
