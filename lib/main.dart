import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/MainScreens/login/loginScreen.dart';
import 'package:shopping_list/MainScreens/login/welcomeScreen.dart';
import 'package:shopping_list/Utils/AssetsImages.dart';
import 'package:shopping_list/Utils/ConstantsApp.dart';
import 'package:shopping_list/Utils/TextApp.dart';
import 'package:shopping_list/Widgets/Design/DesignWidgets.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:developer' as developer;

import 'MainScreens/homeScreen.dart';
import 'Utils/LoginGoogleUtils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff2c2b50),
        primaryColorDark: Color(0xff050028),
        primaryColorLight: Color(0xff57547c),
        accentColor: Color(0xffedecee),
        textTheme:
            TextTheme(bodyText1: TextStyle(fontSize: 14, color: Colors.white)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //init
  final Future<FirebaseApp> _initializationFirebase = Firebase.initializeApp();
  static const String TAG = "Main";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          future: _initializationFirebase,
          builder: (context, snapshot) {
            //check for errorrs.
            if (snapshot.hasError) {
              //add logs.
              developer.log(TAG + ", Firebase init. ERROR");

              return SnackBar(content: Text("Error inicializando Firebase"));
              //kill app.
              // exit(0);
            } else if (snapshot.connectionState == ConnectionState.done) {
              developer.log(TAG + ", Firebase init. DONE");
              LoginGoogleUtils().googleSignIn.isSignedIn().then((value) {
                //a pulir!!!
                if (value != null) {
                  if (value) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  } else {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  }
                } else {
                  developer.log("loginScreen-build()ERROR user viene nulo");
                }
              });
              //done
              return SplashScreen(
                seconds: ConstantsAPP.TIME_SPLASH_SCREEN,
                navigateAfterSeconds: WelcomeScreen(),
                image: AssetsImages.ImageLogo(),
                photoSize: 120,
                loaderColor: Theme.of(context).accentColor,
                loadingText: Text(
                  TextApp.LOADING,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                gradientBackground: DesignWidgets.linearGradientMain(context),
              );
            }

            return CircularProgressIndicator();
          }),
    );
  }
}
