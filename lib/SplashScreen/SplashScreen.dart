
import 'dart:async';

import 'package:connection/Presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Presentation/authView/sign_In_Screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String? user_id;
  void checkLogin()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    user_id = pref.getString('user_id');
    print("this is is user is${user_id}");
  }

  @override
  void initState() {
    // TODO: implement initState
    // Timer(Duration(seconds: 3), () {
    //   // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInScreen()));}
    // );
    super.initState();
    Future.delayed(Duration(milliseconds: 300),(){
      return checkLogin();
    });
    Future.delayed(Duration(seconds: 2),(){
      print("Conditions   ${user_id == null || user_id == ""}");
      if(user_id == null || user_id == ""){
        print("this is is user is${user_id}");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image:DecorationImage(
                    image:AssetImage('assets/images/SplashImage.png'),
                    fit: BoxFit.fill
                )
            )
        ),
      ),
    );
  }
}
