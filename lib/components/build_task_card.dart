import 'package:flutter/material.dart';
import 'package:flutter_todo/model/task_model.dart';

class BuildTaskCard extends StatefulWidget {
  final TaskModel task;
  const BuildTaskCard({super.key, required this.task});

  @override
  State<BuildTaskCard> createState() => _BuildTaskCardState();
}

class _BuildTaskCardState extends State<BuildTaskCard> {
  @override
  Widget build(BuildContext context) {
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
                    child: Text(
                      widget.task.title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(widget.task.priority.toString()),
                  Text(widget.task.status.toString()),
                ],
              ),
              Text(
                widget.task.description,
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
              Text(widget.task.tags[0]),
            ],
          ),
        ),
      ),
    );
  }
}
