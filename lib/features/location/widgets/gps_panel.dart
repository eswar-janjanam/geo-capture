import 'package:flutter/material.dart';

import '../models/geo_location.dart';

class GpsPanel extends StatelessWidget {
  final GeoLocation? location;

  const GpsPanel({
    super.key,
    this.location,
  });

  @override
  Widget build(BuildContext context) {
    if (location == null) {
      return Container(
        width: double.infinity,
        color: Colors.black54,
        padding: const EdgeInsets.all(16),
        child: const Text(
          'Acquiring GPS...',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return Container(
      width: double.infinity,
      color: Colors.black54,
      padding: const EdgeInsets.all(16),
      child: Text(
        '''
Latitude : ${location!.latitude.toStringAsFixed(6)}
Longitude: ${location!.longitude.toStringAsFixed(6)}
Accuracy : ±${location!.accuracy.toStringAsFixed(1)} m
''',
        style: const TextStyle(
          color: Colors.white,
          height: 1.5,
        ),
      ),
    );
  }
}