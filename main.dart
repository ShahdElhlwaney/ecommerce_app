import 'package:ecommerce_app/BottomNavigationBarScreens/allScreens.dart';
import 'package:ecommerce_app/SignupScreen/signupScreen.dart';
import 'package:ecommerce_app/SplashScreen/SplashScreen.dart';
import 'package:flutter/material.dart';

import 'HomeScreen/homeScreen.dart';
import 'LoginScreen/loginScreen.dart';
import 'WelcomeScreen/welcomeScreen.dart';

void main() {

  runApp(MaterialApp(
    routes: {
      'StartScreen':(context)=>WelcomeScreen(),
      'LoginScreen':(context)=>LoginScreen(),
      'SignupScreen':(context)=>SignupScreen(),
      'HomeScreen':(context)=>HomeScreen(),
      'AllScreens':(context)=>AllScreens()
    },
    home: SplashScreen(),
  ));
}