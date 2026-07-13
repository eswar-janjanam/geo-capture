import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'camera_service.dart';
import 'widgets/capture_button.dart';
import 'widgets/gps_overlay.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final CameraService _cameraService = CameraService();

  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      await _cameraService.initialize();

      if (!mounted) return;

      setState(() {
        _isReady = true;
      });
    } catch (e, stackTrace) {
      debugPrint('Camera initialization failed: $e');
      debugPrintStack(stackTrace: stackTrace);
    }
  }

  @override
  void dispose() {
    _cameraService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady) {
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
          const Align(
            alignment: Alignment.bottomCenter,
            child: GpsOverlay(),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: CaptureButton(),
            ),
          ),
        ],
      ),
    );
  }
}