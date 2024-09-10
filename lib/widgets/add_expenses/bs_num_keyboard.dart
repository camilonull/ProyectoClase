import 'package:flutter/material.dart';
import 'amount_display.dart';
import 'num_pad.dart';


class BsNumKeyboard extends StatefulWidget {
  const BsNumKeyboard({super.key});

  @override
  State<BsNumKeyboard> createState() => _BsNumKeyboardState();
}

class _BsNumKeyboardState extends State<BsNumKeyboard> {
  String amount = "0.00";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showNumPad();
      },
      child: Padding(
        padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          const Text('Cantidad Ingresada'),
         AmountDisplay(amount:  amount),
        ],
      ),
    ));
  }

  void _showNumPad() {
    showModalBottomSheet(
      barrierColor: Colors.transparent,
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
      ),
      context: context, builder: (BuildContext context) {
      return const NumPad();
    });
  }

  void numPad() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 350.0,
            child: Text(
              'Seleccionar del teclado Numerico',
              style: TextStyle(fontSize: 24.0, color: Colors.grey[600]),
            ),
          );
        });
  }
}
