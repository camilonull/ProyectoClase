import 'package:flutter/material.dart';

class NumPadButton extends StatelessWidget {
  final String label;
  final double height;


  const NumPadButton({super.key, required this.label, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Text(label, style: const TextStyle(fontSize: 35.0),),
      ),
    );
  }
}