import 'package:flutter/material.dart';
import 'package:taskatiapp/core/constants/app_constants.dart';
import 'package:taskatiapp/features/auth/models/user_model.dart';
import 'package:taskatiapp/taskati_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async{
await Hive.initFlutter();
Hive.registerAdapter(UserModelAdapter());
await Hive.openBox<UserModel>(AppConstants.boxName);
  runApp(TaskatiApp());
}