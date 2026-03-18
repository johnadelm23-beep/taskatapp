import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:taskatiapp/core/constants/app_constants.dart';
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
       background: Container(
         width: double.infinity,
         alignment: Alignment.centerLeft,
         child: Text("Complete",style: TextStyle(fontFamily: 'Mon',
         color: Colors.white,
           fontSize: 20
         ),),
       ),
          secondaryBackground: Container(
            width: double.infinity,
            alignment: Alignment.centerRight,
            child: Text("Delete",style: TextStyle(fontSize: 20,
            fontFamily: 'Mon',
            color: Colors.white),),
          ),
          onDismissed: (v){
          if(v==DismissDirection.startToEnd){
            // code complete
          }else{
            // code delete
          }
          },
          child: TaskItem(task: tasks[index]));
    }, separatorBuilder: (context,index)=>SizedBox(height: 10,), itemCount: tasks.length));
  }
}
