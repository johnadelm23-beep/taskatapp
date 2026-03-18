import 'package:flutter/material.dart';
import 'package:taskatiapp/features/home/model/task_model.dart';
class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task});
final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color:Color(task.color)),
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(task.title,style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Mon'
                ),),
                Text("${task.startTime} | ${task.endTime}",style: TextStyle(
                    fontFamily: 'Mon',
                    fontSize: 20
                ),),
                Text(task.subTitle,style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Mon'
                ),),

              ],
            ),
          ),
          Container(
            width: 3,
            height: 100,
            color: Colors.white,
          ),
          RotatedBox(quarterTurns: 1,child: Text(task.statusText,style: TextStyle(
              fontFamily: 'Mon',
              fontSize: 20
          ),),)
        ],
      ),
    );
  }
}
