import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskatiapp/features/auth/auth_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>AuthScreen()));
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
