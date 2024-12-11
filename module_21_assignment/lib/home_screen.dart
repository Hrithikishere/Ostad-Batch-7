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
  Position? position;
  Timer? _timer;

  Future<void> listenCurrentLocation() async {
    final isGranted = await isLocationPermissionGranted();
    if (isGranted) {
      final isServiceEnabled = await checkGPSServiceEnable();
      if (isServiceEnabled) {
        Geolocator.getPositionStream(
                locationSettings: const LocationSettings(
                    // timeLimit: Duration(seconds: 3),
                    distanceFilter: 10,
                    accuracy: LocationAccuracy.bestForNavigation))
            .listen((pos) {
          print(pos);
        });
      } else {
        Geolocator.openLocationSettings();
      }
    } else {
      final result = await requestLocationPermission();
      if (result) {
        getCurrentLocation();
      } else {
        Geolocator.openAppSettings();
      }
    }
  }

  Future<void> getCurrentLocation() async {
    final isGranted = await isLocationPermissionGranted();
    if (isGranted) {
      final isServiceEnabled = await checkGPSServiceEnable();
      if (isServiceEnabled) {
        Position p = await Geolocator.getCurrentPosition();
        position = p;
        setState(() {});
      } else {
        Geolocator.openLocationSettings();
      }
    } else {
      final result = await requestLocationPermission();
      if (result) {
        getCurrentLocation();
      } else {
        Geolocator.openAppSettings();
      }
    }
  }

  Future<bool> isLocationPermissionGranted() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> checkGPSServiceEnable() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  @override
  void initState() {
    super.initState();
    listenCurrentLocation();
    _getUserLocation();
  }

  void _getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
      _markers.add(Marker(
        markerId: MarkerId('current_location'),
        position: _currentLocation,
        infoWindow: InfoWindow(
          title: 'My current location',
          snippet:
              'Lat: ${_currentLocation.latitude}, Lng: ${_currentLocation.longitude}',
        ),
      ));
    });
    mapController
        .animateCamera(CameraUpdate.newLatLngZoom(_currentLocation, 15));

    _timer =
        Timer.periodic(Duration(seconds: 10), (Timer t) => _updateLocation());
  }

  void _updateLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      LatLng newLocation = LatLng(position.latitude, position.longitude);
      _markers.add(Marker(
        markerId: MarkerId('current_location'),
        position: newLocation,
        infoWindow: InfoWindow(
          title: 'My current location',
          snippet:
              'Lat: ${newLocation.latitude}, Lng: ${newLocation.longitude}',
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
