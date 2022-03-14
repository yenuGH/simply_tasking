import 'package:get/get.dart';
import 'package:simply_tasking/database/database_helper.dart';
import 'package:simply_tasking/model/task_data.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  var taskList = <TaskData>[].obs;

  // Inserting task data
  Future<int> addTask(TaskData? task) async {
    return await DatabaseHelper.insert(task);
  }

  // Retrieving task data
  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DatabaseHelper.query();
    taskList.assignAll(tasks.map((data) => TaskData.fromJson(data)).toList());
  }
}
