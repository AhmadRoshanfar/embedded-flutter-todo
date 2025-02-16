import 'package:flutter/material.dart';
import 'package:flutter_todo/constants.dart';
import 'package:flutter_todo/model/task_model.dart';

class TaskProvider with ChangeNotifier {
  final List<TaskModel> _tasks = [];
  late TaskPriority _priority;

  List<TaskModel> get tasks => _tasks;

  void setTask({required TaskModel task}) {
    _tasks.add(task);
    notifyListeners();
  }
}
