import 'package:flutter/material.dart';
import 'package:flutterwithspring/model/task.dart';
import 'package:flutterwithspring/model/tasks_data.dart';
import 'package:flutterwithspring/pages/add_task_page.dart';
import 'package:flutterwithspring/service/database_services.dart';
import 'package:flutterwithspring/task_tile.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task>? tasks;

  getTask() async{
    tasks=await DatabaseServices.getTasks();
    Provider.of<Taskdata>(context, listen: false)
    .tasks=tasks!;
    setState(() { });
  }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text(
          'Todo Tasks (${Provider.of<Taskdata>(context).tasks.length})',
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Consumer<Taskdata>(
          builder: (context, taskData, child){
            return ListView.builder(
              itemCount: taskData.tasks.length,
                itemBuilder: (context, index){
                  Task task=taskData.tasks[index];
                  return TaskTile(task: task, taskdata: taskData);
                }
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: (){
          showModalBottomSheet(
              context: context,
              builder: (context){
                return const AddTask();
              }
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
