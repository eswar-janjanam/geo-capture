import 'package:flutter/material.dart';

class GpsOverlay extends StatelessWidget {
  const GpsOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black54,
      padding: const EdgeInsets.all(16),
      child: const Text(
        'Waiting for GPS...',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}