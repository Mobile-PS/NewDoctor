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

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreen createState() => _ChangePasswordScreen();
}

class _ChangePasswordScreen extends State<ChangePasswordScreen> {

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
                        height: size.height / 1.5,
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
                                    Text('Set New Password ',
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
                                              'Otp',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(height: 2),
                                            TextFormField(
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return constString.errorField;
                                                }
                                                return null;
                                              },
                                              keyboardType: TextInputType.number,
                                              controller:
                                              siginInController
                                                  .otptxtController,
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets
                                                      .all(16),
                                                  border: customBorder,
                                                  fillColor: white,
                                                  filled: true,
                                                  hintText: 'Otp',
                                                  errorBorder: customerrorBorder,
                                                  focusedBorder: customfocusBorder,
                                                  enabledBorder: customBorder),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              constString.pass,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(height: 2),
                                            TextFormField(

                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              obscureText: siginInController
                                                  .togggle,
                                              controller:
                                              siginInController
                                                  .confforgetpasstxtController,
                                              validator: (value) {
                                                if (value!.trim().isEmpty) {
                                                  return 'Please enter password';
                                                }
                                               return null;
                                              },
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets
                                                      .all(16),
                                                  border: customBorder,
                                                  fillColor: white,
                                                  filled: true,
                                                  hintText: constString
                                                      .yourPass,
                                                  suffixIcon: IconButton(
                                                      icon: Icon(
                                                          siginInController
                                                              .togggle
                                                              ? Icons.visibility
                                                              : Icons
                                                              .visibility_off,
                                                          //change icon based on boolean value
                                                          color: Colors.black),
                                                      onPressed: () {
                                                        siginInController
                                                            .tooglePassword();
                                                      }),
                                                  errorBorder: customerrorBorder,
                                                  focusedBorder: customfocusBorder,
                                                  enabledBorder: customBorder),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              constString.confirmPass,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            TextFormField(
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              obscureText: siginInController
                                                  .togggle,
                                              validator: (value) {
                                                if (value!.trim().isEmpty) {
                                                  return 'Please enter confirm password';
                                                } else {
                                                  if (value !=
                                                      siginInController
                                                          .confforgetpasstxtController
                                                          .text) {
                                                    return "Confirm Password dosen't match with above password";
                                                  }
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets
                                                      .all(16),
                                                  border: customBorder,
                                                  fillColor: white,
                                                  filled: true,
                                                  hintText: constString
                                                      .yourPass,
                                                  suffixIcon: IconButton(
                                                      icon: Icon(
                                                          siginInController
                                                              .togggle
                                                              ? Icons.visibility
                                                              : Icons
                                                              .visibility_off,
                                                          //change icon based on boolean value
                                                          color: Colors.black),
                                                      onPressed: () {
                                                        siginInController
                                                            .tooglePassword();
                                                      }),
                                                  errorBorder: customerrorBorder,
                                                  focusedBorder: customfocusBorder,
                                                  enabledBorder: customBorder),
                                            ),


                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                siginInController.loading ==
                                                    true
                                                    ? const ProgressBarWidget()
                                                    : Expanded(
                                                  child: ButtonWidget(
                                                    text: 'Submit',
                                                    bColor: primaryColor,
                                                    tColor: Colors.white,
                                                    press: () {
                                                      if (_formkey.currentState!
                                                          .validate()) {
                                                          siginInController.verifyForgetEmail();
                                                        }
                                                      // Get.toNamed('/signup_screen');
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                          ],
                                        )),

                                    /*TabBar(
                            indicatorColor: primaryColor,
                            labelColor: Colors.black,
                            tabs: [
                              Tab(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Email',
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              )),
                              Tab(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Mobile No.',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              )),
                            ],
                            controller: _tabController,
                            indicatorSize: TabBarIndicatorSize.tab,
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                EmailScreen(),
                                MobileScreen(),
                              ],
                              controller: _tabController,
                            ),
                          ),*/
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
