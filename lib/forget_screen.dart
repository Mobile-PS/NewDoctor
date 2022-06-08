import 'package:doctor_appointment_booking/auth/authentication.dart';
import 'package:doctor_appointment_booking/congratulation.dart';
import 'package:doctor_appointment_booking/constants/button_widget.dart';
import 'package:doctor_appointment_booking/constants/common.dart';
import 'package:doctor_appointment_booking/constants/const_color.dart';
import 'package:doctor_appointment_booking/constants/constants.dart';
import 'package:doctor_appointment_booking/constants/progress_widget.dart';
import 'package:doctor_appointment_booking/controller/signup_page_controller.dart';
import 'package:doctor_appointment_booking/form1.dart';
import 'package:doctor_appointment_booking/form2.dart';
import 'package:doctor_appointment_booking/login_screen.dart';
import 'package:doctor_appointment_booking/privacy_policy.dart';
import 'package:doctor_appointment_booking/signup_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:local_auth/local_auth.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({Key? key}) : super(key: key);

  @override
  _ForgetScreen createState() => _ForgetScreen();
}

class _ForgetScreen extends State<ForgetScreen> {

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final siginInController = Get.put(SignUpPageController());



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GetBuilder<SignUpPageController>(builder: (_)
    {
      return Scaffold(
        body:
        Stack(children: <Widget>[
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            color: Colors.white,
          ),
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height / 2.5,
            width: MediaQuery
                .of(context)
                .size
                .width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  primaryColor,
                  primaryColor1,
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: EdgeInsets.only(left: 20, top: 40),
                child: Row(children: [
                  Icon(Icons.arrow_back_ios, color: Colors.white, size: 15),
                  GestureDetector(onTap: () {
                    Get.back();
                  },child:
                  Text('Back',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)))
                ])),
          ),
          Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // VideoConatiner(),
                      Container(
                        height: size.height / 3,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 10.0,
                              spreadRadius: 0.0,
                              offset: Offset(2.0, 5.0),
                            ),
                          ],
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 10.0,
                          margin: EdgeInsets.all(12.0),
                          child: Container(
                            padding: EdgeInsets.all(20.0),
                            child: Scrollbar(
                              child:
                            SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Text('Enter Register Email',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: primaryColor)),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Form(
                                        key: _formkey,
                                        autovalidateMode: AutovalidateMode
                                            .disabled,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [

                                            Text(
                                              'Email Id',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(height: 2),
                                            TextFormField(
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              validator: (value) {
                                                if (!emailRegex.hasMatch(
                                                    value!)) {
                                                  return 'Please enter valid email';
                                                }
                                                return null;
                                              },
                                              keyboardType: TextInputType
                                                  .emailAddress,
                                              controller:
                                              siginInController
                                                  .emailotptxtController,
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets
                                                      .all(16),
                                                  border: customBorder,
                                                  fillColor: white,
                                                  filled: true,
                                                  hintText: 'Email Id',
                                                  suffixIcon:  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      GestureDetector(onTap: () {
                                                        if(siginInController
                                                            .emailotptxtController.text.isNotEmpty) {
                                                          siginInController.sendForgetEmail();
                                                        }

                                                      },child:
                                                      Container(
                                                          color: primaryColor,
                                                          margin: EdgeInsets.only(right: 10.0),
                                                          child:
                                                          Padding(padding: EdgeInsets.all(5.0),
                                                              child:
                                                              Text('Get OTP',style: TextStyle(fontSize: 10.0,color: Colors.white),))))],),
                                                  errorBorder: customerrorBorder,
                                                  focusedBorder: customfocusBorder,
                                                  enabledBorder: customBorder),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),

                                          ],
                                        )),

                                  ],
                                ))),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ))),
        ]),
      );
    });
  }
}
