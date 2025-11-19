import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  const LocationService();

  Future<Position> getCurrentPosition() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      throw Exception('Location permission denied.');
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permission permanently denied.');
    }

    return Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );
  }

  Future<String> getLocationLabelFrom(Position position) async {
    final placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    if (placemarks.isEmpty) {
      return 'Unknown location';
    }

    final place = placemarks.first;
    final parts = <String>[
      if ((place.locality ?? '').isNotEmpty) place.locality!,
      if ((place.administrativeArea ?? '').isNotEmpty) place.administrativeArea!,
      if ((place.country ?? '').isNotEmpty) place.country!,
    ];

    if (parts.isEmpty) {
      return 'Unknown location';
    }
    return parts.join(', ');
  }

  Future<String> getCurrentLocationLabel() async {
    final position = await getCurrentPosition();
    return getLocationLabelFrom(position);
  }
}
