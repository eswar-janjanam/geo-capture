import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:geo_capture/features/camera/camera_service.dart';
import 'package:geo_capture/features/camera/widgets/capture_button.dart';
import 'package:geo_capture/features/location/models/geo_location.dart';
import 'package:geo_capture/features/location/services/location_service.dart';
import 'package:geo_capture/features/location/widgets/gps_panel.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final CameraService _cameraService = CameraService();
  final LocationService _locationService = LocationService();

  StreamSubscription<GeoLocation>? _locationSubscription;

  GeoLocation? _location;

  bool _isCameraReady = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _listenToLocation();
  }

  Future<void> _initializeCamera() async {
    try {
      await _cameraService.initialize();

      if (!mounted) return;

      setState(() {
        _isCameraReady = true;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _error = e.toString();
      });
    }
  }

  void _listenToLocation() {
    _locationSubscription =
        _locationService.getLocationStream().listen((location) {
          if (!mounted) return;

          setState(() {
            _location = location;
          });
        });
  }

  @override
  void dispose() {
    _locationSubscription?.cancel();
    _cameraService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              _error!,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    if (!_isCameraReady) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CameraPreview(_cameraService.controller!),
          ),

          // GPS Panel
          Positioned(
            left: 0,
            right: 0,
            bottom: 110,
            child: GpsPanel(
              location: _location,
            ),
          ),

          // Capture Button
          const Positioned(
            left: 0,
            right: 0,
            bottom: 24,
            child: Center(
              child: CaptureButton(),
            ),
          ),
        ],
      ),
    );
  }
}