import 'package:objectbox/objectbox.dart';

@Entity()
class TaskDB {
  @Id()
  int id = 0; // ObjectBox requires an ID field, default is 0 (auto-increment)

  String title;
  String description;

  @Property(type: PropertyType.date) // Store DateTime properly
  DateTime dueDate;

  int priority;
  int status;

  List<String> tags;

  TaskDB({
    required this.title,
    required this.description,
    required this.priority,
    required this.dueDate,
    required this.status,
    required this.tags,
  });
}
