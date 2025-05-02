import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  /// Singleton instance
  static final LocationService instance = LocationService._internal();

  /// Private constructor for Singletor instance
  LocationService._internal();

  /// This method will detect latitude and longtitude using geolocator package,
  /// And finally return the address
  Future<String> getCurrentLocation() async {
    String currentLocation = "";
    try {
      /// checking location service is enabled or not
      /// if not enabled then return
      bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isServiceEnabled) {
        debugPrint(
          "\nLocation service is not enabled. Opening location settings.\n",
        );
        await Geolocator.openLocationSettings();
        return "Location service is not enabled";
      }

      /// checking location permission and ask necessary permission
      LocationPermission locationPermission =
          await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.denied ||
          locationPermission == LocationPermission.deniedForever) {
        debugPrint(
          "\nLocation permission is denied. Asking for location permission.\n",
        );

        /// if denied then ask permission
        locationPermission = await Geolocator.requestPermission();

        /// if permission denied then return
        if (locationPermission == LocationPermission.denied ||
            locationPermission == LocationPermission.deniedForever) {
          debugPrint("\nSorry! Location permission is denied.\n");
          return "Location permission denied.";
        }
      }

      /// Detecting gps location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      debugPrint(
        "\nLatitude : ${position.latitude}\nLongitude : ${position.longitude}\n",
      );

      /// Detecting location place marks using latitude and longitude
      List<Placemark> placeMarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      /// if successfully location detected then return it
      if (placeMarks.isNotEmpty) {
        Placemark place = placeMarks.first;
        currentLocation =
            "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}";
        debugPrint("\nCurrent location : $currentLocation\n");
        return currentLocation;
      }
      /// can not found any location using the latitude and longitude
      else {
        return "No address found";
      }
    } catch (error, stackTrace) {
      debugPrint(
        "\n==================\nError getting location: $error\n$stackTrace\n"
        "======================\n",
      );
    }

    return "";
  }

  /// This method will convert latitude and longtitude to human readable address
}
