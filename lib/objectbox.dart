import 'package:flutter_todo/task_db.dart';
import 'package:path_provider/path_provider.dart';
import 'objectbox.g.dart'; // Import the generated ObjectBox file

class ObjectBox {
  late final Store store;
  late final Box<TaskDB> taskBox;

  ObjectBox._create(this.store) {
    taskBox = Box<TaskDB>(store);
  }

  static Future<ObjectBox> create() async {
    final dir = await getApplicationDocumentsDirectory();

    final store = Store(
      getObjectBoxModel(),
      directory: '${dir.path}/objectbox',
    );
    return ObjectBox._create(store);
  }
}
