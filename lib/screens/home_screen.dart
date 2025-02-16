import 'package:flutter/material.dart';
import 'package:flutter_todo/components/build_dialog_modal.dart';
import 'package:flutter_todo/components/build_header.dart';
import 'package:flutter_todo/components/build_switch_theme.dart';
import 'package:flutter_todo/components/build_tab_bar.dart';
import 'package:flutter_todo/components/build_task_card.dart';
import 'package:flutter_todo/model/task_model.dart';
import 'package:flutter_todo/provider/task_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<TaskModel> _tasks = [];
    _tasks = context.watch<TaskProvider>().tasks;
    return Scaffold(
      body: Column(
        children: [
          BuildHeader(),
          BuildSwitchTheme(),
          BuildTabBar(),
          IconButton(
            onPressed: () {
              // context.read<CaloriesProvider>().resetValues();
              setState(() {
                showDialog(
                  useSafeArea: true,
                  context: context,
                  builder: (context) {
                    return const Align(
                      alignment: Alignment.topCenter,
                      child: BuildDialogModal(),
                    );
                  },
                );
              });
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const SelectCaloriesScreen()));
            },
            icon: Icon(Icons.add),
          ),
          (_tasks.isNotEmpty)
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 300,
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _tasks.length,
                      itemBuilder: (context, index) {
                        return BuildTaskCard(task: _tasks[index]);
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
