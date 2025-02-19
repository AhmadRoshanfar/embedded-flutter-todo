import 'package:flutter/material.dart';
import 'package:flutter_todo/components/build_task_card.dart';
import 'package:flutter_todo/provider/task_provider.dart';
import 'package:flutter_todo/task_db.dart';
import 'package:provider/provider.dart';

class TagsScreen extends StatelessWidget {
  final String inputTag;
  const TagsScreen({super.key, required this.inputTag});

  @override
  Widget build(BuildContext context) {
    List<TaskDB> allTasks = context.watch<TaskProvider>().loadTasks();
    List<TaskDB> tasks = [];

    List<String> tags;
    for (var task in allTasks) {
      tags = task.tags;
      for (String tag in tags) {
        if (tag == inputTag) {
          tasks.add(task);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(inputTag)),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return BuildTaskCard(task: tasks[index]);
        },
      ),
    );
  }
}
