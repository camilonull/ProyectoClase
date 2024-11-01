import 'package:calc_app/models/combined_model.dart';
import 'package:calc_app/providers/db_features.dart';
import 'package:calc_app/utils/constants.dart';
import 'package:calc_app/widgets/add_expenses/bs_category.dart';
import 'package:calc_app/widgets/add_expenses/bs_num_keyboard.dart';
import 'package:calc_app/widgets/add_expenses/comment_box.dart';
import 'package:calc_app/widgets/add_expenses/date_picker.dart';
import 'package:calc_app/widgets/add_expenses/save_button.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class AddExpenses extends StatelessWidget {
  const AddExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    CombinedModel cModel = CombinedModel();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Agregar Gasto'),
          elevation: 0.0,
        ),
        body: Column(
          children: [
            BsNumKeyboard(cModel: cModel),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: Constants.sheetDecoration(
                    Theme.of(context).primaryColorDark),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DatePicker(cModel: cModel),
                    BsCategory(cModel: cModel),
                    CommentBox(cModel: cModel),
                    Expanded(
                        child: Center(
                            child: SaveButton(cModel: cModel))),
                     /*ElevatedButton(
                    onPressed: () async {
                      // Llamada al método clearFeatures() para eliminar todas las características
                      await DBFEatures.db.clearFeatures();
                      log("Features cleared");
                    },
                    child: const Text('Limpiar Features'),
                  ),     */       
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
