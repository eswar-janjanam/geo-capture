class GeoLocation {
  final double latitude;
  final double longitude;
  final double accuracy;
  final double? altitude;
  final double? heading;
  final double? speed;
  final DateTime timestamp;

  const GeoLocation({
    required this.latitude,
    required this.longitude,
    required this.accuracy,
    required this.timestamp,
    this.altitude,
    this.heading,
    this.speed,
  });
}