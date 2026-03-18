import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:taskatiapp/core/constants/app_constants.dart';
import 'package:taskatiapp/core/widgets/custom_text_form_field.dart';
import 'package:taskatiapp/features/auth/models/user_model.dart';
import 'package:taskatiapp/features/home/home_screen.dart';
import '../../core/widgets/custom_app_button.dart';
import 'package:image_picker/image_picker.dart';
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? _pickedImage;
  final _formKey = GlobalKey<FormState>();
  var nameController=TextEditingController();
void openCamera()async{
  final XFile? image = await picker.pickImage(source: ImageSource.camera);
  if(image!=null){
    setState(() {
      _pickedImage=image;
    });
  }
}
void openGallery()async{
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if(image!=null){
    setState(() {
      _pickedImage=image;
    });
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: .center,
            children: [
              SizedBox(height: 90,),
              CircleAvatar(
                radius: 120,
                backgroundColor: Colors.grey,
                backgroundImage: _pickedImage != null
                    ? FileImage(File(_pickedImage!.path))
                    : null,
              ),
              SizedBox(height: 15,),
             CustomAppButton(text: 'Upload from camera',onTap: openCamera,),
              SizedBox(height: 15,),
             CustomAppButton(text: 'Upload from Gallery',onTap: openGallery,),
              SizedBox(height: 15,),
             CustomTextFormField(hintText: 'Enter your name',controller: nameController ,validator: (v) {
               if(v==null || v.isEmpty){
                 return "Name is required";
               }else if(v.length<=3){
                 return "Name must have more than 3 letters";}},maxLines: 1,),
              SizedBox(height: 35,),
              CustomAppButton(text: "Done",onTap: ()async{
                if(_pickedImage==null){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content:Text( "Please upload image")));
                  return ;}if(_formKey.currentState!.validate()){
                  try{
                    await Hive.box<UserModel>(AppConstants.boxName).add(UserModel(image: _pickedImage?.path??" ", name: nameController.text));
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>HomeScreen()));}catch(e) {print(e);}}},)],
          ),
        ),
      ),
    );
  }
}