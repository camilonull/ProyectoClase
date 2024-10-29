import 'package:calc_app/models/combined_model.dart';
import 'package:calc_app/providers/expenses_provider.dart';
import 'package:calc_app/utils/math_operations.dart';
import 'package:calc_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:provider/provider.dart';

class FlayerCategories extends StatelessWidget {
  const FlayerCategories({super.key});

 @override
Widget build(BuildContext context) {
  final exProvider = context.watch<ExpensesProvider>();
  final gList = exProvider.groupItemsList;

  List<CombinedModel> limitList = [];
  bool hasLimit = false;

  // Verificar si la lista tiene más de 6 elementos
  if (gList.length > 6) {
    limitList = gList.sublist(0, 5); // Limitar la lista a los primeros 5 elementos
    hasLimit = true;
  }

  // Agregar el ítem "Otros.." si la lista tiene 5 elementos
  if (limitList.length == 5) {
    limitList.add(
      CombinedModel(
        category: 'Otros..',
        icon: 'otros',
        color: '#20634b',
      ),
    );
  }

  return Row(
    children: [
      Expanded(
        flex: 2,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: (hasLimit) ? limitList.length : gList.length,
          itemBuilder: (context, i) {
            // Si hay límite, usar el ítem de limitList, de lo contrario usar gList
            var item = hasLimit ? limitList[i] : gList[i];
            
            return ListTile(
              dense: true,
              visualDensity: const VisualDensity(vertical: -4),
              horizontalTitleGap: 0,
              leading: Icon(
                item.icon.toIcon(), // Convertir el string del icono a un Icon
                color: item.color.toColor(), // Convertir el string del color a un Color
                size: 15.0,
              ),
              title: Text(
                item.category,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(getAmountFormat(item.amount)), // Formatear el monto
            );
          },
        ),
      ),
      const Expanded(child: CircleColor(color: Colors.green, circleSize: 150.0))
    ],
  );
}

}
