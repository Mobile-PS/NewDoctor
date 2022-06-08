

import 'package:doctor_appointment_booking/login_screen.dart';
import 'package:doctor_appointment_booking/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




String initialRoute = '/';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme(),
      themeMode: ThemeMode.light,
      initialRoute: initialRoute,
       home: SplashScreen(),
      /*routingCallback: (value) {
        if(value!.route?.settings.name =='/'){
          SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
              statusBarColor: primaryBlue,
              statusBarIconBrightness: Brightness.dark));
        }
        else if(value.route?.settings.name =='/onbording_screen'){
          SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark));

        }
       else if(value.route?.settings.name == '/launch_screen'){
          SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
              statusBarColor: primaryBlue,
              statusBarIconBrightness: Brightness.dark));
        }
       else{

          SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark));
        }


      },*/

      //home: SplashScreen(),
    );
  }
}


ThemeData lightTheme() {
  var baseTheme = ThemeData.light();
 // baseTheme.textTheme.apply(fontFamily: 'Inter');
  baseTheme.copyWith(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: baseTheme.colorScheme.copyWith(
        primary: Colors.white,
        secondary: Colors.white,
        onSecondary: Colors.white,
      ));

  return baseTheme;
}
