import 'package:flutter/material.dart';
import 'package:flutter_todo/components/build_tags.dart';
import 'package:flutter_todo/constants.dart';
import 'package:flutter_todo/provider/task_provider.dart';
import 'package:flutter_todo/screens/tags_screen.dart';
import 'package:flutter_todo/task_db.dart';
import 'package:provider/provider.dart';

class BuildTaskCard extends StatefulWidget {
  final TaskDB task;
  const BuildTaskCard({super.key, required this.task});

  @override
  State<BuildTaskCard> createState() => _BuildTaskCardState();
}

class _BuildTaskCardState extends State<BuildTaskCard> {
  bool checkBoxValue = false;
  Color priorityColor(int priority) {
    if (priority == TaskPriority.low.index) {
      return Colors.green;
    } else if (priority == TaskPriority.medium.index) {
      return Colors.orange;
    } else if (priority == TaskPriority.high.index) {
      return Colors.red;
    }
    return Colors.yellow;
  }

  List<Color> priorityColors = [Colors.green, Colors.orange, Colors.red];

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = widget.task.dueDate;
    List<String> tags = widget.task.tags;
    return Card(
      color:
          checkBoxValue
              ? const Color.fromARGB(255, 41, 39, 39)
              : const Color.fromARGB(255, 17, 77, 117),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6,
            children: [
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    Checkbox(
                      value: checkBoxValue,
                      onChanged: (value) {
                        setState(() {
                          checkBoxValue = value!;
                        });
                      },
                    ),
                    Column(
                      children: [
                        Text(
                          widget.task.title,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            decoration:
                                checkBoxValue
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20),
                            color: priorityColors[widget.task.priority],
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: BuildTags(tags: tags)),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        context.read<TaskProvider>().deleteTask(widget.task.id);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.task.description,
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        decoration:
                            checkBoxValue
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                      ),
                    ),
                    Text(
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration:
                            checkBoxValue
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
