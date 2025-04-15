import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceLocationView extends StatefulWidget {
  const PlaceLocationView({super.key, required this.lat, required this.lng});

  final double lat;
  final double lng;

  @override
  State<PlaceLocationView> createState() => PlaceLocationViewState();
}

class PlaceLocationViewState extends State<PlaceLocationView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    final CameraPosition initialPosition = CameraPosition(
      target: LatLng(widget.lat, widget.lng),
      zoom: 14.4746,
    );

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
              mapType: MapType.hybrid,
              zoomControlsEnabled: true,
              initialCameraPosition: initialPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: {
                Marker(
                  markerId: const MarkerId('place_location'),
                  position: LatLng(widget.lat, widget.lng),
                ),
              }),
          Positioned(
            top: 50,
            right: 15,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios, size: 20),
                padding: const EdgeInsets.all(12),
                constraints: const BoxConstraints(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToNewLocation,
        label: const Text('Move to another location!'),
        icon: const Icon(Icons.location_on),
      ),
    );
  }

  Future<void> _goToNewLocation() async {
    final GoogleMapController controller = await _controller.future;

    const CameraPosition newPosition = CameraPosition(
      target: LatLng(31.034063, 31.357464),
      zoom: 50,
    );

    await controller.animateCamera(CameraUpdate.newCameraPosition(newPosition));
  }
}
