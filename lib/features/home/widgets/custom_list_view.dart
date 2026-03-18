import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:taskatiapp/core/constants/app_constants.dart';
import 'package:taskatiapp/features/auth/models/user_model.dart';
import 'package:taskatiapp/features/home/widgets/task_item.dart';
import '../model/task_model.dart';
class CustomListView extends StatefulWidget {
  const CustomListView({super.key});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  void initState() {
    tasks=Hive.box<TaskModel>(AppConstants.taskBox).values.toList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty?Lottie.asset('assets/splash/empty box3.json'):  Expanded(child: ListView.separated(itemBuilder: (context,index){
      return Dismissible(key: UniqueKey(),
      background:Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        alignment: Alignment.centerLeft,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(12),color: Colors.green
       ),
        child: Text("Complete",style: TextStyle(fontSize: 20,fontWeight: .bold,color: Colors.white),),
      ),
          secondaryBackground: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),color: Colors.red
            ),
            child: Text("Delete",style: TextStyle(fontSize: 20,fontWeight: .bold,color: Colors.white),),
          ),

          onDismissed: (v){
          if(v==DismissDirection.startToEnd){
            // code complete
            var task=  Hive.box<TaskModel>(AppConstants.taskBox).getAt(index);
            task?.statusText="Complete";
            Hive.box<TaskModel>(AppConstants.taskBox).putAt(index, task!);
            setState(() {
              tasks=Hive.box<TaskModel>(AppConstants.taskBox).values.toList();
            });
          }else{
            // code delete
            Hive.box<TaskModel>(AppConstants.taskBox).deleteAt(index);
                 setState(() {
                   tasks=Hive.box<TaskModel>(AppConstants.taskBox).values.toList();
                 });
          }
          },
          child: TaskItem(task: tasks[index]));
    }, separatorBuilder: (context,index)=>SizedBox(height: 10,), itemCount: tasks.length));
  }
}
