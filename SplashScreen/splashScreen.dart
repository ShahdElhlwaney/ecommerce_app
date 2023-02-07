import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../GeneralComponents/imageComponent.dart';
class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;
  goNext()=>Navigator.pushNamed(context,'StartScreen');
  startDelay()
  {
    timer=Timer(const Duration(
      milliseconds: 4000
    ),()=>goNext());
  }
  @override
  void initState()
  {
    super.initState();
    startDelay();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff53B175),
      body: Stack(
            children: [
              ImageComponent(left: 74,top: 345,imageText:'lib/SplashScreen/assets/carrot1.png' ,),
              ImageComponent(left: 105, top: 329, imageText: 'lib/SplashScreen/assets/carrot2.png'),
              ImageComponent(left: 148, top: 339, imageText: 'lib/SplashScreen/assets/n.png'),
              ImageComponent(left: 186, top: 339, imageText: 'lib/SplashScreen/assets/e.png'),
              ImageComponent(left: 226, top: 339, imageText: 'lib/SplashScreen/assets/c.png'),
              ImageComponent(left: 266, top: 330, imageText: 'lib/SplashScreen/assets/t.png'),
              ImageComponent(left: 290, top: 339, imageText: 'lib/SplashScreen/assets/a.png'),
              ImageComponent(left: 330, top: 339, imageText: 'lib/SplashScreen/assets/r.png'),
              Padding(
                padding: const EdgeInsets.only(left: 148,top: 379),
                child: Text('o n l i n e       g r o c e r i e t',style: TextStyle(color: Colors.white,fontSize: 15),),
              )
            ],
          )
    );
  }
}
