import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:to_do/themes.dart';

import 'HomeScreen.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    var Height=MediaQuery.of(context).size.height;
    var Width=MediaQuery.of(context).size.width;

    return AnimatedSplashScreen(

splashIconSize: Width/2,

        duration: 200,
        splash: Image(image: AssetImage("assets/icons/prioritize.png",),height:Height ,width:Width,),
        nextScreen: Home_Page(),
        splashTransition: SplashTransition.fadeTransition,

        backgroundColor: MyThemeData.primaryBlue);
  }
}