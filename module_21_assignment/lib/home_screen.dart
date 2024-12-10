import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late GoogleMapController mapController;
  Set<Marker> _markers = {};
  Polyline _polyline = const Polyline(polylineId: PolylineId('path'));
  LatLng _currentLocation = LatLng(23.78829596078535, 90.42486190416521);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  // 1. Fetch current location and update the map
  void _getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
      _markers.add(Marker(
        markerId: MarkerId('current_location'),
        position: _currentLocation,
        infoWindow: InfoWindow(
          title: 'My current location',
          snippet: 'Lat: ${_currentLocation.latitude}, Lng: ${_currentLocation.longitude}',
        ),
      ));
    });
    mapController.animateCamera(CameraUpdate.newLatLngZoom(_currentLocation, 15));

    // Start fetching location every 10 seconds
    _timer = Timer.periodic(Duration(seconds: 10), (Timer t) => _updateLocation());
  }

  // 2. Update location every 10 seconds and add polyline
  void _updateLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      LatLng newLocation = LatLng(position.latitude, position.longitude);
      _markers.add(Marker(
        markerId: MarkerId('current_location'),
        position: newLocation,
        infoWindow: InfoWindow(
          title: 'My current location',
          snippet: 'Lat: ${newLocation.latitude}, Lng: ${newLocation.longitude}',
        ),
      ));
      _polyline = Polyline(
        polylineId: PolylineId('path'),
        points: [_currentLocation, newLocation],
        color: Colors.blue,
        width: 5,
      );
      _currentLocation = newLocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real-Time Location Tracker'),
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: _currentLocation,
          zoom: 15,
        ),
        markers: _markers,
        polylines: {_polyline},
      ),
    );
  }
}
