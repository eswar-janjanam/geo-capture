import 'package:geolocator/geolocator.dart';

import '../models/geo_location.dart';

class LocationService {
  Stream<GeoLocation> getLocationStream() {
    const settings = LocationSettings(
      accuracy: LocationAccuracy.best,
      distanceFilter: 1,
    );

    return Geolocator.getPositionStream(
      locationSettings: settings,
    ).map(
          (position) => GeoLocation(
        latitude: position.latitude,
        longitude: position.longitude,
        accuracy: position.accuracy,
        altitude: position.altitude,
        speed: position.speed,
        heading: position.heading,
        timestamp: position.timestamp ?? DateTime.now(),
      ),
    );
  }
}