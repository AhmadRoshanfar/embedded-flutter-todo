import 'package:flutter/material.dart';
import 'package:flutter_todo/components/build_header.dart';
import 'package:flutter_todo/components/build_snackbar.dart';
import 'package:flutter_todo/components/build_switch_theme.dart';
import 'package:flutter_todo/components/build_tab_bar.dart';
import 'package:flutter_todo/components/build_task_card.dart';
import 'package:flutter_todo/constants.dart';
import 'package:flutter_todo/model/task_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskModel> tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BuildHeader(),
          BuildSwitchTheme(),
          BuildTabBar(),
          IconButton(
            onPressed: () {
              setState(() {
                tasks.add(
                  TaskModel(
                    title: "title",
                    description: "description",
                    status: TaskStatus.canceled,
                    priority: TaskPriority.low,
                    dueDate: DateTime.now(),
                    tags: ["tags"],
                  ),
                );
              });
              showInfoSnackbar(context, "message");
            },
            icon: Icon(Icons.add),
          ),
          (tasks.isNotEmpty)
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 500,
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return BuildTaskCard(task: tasks[index]);
                    },
                  ),
                ),
              )
              : Container(),
        ],
      ),
    );
  }
}
