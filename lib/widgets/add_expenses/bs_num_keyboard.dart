import 'package:flutter/material.dart';

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
        numPad();
      },
      child: Padding(padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          const Text('Cantidad Ingresada'),
          Text('\$ $amount',
              style: const TextStyle(
                fontSize: 30.0,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
              ))
        ],
      ),
    ));
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
