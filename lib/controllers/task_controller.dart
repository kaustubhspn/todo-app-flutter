import 'package:get/get.dart';
import 'package:to_do_app_v2/db/db_helper.dart';
import 'package:to_do_app_v2/models/task.dart';

import '../services/notification_services.dart';

class TaskController extends GetxController {
  // Use RxList to make the list reactive and observable
  RxList<Task> taskList = <Task>[].obs;

  // Create an instance of DBHelper to access the database
  DBHelper dbHelper = DBHelper();

  // Fetch all tasks from the database
  Future<void> getTasks() async {
    final tasks = await dbHelper.query();

    // Convert the retrieved data to a list of Task objects and assign to the observable list
    taskList.assignAll(tasks.map((e) => Task.fromMap(e)).toList());

    // Notify listeners that the list has been updated
    update();
  }

  // Add a new task to the database
  void addTask({required Task? task}) async {
    await dbHelper.insert(task);

    // After adding the task, fetch all tasks again to update the list
    getTasks();
  }

  // Delete a task from the database
  void deleteTask({required Task task}) async {
    await dbHelper.delete(task.id!);

    // After deleting the task, fetch all tasks again to update the list
    getTasks();
  }

  // Mark a task as completed in the database
  void markTaskAsCompleted({required Task task}) async {
    await dbHelper.update(task.id!);

    // After updating the task, fetch all tasks again to update the list
    getTasks();
  }

  // Delete all tasks from the database
  void deleteAllTask() async {
    // Cancel all pending notifications before deleting all tasks
    await NotifyHelper.cancelAllNotification();
    await dbHelper.deleteAll();

    // Clear the observable list and notify listeners that it has been updated
    taskList.clear();
    update();
  }
}
