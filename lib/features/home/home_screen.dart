import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:taskatiapp/features/add/add_task_screen.dart';
import 'package:taskatiapp/features/auth/auth_screen.dart';
import 'package:taskatiapp/features/home/model/task_model.dart';
import 'package:taskatiapp/features/home/widgets/add_task_row.dart';
import 'package:taskatiapp/features/home/widgets/custom_app_bar_home.dart';
import 'package:taskatiapp/features/home/widgets/custom_list_view.dart';
import 'package:taskatiapp/features/home/widgets/filtter_button.dart';
import 'package:taskatiapp/features/home/widgets/task_item.dart';

import '../../core/constants/app_constants.dart';
import '../auth/models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userData=Hive.box<UserModel>(AppConstants.boxName).getAt(0);
  var box =Hive.box<UserModel>(AppConstants.boxName);
  int activeIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: .start,
            children: [
          CustomAppBarHome(userData: userData, onPressed: ()async{
         await box.clear();
               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>AuthScreen()), (Route)=>false);

          }),
        Divider(color: Colors.grey),
         SizedBox(height: 10,),
        AddTaskRow(onTap: ()async{
         await Navigator.push(context, MaterialPageRoute(builder: (c)=>AddTaskScreen()));setState(() {

          });
        },),
              SizedBox(height: 10,),
                Row(
                  spacing: 20,
                  children: [
                   FiltterButton(text: "All",isActive: activeIndex==0,onTap: (){
                     setState(() {
                       tasks=Hive.box<TaskModel>(AppConstants.taskBox).values.toList();
                       activeIndex=0;
                     });
                   },),
                    FiltterButton(text: "Complete",isActive: activeIndex==1,onTap: (){
                    setState(() {
                      tasks=Hive.box<TaskModel>(AppConstants.taskBox).values.toList().where((v)=>v.statusText.toLowerCase()=="complete").toList();
                      activeIndex=1;

                    });
                    },),
                    FiltterButton(text: "ToDo",isActive: activeIndex==2,onTap: (){
                     setState(() {
                       tasks=Hive.box<TaskModel>(AppConstants.taskBox).values.toList().where((v)=>v.statusText.toLowerCase()=="todo").toList();
                       activeIndex=2;
                     });
                    },),

                  ],
                ),

                SizedBox(height: 10,),
                CustomListView(),
            ],
          ),
        ),
      ),
    );
  }
}
