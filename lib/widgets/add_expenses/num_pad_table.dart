import 'package:calc_app/widgets/add_expenses/num_pad_button.dart';
import 'package:flutter/material.dart';

class NumPadTable extends StatelessWidget {

  final double constraintsHeight;

  const NumPadTable({super.key, required this.constraintsHeight});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: const TableBorder.symmetric(
        inside: BorderSide(width: 0.1),
      ),
      children: [
        TableRow(children: [
          NumPadButton(label: '1', height: constraintsHeight),
          NumPadButton(label: '2', height: constraintsHeight),
          NumPadButton(label: '3', height: constraintsHeight),
        ]),
        TableRow(children: [
          NumPadButton(label: '4', height: constraintsHeight),
          NumPadButton(label: '5', height: constraintsHeight),
          NumPadButton(label: '6', height: constraintsHeight),
        ]),
        TableRow(children: [
          NumPadButton(label: '7', height: constraintsHeight),
          NumPadButton(label: '8', height: constraintsHeight),
          NumPadButton(label: '9', height: constraintsHeight),
        ]),
        TableRow(children: [
          NumPadButton(label: '.', height: constraintsHeight),
          NumPadButton(label: '0', height: constraintsHeight),
          NumPadButton(label: '?', height: constraintsHeight),
        ])
      ],
    );
  }
}