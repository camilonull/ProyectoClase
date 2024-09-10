import 'package:calc_app/widgets/add_expenses/num_pad_button.dart';
import 'package:flutter/material.dart';

class NumPadTable extends StatelessWidget {

  final double constraintsHeight;
  final void Function(String) onInput;
  final VoidCallback onDelete;
  final VoidCallback onDecimal;

  const NumPadTable({
    super.key,
     required this.constraintsHeight,
     required this.onInput,
     required this.onDelete,
     required this.onDecimal,
     });

  @override
  Widget build(BuildContext context) {
    return Table(
      border: const TableBorder.symmetric(
        inside: BorderSide(width: 0.1),
      ),
      children: [
        _buildRow()
      ],
    );
  }
}