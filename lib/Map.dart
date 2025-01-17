import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapflutter extends StatefulWidget {
  const Mapflutter({super.key});

  @override
  State<Mapflutter> createState() => _MapflutterState();
}

class _MapflutterState extends State<Mapflutter> {
  LatLng mucurrentlocation = const LatLng(27.7172, 85.3240);
  Set<Marker> markers = {};
  late GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Google Map",
          style: TextStyle(
              color: Colors.blue, fontSize: 30, fontWeight: FontWeight.w900),
        ),
      ),
      body: GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            googleMapController = controller;
          },
          markers: markers,
          initialCameraPosition:
              CameraPosition(target: mucurrentlocation, zoom: 14)),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.my_location,
          size: 30,
        ),
        onPressed: () async {
          // Getting the current position of the user
          Position position = await currentPosition();

          // Animating the camera to the user's current position
          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 14,
              ),
            ),
          );

          // Clearing existing markers
          markers.clear();
          // Adding a new marker at the user's current position
          markers.add(
            Marker(
              markerId: const MarkerId('currentLocation'),
              position: LatLng(position.latitude, position.longitude),
            ),
          );

          // Refreshing the state to update the UI with new markers
          setState(() {});
        },
      ),
    );
  }

  Future<Position> currentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Checking if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    // Checking the location permission status
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Requesting permission if it is denied
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    // Handling the case where permission is permanently denied
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    // Getting the current position of the user
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}
