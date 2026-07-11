import 'package:flutter/material.dart';

class GeoCaptureApp extends StatelessWidget {
  const GeoCaptureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GeoCapture',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GeoCapture'),
        ),
        body: const Center(
          child: Text('Welcome to GeoCapture'),
        ),
      ),
    );
  }
}