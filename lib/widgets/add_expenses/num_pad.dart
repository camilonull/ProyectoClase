import 'package:flutter/material.dart';
import 'num_pad_table.dart';

class NumPad extends StatelessWidget {
  const NumPad({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370.0,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        var constraintsHeight = constraints.biggest.height / 5;
        return Column(
          children: [
            NumPadTable(constraintsHeight: constraintsHeight),
          ],
        );
      }),
    );
  }
}
