import 'package:flutter/material.dart';

class NumPadButton extends StatelessWidget {
  final String? label;
  final double height;
  final VoidCallback onPressed;
  final Widget? icon;

  const NumPadButton({
    super.key,
    required this.label,
    required this.height,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: SizedBox(
        height: height,
        child: Center(
          child: icon ??
              Text(
                label ?? '',
                style: const TextStyle(fontSize: 35.0),
              ),
        ),
      ),
    );
  }
}
