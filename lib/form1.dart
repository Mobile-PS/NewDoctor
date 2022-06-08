import 'package:doctor_appointment_booking/constants/button_widget.dart';
import 'package:doctor_appointment_booking/constants/const_color.dart';
import 'package:doctor_appointment_booking/constants/constants.dart';
import 'package:doctor_appointment_booking/constants/progress_widget.dart';
import 'package:doctor_appointment_booking/controller/signin_page_controller.dart';
import 'package:doctor_appointment_booking/forget_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class EmailScreen extends StatefulWidget {
  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final siginInController = Get.put(SigninPageController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SigninPageController>(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
                color: Colors.white,
                margin: EdgeInsets.only(left: 20, right: 20),
                height: MediaQuery.of(context).size.height - 100,
                child: SingleChildScrollView(
                 child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                        key: _formkey,
                        autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email Id',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 2),
                            TextFormField(
                              validator: (value) {
                                if (!emailRegex.hasMatch(value!)) {
                                  return 'Please enter valid email';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              controller:
                                  siginInController.usernametxtController,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(16),
                                  border: customBorder,
                                  fillColor: white,
                                  filled: true,
                                  hintText: 'Email Id',
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
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 2),

                            TextFormField(
                              obscureText: siginInController.togggle,
                              controller:
                                  siginInController.passwordtxtController,
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(16),
                                  border: customBorder,
                                  fillColor: white,
                                  filled: true,
                                  hintText: constString.yourPass,
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                          siginInController.togggle
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          //change icon based on boolean value
                                          color: Colors.black),
                                      onPressed: () {
                                        siginInController.tooglePassword();
                                      }),
                                  errorBorder: customerrorBorder,
                                  focusedBorder: customfocusBorder,
                                  enabledBorder: customBorder),
                            ),

                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Transform.scale(
                                  scale: 0.8,
                                child:
                                    SizedBox(width: 24,height: 24,
                                child:
                                Checkbox(
                                  side: const BorderSide(
                                    color: onboardingButtoncolor,
                                    width: 1,
                                  ),
                                  checkColor: Colors.white,
                                  value: siginInController.checkBox,
                                  activeColor: onboardingButtoncolor,
                                  onChanged: (value) {
                                    siginInController.toogleCheckbox();
                                  },
                                ))),
                                Text(
                                  'Keep me logged in',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                Spacer(),
                                GestureDetector(onTap: () {
                                  Get.to(ForgetScreen());
                                },child:
                                Text(
                                  constString.forgetpass,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                siginInController.loading == true
                                    ? const ProgressBarWidget()
                                    : Expanded(
                                        child: ButtonWidget(
                                          text: 'Continue',
                                          bColor: primaryColor,
                                          tColor: Colors.white,
                                          press: () {
                                            if (_formkey.currentState!
                                                .validate()) {
                                              siginInController
                                                  .signinVerification('Email',"manual");
                                            }
                                            // Get.toNamed('/signup_screen');
                                          },
                                        ),
                                      ),
                              ],
                            ),
                            SizedBox(height: 10),
                          ],
                        )),
                  ],
                )))),
      );
    });
  }
}
