import 'package:flutter_todo/constants.dart';

class TaskModel {
  final String title;
  final String description;
  final TaskPriority priority;
  final DateTime dueDate;
  final TaskStatus status;
  final List<String> tags;

  TaskModel({
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.dueDate,
    required this.tags,
  });
}
