import 'package:calc_app/models/combined_model.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final CombinedModel cModel;
  const DatePicker({super.key, required this.cModel});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    var widgets = <Widget>[];
    widgets.insert(0, const Icon(Icons.date_range_outlined, size: 35.0,));
    widgets.insert(1, const SizedBox(width: 4));
    

  Map<String, DateTime> items = {
    'Hoy': date,
    'Ayer': date.subtract(const Duration(hours: 24)),
    'Otro dia': date
  };
  items.forEach((name, date) {
    widgets.add(Expanded(child: GestureDetector(
      onTap: () {},
      child: DateContainWidget(cModel: widget.cModel, name: name, isSelected: true),
    )));
  });
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: widgets,
      ),
    );
  }
}

class DateContainWidget extends StatelessWidget {
  final CombinedModel cModel;
  final String name;
  final bool isSelected;

  const DateContainWidget({super.key, required this.cModel,required this.name, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 100,
            height: 55,
          decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(25.0)
          ),
          child: Center(
            child: Text(name),
          ),
        ),),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text('${cModel.year}/${cModel.month}/${cModel.day}'),
        )
      ],
    );
  }
}