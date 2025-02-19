import 'package:flutter_todo/task_db.dart';
import 'objectbox.dart';

class TaskService {
  final ObjectBox objectBox;

  TaskService(this.objectBox);

  // Add Task
  void addTask(TaskDB task) {
    objectBox.taskBox.put(task);
  }

  // Get All Tasks
  List<TaskDB> getTasks() {
    return objectBox.taskBox.getAll();
  }

  // Update Task
  void updateTask(TaskDB task) {
    objectBox.taskBox.put(task);
  }

  // Delete Task
  void deleteTask(int id) {
    objectBox.taskBox.remove(id);
  }
}
