import 'package:flutter/cupertino.dart';
import 'package:flutterwithspring/model/task.dart';
import 'package:flutterwithspring/service/database_services.dart';


// its is like DAO
class Taskdata extends ChangeNotifier {
  List<Task> tasks = [];

  void addTask(String taskTitle) async {
    Task task = await DatabaseServices.addTask(taskTitle);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggle();
    DatabaseServices.updateTask(task.id);
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    DatabaseServices.deleteTask(task.id);
    notifyListeners();
  }

}
