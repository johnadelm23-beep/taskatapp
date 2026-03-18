import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:taskatiapp/core/constants/app_constants.dart';
import 'package:taskatiapp/features/auth/auth_screen.dart';
import 'package:taskatiapp/features/auth/models/user_model.dart';
import 'package:taskatiapp/features/home/home_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var userData=Hive.box<UserModel>(AppConstants.boxName);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      if(userData.isEmpty){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>AuthScreen()));

      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>HomeScreen()));

      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Lottie.asset('assets/splash/Task Done (1).json')
            ,SizedBox(height: 10,),
            Text("It's time to be organized",style: TextStyle(fontSize: 25
            ,fontFamily: "Mon",
              color: Colors.grey
            ),)
          ],
        ),
      ),
    );
  }
}
