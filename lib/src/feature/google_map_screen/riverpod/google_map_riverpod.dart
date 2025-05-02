import 'package:car_wash/core/services/location_services/location_services.dart';
import 'package:car_wash/src/feature/google_map_screen/riverpod/google_map_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final gMapRiverpod = StateNotifierProvider<GoogleMapRiverpod, GoogleMapState>((ref)=>GoogleMapRiverpod(),);

class GoogleMapRiverpod extends StateNotifier<GoogleMapState>{
  GoogleMapRiverpod() : super(GoogleMapState());

   static const String markerId = "user-location";

  Future<void> moveToUserLocation(GoogleMapController mapController) async {
    try{
      final userLocation = await LocationService.instance.getCurrentLocation();

      if(userLocation != null){
        final userAddress = await LocationService.instance.getAddress(latitude: userLocation.latitude, longitude: userLocation.longitude);

        /// zoom and move to user location on google map
        final cameraUpdate = CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(userLocation.latitude, userLocation.longitude),
          zoom: 16,),
        );
        mapController.animateCamera(cameraUpdate);
        state = state.copyWith(
            selectedMarker: Marker(
              markerId: const MarkerId(markerId),
              position: LatLng(userLocation.latitude, userLocation.longitude),
            ),
          latitude: userLocation.latitude,
          longitude: userLocation.longitude,
          userAddress: userAddress,
        );
      }
      else{
        debugPrint("\nFailed to detect user location.\n");
      }
    }catch(error){
      debugPrint("\nFailed to move to user location.\n");
    }

  }

  Future<void> onSelectPointFromMap(LatLng tappedPoint) async{
    final userAddress = await LocationService.instance.getAddress(latitude: tappedPoint.latitude, longitude: tappedPoint.longitude);
    state = state.copyWith(
      selectedMarker: Marker(
        markerId: const MarkerId(markerId),
        position: tappedPoint,
      ),
      latitude: tappedPoint.latitude,
      longitude: tappedPoint.longitude,
      userAddress: userAddress,
    );
  }

}