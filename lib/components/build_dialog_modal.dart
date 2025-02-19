import 'package:flutter/material.dart';
import 'package:flutter_todo/components/build_chips_selection.dart';
import 'package:flutter_todo/components/build_date_picker.dart';
import 'package:flutter_todo/components/build_input_field.dart';
import 'package:flutter_todo/components/build_snackbar.dart';
import 'package:flutter_todo/constants.dart';
import 'package:flutter_todo/model/task_model.dart';
import 'package:flutter_todo/provider/task_provider.dart';
import 'package:flutter_todo/styles/styles.dart';
import 'package:provider/provider.dart';

class BuildDialogModal extends StatefulWidget {
  const BuildDialogModal({super.key});

  @override
  State<BuildDialogModal> createState() => _BuildDialogModalState();
}

class _BuildDialogModalState extends State<BuildDialogModal> {
  final _formKey = GlobalKey<FormState>();
  String enteredTitle = "";
  String enteredDescription = "";
  TaskPriority enteredPriority = TaskPriority.medium;
  DateTime enteredDate = DateTime.now();
  List<String> enteredTags = [];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    var titleField = Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: BuildInputField(
          label: "Title:",
          onSaved: (value) {
            setState(() {
              enteredTitle = value!;
            });
          },
        ),
      ),
    );

    var descriptionField = Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: BuildInputField(
          label: "Description:",
          onSaved: (value) {
            setState(() {
              enteredDescription = value!;
            });
          },
        ),
      ),
    );

    var tagsField = Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: BuildInputField(
          label: "Tags:",
          onSaved: (value) {
            setState(() {
              enteredTags = value!.split(",");
            });
          },
        ),
      ),
    );

    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
      elevation: 4,
      scrollable: true,
      content: SizedBox(
        height: height - 100,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text("New Task", style: kTextHeaderStyle),
              ),
              titleField,
              descriptionField,
              tagsField,
              Expanded(
                child: BuildChipsSelection(
                  onSelectionChanged: (priority) {
                    setState(() {
                      enteredPriority = priority;
                    });
                  },
                ),
              ),
              Expanded(
                child: DatePicker(
                  onSelectionChanged: (newDate) {
                    enteredDate = newDate;
                  },
                ),
              ),
              Expanded(
                child: FilledButton.icon(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    setState(() {
                      TaskModel task = TaskModel(
                        title: enteredTitle,
                        description: enteredDescription,
                        status: TaskStatus.canceled,
                        priority: enteredPriority,
                        dueDate: enteredDate,
                        tags: enteredTags,
                      );
                      context.read<TaskProvider>().addTask(task: task);
                      showInfoSnackbar(context, "message");
                      Navigator.pop(context);
                    });
                  },
                  label: Text("Add"),
                  icon: Icon(Icons.check, size: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
