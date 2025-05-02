import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  final Location _location = Location();
  Marker? _selectedMarker;



  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _moveToUserLocation();
  }

  Future<void> _moveToUserLocation() async {
    final hasPermission = await _location.hasPermission();
    if (hasPermission == PermissionStatus.denied) {
      await _location.requestPermission();
    }

    final serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      await _location.requestService();
    }

    final userLocation = await _location.getLocation();
    final cameraUpdate = CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(userLocation.latitude!, userLocation.longitude!),
        zoom: 16.0,
      ),

    );
    setState(() {
      _selectedMarker = Marker(
        markerId: const MarkerId('selected-location'),
        position: LatLng(userLocation.latitude!, userLocation.longitude!),
      );
    });


    _mapController?.animateCamera(cameraUpdate);
  }

  void _onTap(LatLng tappedPoint) {
    setState(() {
      _selectedMarker = Marker(
        markerId: const MarkerId('selected-location'),
        position: tappedPoint,
      );
    });
  }

  void _confirmLocation() {
    if (_selectedMarker != null) {
      final location = _selectedMarker!.position;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Selected location: (${location.latitude}, ${location.longitude})'),
        ),
      );
      // TODO: Pass this location to the previous screen or save it
    }
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Location Map'),
        backgroundColor: Colors.blue,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(0, 0),
          zoom: 1,
        ),
        markers: _selectedMarker != null ? {_selectedMarker!} : {},
        onTap: _onTap,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _confirmLocation,
        label: const Text('Confirm Location'),
        icon: const Icon(Icons.check),
      ),
    );
  }
}