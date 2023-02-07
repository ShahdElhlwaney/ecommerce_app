import 'package:flutter/material.dart';
import '../GeneralComponents/ButtonComponent.dart';
import '../GeneralComponents/TextComponent.dart';
import '../GeneralComponents/imageComponent.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ImageComponent(imageText: 'lib/WelcomeScreen/assets/welcome.png',fit: BoxFit.cover,width: double.infinity,),
          ImageComponent(imageText: 'lib/SplashScreen/assets/carrot1.png', fit: null,top: 395,left: 180,width: null,),
          ImageComponent(imageText: 'lib/SplashScreen/assets/carrot2.png', fit: null,top: 380,left: 210,width: null,),
          TextComponent(text: '  Welcome\nto our store',top: 457,left: 115,fontSize: 40,color: Colors.white,),
          TextComponent(text: 'Ger your groceries in as fast as one hour',fontWeight: FontWeight.normal,top: 560,left: 85,color: Colors.grey,fontSize: 15,),
          TextButton(onPressed: ()=>Navigator.pushNamed(context, 'LoginScreen'),child: Button(text: 'Get Started',top: 600,)),
        ],
      ),
    );
  }
}
