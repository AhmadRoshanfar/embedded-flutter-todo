import 'package:flutter/material.dart';
import 'package:flutter_todo/components/build_dialog_modal.dart';
import 'package:flutter_todo/components/build_header.dart';
import 'package:flutter_todo/components/build_switch_theme.dart';
import 'package:flutter_todo/components/build_tab_bar.dart';
import 'package:flutter_todo/components/build_task_card.dart';
import 'package:flutter_todo/provider/task_provider.dart';
import 'package:flutter_todo/task_db.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<TaskDB> tasks = [];
    tasks = context.watch<TaskProvider>().loadTasks();
    return Scaffold(
      body: Column(
        children: [
          BuildHeader(),
          // BuildSwitchTheme(),
          // BuildTabBar(),
          (tasks.isNotEmpty)
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 400,
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return BuildTaskCard(task: tasks[index]);
                      },
                    ),
                  ),
                ),
              )
              : Container(),
        ],
      ),
    );
  }
}
