import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class PlaceLocationView extends StatefulWidget {
  const PlaceLocationView(
      {super.key,
      required this.lat,
      required this.lng,
      required this.placeName});

  final double lat;
  final double lng;
  final String placeName;

  @override
  State<PlaceLocationView> createState() => _PlaceLocationViewState();
}

class _PlaceLocationViewState extends State<PlaceLocationView> {
  final Completer<GoogleMapController> _controller = Completer();
  late CameraPosition _initialPosition;
  MapType _currentMapType = MapType.normal;

  @override
  void initState() {
    super.initState();
    _initialPosition = CameraPosition(
      target: LatLng(widget.lat, widget.lng),
      zoom: 18,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => _animateToLocation());
  }

  Future<void> _animateToLocation() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(_initialPosition),
    );
  }

  void _toggleMapType() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : _currentMapType == MapType.satellite
              ? MapType.hybrid
              : MapType.normal;
    });
  }

  void _shareLocation() {
    final url =
        'https://www.google.com/maps/search/?api=1&query=${widget.lat},${widget.lng}';
    Share.share('Check this location: $url');
  }

  void _openInGoogleMaps() async {
    final url =
        'https://www.google.com/maps/dir/?api=1&destination=${widget.lat},${widget.lng}';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Could not launch Google Maps")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.3),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Location Preview',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: _currentMapType,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            initialCameraPosition: _initialPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: {
              Marker(
                markerId: const MarkerId('place_location'),
                position: LatLng(widget.lat, widget.lng),
                infoWindow: InfoWindow(
                  title: "Selected Location",
                  snippet:
                      'Lat: ${widget.lat.toStringAsFixed(4)}, Lng: ${widget.lng.toStringAsFixed(4)}',
                ),
              ),
            },
          ),
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.placeName.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.layers),
                        tooltip: 'Map Type',
                        onPressed: _toggleMapType,
                      ),
                      IconButton(
                        icon: const Icon(Icons.navigation_outlined),
                        tooltip: 'Open in Google Maps',
                        onPressed: _openInGoogleMaps,
                      ),
                      IconButton(
                        icon: const Icon(Icons.share),
                        tooltip: 'Share Location',
                        onPressed: _shareLocation,
                      ),
                    ],
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
