import 'package:flutter/material.dart';
import 'package:flutter_todo/constants.dart';

class BuildChipsSelection extends StatefulWidget {
  final Function(TaskPriority) onSelectionChanged;

  const BuildChipsSelection({super.key, required this.onSelectionChanged});

  @override
  State<BuildChipsSelection> createState() => _BuildChipsSelectionState();
}

class _BuildChipsSelectionState extends State<BuildChipsSelection> {
  int _selectedIndex = 1;

  final List<String> _options = ["Low", "Medium", "High"];
  final List<Color> _colors = [Colors.green, Colors.orange, Colors.red];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      children: List.generate(_options.length, (index) {
        return ChoiceChip(
          label: Text(_options[index]),
          selected: _selectedIndex == index,
          onSelected: (bool selected) {
            setState(() {
              _selectedIndex = index;
              widget.onSelectionChanged(TaskPriority.values[index]);
            });
          },
          selectedColor: _colors[index],
          labelStyle: TextStyle(
            color: _selectedIndex == index ? Colors.white : Colors.white,
          ),
        );
      }),
    );
  }
}
