import 'package:flutter_todo/constants.dart';

class Priority {
  late TaskPriority _priority;
  TaskPriority get priority => _priority;

  set setPriority(TaskPriority priority) {
    _priority = priority;
  }
}
