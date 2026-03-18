import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:taskatiapp/core/constants/app_constants.dart';
import 'package:taskatiapp/core/widgets/custom_app_button.dart';
import 'package:taskatiapp/core/widgets/custom_text_form_field.dart';
import 'package:taskatiapp/features/home/model/task_model.dart';
class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var addTaskController=TextEditingController();
  var descriptionController=TextEditingController();
  var dateController=TextEditingController();
  var startTimeController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var endTimeController=TextEditingController();
  TimeOfDay? startTime;
  TimeOfDay? endTime;
List<Color>colors=[
  Colors.red,
  Colors.indigo,
  Colors.green,
  Colors.amber,
  Colors.blue,
  Colors.pink
];
int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task",style: TextStyle(
          fontSize: 20,
          fontFamily: 'Mon'
        ),),centerTitle: true,
      ),
          body: SingleChildScrollView(
           padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: Form(

              key: _formKey,
              child: Column(
                spacing: 20,
                   children: [
                     CustomTextFormField(hintText: "add task", validator: (v){
                       if(v==null || v.isEmpty){
                         return "This Field is required";
                       }else if(v.length<4){
                         return "task must be 4 letter or more";
                       }
                     }, controller: addTaskController,

                     ),
                  CustomTextFormField(hintText: "Description", validator: (v){
                    if(v==null || v.isEmpty){
                      return "This field is required";
                  }
                  }, controller: descriptionController,
                  maxLines: 3,
                  ),
              CustomTextFormField(hintText: "Enter date", validator:(v){
                if(v==null || v.isEmpty){
                  return "This field is required";
                }
              }, controller: dateController,
              readOnly: true,
                onTap: ()async{
                DateTime? d=await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2030));
                if(d!=null){
                  String formatDate=DateFormat.MMMEd().format(d);
                  dateController.text=formatDate;
                }

                },
              suffixIcon: Icon(Icons.date_range),
              ),
                     Row(
                       children: [
                     Expanded(child: CustomTextFormField(hintText: "Start time", validator: (v){
                       if(v==null || v.isEmpty){
                         return "This field is required";
                       }
                     }, controller: startTimeController,readOnly: true,
                     suffixIcon: Icon(Icons.alarm),
                       onTap: (){
                       showTimePicker(context: context, initialTime:TimeOfDay.now(),

                       ).then((t){
                         print("start time sucess");
                         startTime=t;
                         startTimeController.text=startTime!.format(context).toString();
                       });
                       },
                     ),

                     )      ,
                     SizedBox(width: 10,) ,
                     Expanded(child: CustomTextFormField(
                       suffixIcon: Icon(Icons.alarm),
                       hintText: "End time", validator: (v){
                       if(v==null || v.isEmpty){
                         return "end time is required";
                       }else if(endTime!.isBefore(startTime!)){
                         return "end time must be after start time";
                       }
                     }, controller: endTimeController,
                     readOnly: true,
                       onTap: (){
                       showTimePicker(context: context, initialTime: TimeOfDay.now()).then((t){
                         endTime=t;
                         endTimeController.text=endTime!.format(context).toString();
                       });
                       },
                     ))
                       ],
                     ),
                    SizedBox(
                      height: 50,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index){
                            return InkWell(
                              onTap: (){
                                setState(() {
                                  currentIndex=index;
                                });
                              },
                              child: Container(
                                width:50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colors[index],
                                ),
                                child:currentIndex==index?Icon(Icons.check,color: Colors.white,):null
                              ),
                            );
                          }, separatorBuilder: (context,index)=>SizedBox(width: 10,), itemCount: colors.length),
                    )
              ,
              SizedBox(height: 10,),
                     SizedBox(
                       height: 70,
                       child: CustomAppButton(text: "Create task",onTap: (){
                         if(_formKey.currentState!.validate()){
                           final task = TaskModel(
                             color: colors[currentIndex].toARGB32(),
                             title: addTaskController.text,
                             endTime: endTimeController.text,
                             startTime: startTimeController.text,
                             subTitle: descriptionController.text,
                             statusText: 'ToDo',
                           );

                           Hive.box<TaskModel>(AppConstants.taskBox).add(task);
                           tasks.add(task);
                           Navigator.pop(context);
                         }
                       },),

                     )
                   ],
              ),
            ),
          ),
    );
  }
}
