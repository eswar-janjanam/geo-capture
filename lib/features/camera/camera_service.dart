import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

class CameraService {
  CameraController? controller;

  Future<void> initialize() async {
    final cameras = await availableCameras();

    debugPrint('Available cameras: ${cameras.length}');

    for (final camera in cameras) {
      debugPrint(camera.name);
    }

    final backCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.back,
    );

    controller = CameraController(
      backCamera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    await controller!.initialize();
  }

  void dispose() {
    controller?.dispose();
  }
}