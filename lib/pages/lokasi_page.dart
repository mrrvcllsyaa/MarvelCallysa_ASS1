import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LokasiPage extends StatelessWidget {
  const LokasiPage({super.key});

  static const LatLng lokasiGreenLife = LatLng(
    -6.914744,
    107.609810,
  );

  @override
  Widget build(BuildContext context) {
    final Set<Marker> markers = {
      const Marker(
        markerId: MarkerId('EcoMart-bandung'),
        position: lokasiGreenLife,
        infoWindow: InfoWindow(
          title: 'EcoMart Bandung',
          snippet: 'Lokasi simulasi komunitas EcoMart',
        ),
      ),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lokasi EcoMart'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: lokasiGreenLife,
          zoom: 15,
        ),
        markers: markers,
        mapType: MapType.normal,
      ),
    );
  }
}