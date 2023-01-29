import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:umdb_app/screens/signin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                heightFactor: MediaQuery.of(context).size.height,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: 320,
                      height: 320,
                      // color: Colors.red,
                      child: Lottie.asset('assets/lottie3.json',),
                    ),
                    Container(
                      //color: Colors.red,
                      width: 200,
                      height: 200,
                      // color: Colors.orange,
                      child: Center(
                          child: BorderedText(
                            strokeWidth: 1,
                            strokeColor: Colors.white70,
                            child: const Text(
                              'TMDb',
                              style: TextStyle(
                                fontSize: 50,
                                fontFamily: 'Horizon',
                                color: Colors.transparent,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      nextScreen: const SignInScreen(),
      duration: 4000,
      splashIconSize: 250,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}


