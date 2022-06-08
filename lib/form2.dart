import 'package:doctor_appointment_booking/constants/button_widget.dart';
import 'package:doctor_appointment_booking/constants/const_color.dart';
import 'package:doctor_appointment_booking/constants/constants.dart';
import 'package:doctor_appointment_booking/constants/progress_widget.dart';
import 'package:doctor_appointment_booking/controller/signin_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class MobileScreen extends StatefulWidget {
  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final siginInController = Get.put(SigninPageController());


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SigninPageController>(builder: (_)
    {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
                color: Colors.white,
                margin: EdgeInsets.only(left: 20, right: 20),
                height: MediaQuery
                    .of(context)
                    .size
                    .height - 100,
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
                                  enabledBorder: customBorder,
                                suffixIcon: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        color: primaryColor,
                                        margin: EdgeInsets.only(right: 10.0),
                                        child:
                                        Padding(padding: EdgeInsets.all(5.0),
                                            child:
                                            Text('Get OTP',style: TextStyle(fontSize: 10.0,color: Colors.white),)))],),

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
                            /*TextFormField(
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return constString.errorField;
                                }
                                else{
                                  if(value.length != 10){
                                    return 'please enter 10 digit mobile number';
                                  }
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                               controller: siginInController.phonetxtController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                              ],
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(16),
                                  border: customBorder,
                                  fillColor: white,
                                  filled: true,
                                  hintText: 'Mobile no',
                                  prefixIcon: const Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: const Text(
                                        '🇱🇷 +1',
                                        style: const TextStyle(fontSize: 16),
                                      )),
                                  errorBorder: customerrorBorder,
                                  focusedBorder: customfocusBorder,
                                  enabledBorder: customBorder),
                            ),*/
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'OTP',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 2),
                            TextFormField(
                              // obscureText: siginInController.togggle,
                              // controller: siginInController.passwordtxtController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return 'Please enter otp';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(16),
                                  border: customBorder,
                                  fillColor: white,
                                  filled: true,
                                  hintText: 'Otp',
                                  errorBorder: customerrorBorder,
                                  focusedBorder: customfocusBorder,
                                  enabledBorder: customBorder),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                siginInController.loading == true
                                    ? const ProgressBarWidget()
                                    :
                                Expanded(
                                  child: ButtonWidget(
                                    text: 'Continue',
                                    bColor: primaryColor,
                                    tColor: Colors.white,
                                    press: () {
                                      if (_formkey.currentState!
                                          .validate()) {
                                        siginInController
                                            .signinVerification('Otp',"manual");
                                      }
                                      // Get.toNamed('/signup_screen');
                                    },
                                  ),),
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
