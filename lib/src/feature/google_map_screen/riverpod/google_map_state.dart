import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapState{
  Marker? selectedMarker;
  double? latitude;
  double? longitude;
  String? userAddress;

  GoogleMapState({this.selectedMarker, this.latitude, this.longitude, this.userAddress});

  /// update state by copying new value
  GoogleMapState copyWith({Marker? selectedMarker, double? latitude, double? longitude, String? userAddress}){
    return GoogleMapState(
      selectedMarker: selectedMarker ?? this.selectedMarker,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      userAddress: userAddress ?? this.userAddress
    );
  }
}