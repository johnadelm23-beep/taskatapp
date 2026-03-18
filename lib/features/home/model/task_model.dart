import 'dart:ui';

import 'package:hive/hive.dart';
part 'task_model.g.dart';
@HiveType(typeId: 1)
class TaskModel {
  @HiveField(0)
  String title;
  @HiveField(1)
  String startTime;
  @HiveField(2)
  String endTime;
  @HiveField(3)
  String subTitle;
  @HiveField(4)
  String statusText;
  @HiveField(5)
  int color;
  TaskModel({required this.color,required this.title,required this.endTime,required this.startTime,required
   this.subTitle,required this.statusText});
}
List<TaskModel>tasks=[];