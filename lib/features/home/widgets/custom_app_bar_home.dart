import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:taskatiapp/core/constants/app_constants.dart';
import 'package:taskatiapp/features/auth/models/user_model.dart';
class CustomAppBarHome extends StatelessWidget {
   CustomAppBarHome({super.key,required this.userData,required this.onPressed});
var userData=Hive.box<UserModel>(AppConstants.boxName).getAt(0);
final  void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return   Row(
      spacing: 10,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment:.start

            ,  children: [
            Text("${userData?.name}😎",style: TextStyle(
              fontSize: 20,
              fontFamily: 'Mon',
            ),),
            SizedBox(height: 5,),
            Text("Have a nice day",style: TextStyle(
              fontFamily: 'Mon',
              fontSize: 20,
            ),),
          ],
          ),
        ) ,
        CircleAvatar(
          radius: 30,
          backgroundImage: Image.file(File(userData?.image??"")).image,
        ),
        IconButton(onPressed:onPressed , icon: Icon(Icons.logout,size: 30,))
      ],
    ) ;
  }
}
