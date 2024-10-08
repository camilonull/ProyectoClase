import 'package:calc_app/models/features_model.dart';
import 'package:flutter/material.dart';

class CreateCategory extends StatefulWidget {
  final FeaturesModel fModel;
  const CreateCategory({super.key, required this.fModel});

  @override
  State<CreateCategory> createState() => _CreateCategoryState();
}

class _CreateCategoryState extends State<CreateCategory> {
  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;
    return SingleChildScrollView(child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: viewInsets),
          child: ListTile(
            trailing: const Icon(Icons.text_fields_outlined,
            size: 35.0,),
            title: TextFormField(
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              initialValue: widget.fModel.category,
              decoration: InputDecoration(
                hintText: 'Nombra una categoria',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0)
                )
              ),
            ),
          ),
        )
      ],
    ),);
  }
}
