import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce/BottomNavigation.dart';
import 'package:ecommerce/Login/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      centered: true,
      duration: 2000,
      splashIconSize: double.maxFinite,
      splash: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white24,
        child: Stack(
          children: [
            Lottie.asset("assets/Zee.json",

            height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: 150,
              left: 150,
              child: RichText(
              text: const TextSpan(
                  text: "E",style: TextStyle(
                  color: Colors.red,
                  fontSize: 48,
                  fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(text: "Valy",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 38,
                        ))
                  ]
              ),
            ),)
          ],
        ),
      ),
      nextScreen: StreamBuilder<User?>(
        stream:FirebaseAuth.instance.authStateChanges() ,
        builder: (context,AsyncSnapshot<User?> snapshot){
          if(snapshot.hasData && snapshot.data !=null){
            return const Bottom();
          }
          else if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          return Login();
        },
      ),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}


