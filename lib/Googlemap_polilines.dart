import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GooglemapPolilines extends StatefulWidget {
  const GooglemapPolilines({super.key});

  @override
  State<GooglemapPolilines> createState() => _GooglemapPolilinesState();
}

class _GooglemapPolilinesState extends State<GooglemapPolilines> {
  LatLng myCurrentLocation = const LatLng(11.2588, 75.7804);
  // LatLng myCurrentLocation = const LatLng(28.578382, 81.63359);

  late GoogleMapController googleMapController;
  Set<Marker> markers = {};
  final Set<Polyline> _polyline = {};

  List<LatLng> pointmOnMap = [
    const LatLng(11.2588, 75.7804),
    const LatLng(11.1294, 75.8649),
  ];

  @override
  void initState() {
    // TODO: implement initState

    for (int i = 0; i < pointmOnMap.length; i++) {
      markers.add(Marker(
          markerId: MarkerId(i.toString()),
          position: pointmOnMap[i],
          infoWindow: InfoWindow(
            title: "Place around my country",
            snippet: "So beautiful",
          ),
          icon: BitmapDescriptor.defaultMarker));
      setState(() {
        _polyline.add(Polyline(
            polylineId: PolylineId("Id"),
            points: pointmOnMap,
            color: Colors.blueAccent));
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        polylines: _polyline,
        myLocationButtonEnabled: false,

        markers: markers,
        // Setting the controller when the map is created

        // Initial camera position of the map
        initialCameraPosition: CameraPosition(
          target: myCurrentLocation,
          zoom: 10,
        ),
      ),
    );
  }
}
