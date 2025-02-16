import 'package:flutter/material.dart';
import 'package:flutter_todo/constants.dart';
import 'package:flutter_todo/model/task_model.dart';

class BuildTaskCard extends StatefulWidget {
  final TaskModel task;
  const BuildTaskCard({super.key, required this.task});

  @override
  State<BuildTaskCard> createState() => _BuildTaskCardState();
}

class _BuildTaskCardState extends State<BuildTaskCard> {
  Color priorityColor(TaskPriority priority) {
    if (priority == TaskPriority.low) {
      return Colors.green;
    } else if (priority == TaskPriority.medium) {
      return Colors.orange;
    } else if (priority == TaskPriority.high) {
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
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.task.title,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20),
                            color: priorityColors[widget.task.priority.index],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Text(
                    '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),

              Text(
                widget.task.description,
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              tags[index],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
