

import 'package:doctor_appointment_booking/constants/const_color.dart';
import 'package:doctor_appointment_booking/constants/constants.dart';
import 'package:doctor_appointment_booking/start_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreen createState() => _SplashScreen();
}


class _SplashScreen extends State<SplashScreen> {


  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {

     Get.to(SartScreen());

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Center(
          child:
          SizedBox(
            height: 200.0,
            width: 200.0,
            child: Image.asset(constImage.logoImage,fit: BoxFit.cover,),
          ),
        ),


    );

  }

}
