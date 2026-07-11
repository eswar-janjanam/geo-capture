import 'package:flutter/material.dart';
import 'package:geo_capture/app/theme/app_theme.dart';
import 'package:geo_capture/features/camera/camera_screen.dart';

class GeoCaptureApp extends StatelessWidget {
  const GeoCaptureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GeoCapture',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const CameraScreen(),
    );
  }
}