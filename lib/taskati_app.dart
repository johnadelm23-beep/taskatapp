import 'package:flutter/material.dart';

import 'features/splash/splash_screen.dart';
class TaskatiApp extends StatelessWidget {
  const TaskatiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Mon',
      ),
    home:SplashScreen(),
    );
  }
}
