import 'package:calc_app/models/combined_model.dart';
import 'package:calc_app/utils/constants.dart';
import 'package:calc_app/widgets/add_expenses/bs_num_keyboard.dart';
import 'package:calc_app/widgets/add_expenses/comment_box.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class AddExpenses extends StatelessWidget {
  const AddExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    CombinedModel cModel = CombinedModel();
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => {FocusScope.of(context).unfocus()},
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Agregar Gasto'),
            elevation: 0.0,
          ),
          body: Column(
            children: [
              BsNumKeyboard(cModel: cModel,),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: Constants.sheetDecoration(
                      Theme.of(context).primaryColorDark),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Fecha: 05/09/2024'),
                      const Text('Seleccionar Categoría'),
                      CommentBox(cModel: cModel),
                      Expanded(
                          child: Center(
                              child: GestureDetector(
                                  onTap: () {
                                    log(cModel.comment);
                                  },
                                  child: const Text('Boton done')))),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
