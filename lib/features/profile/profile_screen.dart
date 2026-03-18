import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskatiapp/core/constants/app_constants.dart';
import 'package:taskatiapp/core/widgets/custom_app_button.dart';
import 'package:taskatiapp/core/widgets/custom_text_form_field.dart';
import 'package:taskatiapp/features/auth/models/user_model.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var userData=Hive.box<UserModel>(AppConstants.boxName).getAt(0);
  final ImagePicker picker = ImagePicker();
  XFile? _pickedImage;
 Future<void>editImageGallery()async{
   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
   if(image!=null){
     var box=Hive.box<UserModel>(AppConstants.boxName);
     userData!.image=image.path;
     box.putAt(0, userData!);
     setState(() {

     });

   }
 }
  Future<void>editImageCamera()async{
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if(image!=null){
      var box=Hive.box<UserModel>(AppConstants.boxName);
      userData!.image=image.path;
      box.putAt(0, userData!);
      setState(() {

      });

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(

          mainAxisAlignment: .center,
          children: [
            CircleAvatar(
              radius: 120,
              backgroundImage:Image.file(File(userData?.image??"")).image ,
            ),
            SizedBox(height: 30,),
            CustomAppButton(text: "Edit Your photo",onTap: (){
              showModalBottomSheet(context: context, builder: (context){
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: .min,
                    children: [
                      CustomAppButton(text: "Edit photo from Gallery",onTap:editImageGallery),
                      SizedBox(height: 10,),
                      CustomAppButton(text: "Edit photo from Camera",onTap: (){
                        setState(() {

                        });
                      },)
                    ],
                  ),
                );
              });
            },)
       ,
          SizedBox(height: 35,),

          ],
        ),
      ),
    );
  }
}
