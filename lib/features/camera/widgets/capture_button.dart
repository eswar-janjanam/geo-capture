import 'package:flutter/material.dart';

class CaptureButton extends StatelessWidget {
  const CaptureButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 5,
        ),
      ),
    );
  }
}