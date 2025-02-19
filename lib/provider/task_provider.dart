import 'package:flutter/material.dart';
import 'package:flutter_todo/model/task_model.dart';
import 'package:flutter_todo/objectbox.dart';
import 'package:flutter_todo/task_db.dart';
import 'package:flutter_todo/task_service.dart';

class TaskProvider with ChangeNotifier {
  final List<TaskModel> _tasks = [];
  late final ObjectBox objectBox;
  late final TaskService _taskService;

  TaskProvider(this.objectBox) {
    _taskService = TaskService(objectBox);
  }

  List<TaskModel> get tasks => _tasks;

  void setTask({required TaskModel task}) {
    _tasks.add(task);
    notifyListeners();
  }

  void initDB() async {
    notifyListeners();
  }

  void addTask({required TaskModel task}) {
    final newTask = TaskDB(
      title: task.title,
      description: task.description,
      priority: task.priority.index,
      dueDate: task.dueDate,
      status: task.status.index,
      tags: task.tags,
    );
    _taskService.addTask(newTask);
    loadTasks();
    notifyListeners();
  }

  List<TaskDB> loadTasks() {
    return _taskService.getTasks();
  }

  void deleteTask(int id) {
    _taskService.deleteTask(id);
    loadTasks();
    notifyListeners();
  }
}
