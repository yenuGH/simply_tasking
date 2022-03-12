import 'package:get/get.dart';
import 'package:simply_tasking/database/database_helper.dart';
import 'package:simply_tasking/model/task_data.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  Future<int> addTask(TaskData? task) async {
    return await DatabaseHelper.insert(task);
  }
}
