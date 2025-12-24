import 'package:flutter/material.dart';
import 'package:place_picker_google/place_picker_google.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickPlacePage extends StatelessWidget {
  const PickPlacePage({super.key});

  static const LatLng _defaultLocation = LatLng(-7.4305826, 109.2492681);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Place Picker")),
      body: PlacePicker(
        apiKey: "API_KEY_KAMU",
        initialLocation: _defaultLocation,
        onPlacePicked: (result) {
          Navigator.pop(context, {
            "name": result.name,
            "address": result.formattedAddress,
            "lat": result.latLng!.latitude,
            "lng": result.latLng!.longitude,
          });
        },
      ),
    );
  }
}
