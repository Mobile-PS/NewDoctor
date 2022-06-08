import 'package:doctor_appointment_booking/constants/const_color.dart';
import 'package:doctor_appointment_booking/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class CongratulationScreen extends StatefulWidget {
  @override
  State<CongratulationScreen> createState() => _CongratulationScreenState();
}


class _CongratulationScreenState extends State<CongratulationScreen> {


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Container(
                color: Colors.white,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Center(child:Text(
                      'Congratulations',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: primaryColor),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                        image: DecorationImage(
                          image: AssetImage(constImage.congratulationImage),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
        Center(child:Text(
            constString.congtext,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500))),
                    SizedBox(
                      height: 10,
                    ),


                  ],
                ))),
      );

  }
}
