import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final Function(DateTime) onSelectionChanged;

  const DatePicker({super.key, required this.onSelectionChanged});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 20,
      children: <Widget>[
        Text(
          selectedDate != null
              ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
              : 'No date selected',
        ),
        OutlinedButton(
          onPressed: () async {
            selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2025),
              lastDate: DateTime(2050),
            );

            setState(() {
              widget.onSelectionChanged(selectedDate!);
            });
          },
          child: const Text('Select Date'),
        ),
      ],
    );
  }
}
