import 'package:doctor_appointment_booking/constants/button_widget.dart';
import 'package:doctor_appointment_booking/constants/const_color.dart';
import 'package:doctor_appointment_booking/constants/constants.dart';
import 'package:doctor_appointment_booking/constants/progress_widget.dart';
import 'package:doctor_appointment_booking/controller/signin_page_controller.dart';
import 'package:doctor_appointment_booking/controller/signup_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignupForm extends StatefulWidget {
  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final siginInController = Get.put(SignUpPageController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpPageController>(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
                color: Colors.white,
                margin: EdgeInsets.only(left: 20, right: 20),
                height: MediaQuery.of(context).size.height - 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                        key: _formkey,
                        autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 2),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return constString.errorField;
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
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
                              'Mobile No.',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 2),
                            IntlPhoneField(
                              decoration: InputDecoration(
                                  labelText: 'Phone Number',
                                  border: customBorder,
                                  errorBorder: customerrorBorder,
                                  focusedBorder: customfocusBorder,
                                  enabledBorder: customBorder
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                              ],
                              controller: siginInController.phonetxtController,
                              initialCountryCode: 'IN',
                              onChanged: (phone) {
                                print(phone.completeNumber);
                              },
                              validator: (phone) {
                                if (phone!.number.isEmpty) {
                                  return constString.errorField;
                                }
                                else{
                                  if(phone.number.length != 10){
                                    return 'please enter 10 digit mobile number';
                                  }
                                }
                                return null;
                              },
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
                              height: 15,
                            ),
                            Text(
                              constString.confirmPass,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            TextFormField(
                              obscureText: siginInController.togggle,
                              controller:
                              siginInController.passwordtxtController,
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return 'Please enter confirm password';
                                }
                                else{
                                  if(value != siginInController.phonetxtController.text){
                                    return "Confirm Password dosen't match with above password";

                                  }
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
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  constString.forgetpass,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
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
                                                  .signUpVerification('manual');
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
                ))),
      );
    });
  }
}
