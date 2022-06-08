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

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreen createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen> {

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final siginInController = Get.put(SignUpPageController());

  final LocalAuthentication _localAuthentication = LocalAuthentication();



  // 3. variable for track whether your device support local authentication means
  //    have fingerprint or face recognization sensor or not
  bool _hasFingerPrintSupport = false;

  // 4. we will set state whether user authorized or not
  String _authorizedOrNot = "Not Authorized";

  // 5. list of avalable biometric authentication supports of your device will be saved in this array
  List<BiometricType> _availableBuimetricType = <BiometricType>[];

  Future<void> _getBiometricsSupport() async {
    // 6. this method checks whether your device has biometric support or not
    bool hasFingerPrintSupport = false;
    try {
      hasFingerPrintSupport = await _localAuthentication.canCheckBiometrics;
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _hasFingerPrintSupport = hasFingerPrintSupport;
    });
  }

  Future<void> _getAvailableSupport() async {
    // 7. this method fetches all the available biometric supports of the device
    List<BiometricType> availableBuimetricType = <BiometricType>[];
    try {
      availableBuimetricType =
          await _localAuthentication.getAvailableBiometrics();
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _availableBuimetricType = availableBuimetricType;
    });
  }

  Future<void> _authenticateMe() async {
    // 8. this method opens a dialog for fingerprint authentication.
    //    we do not need to create a dialog nut it popsup from device natively.
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticate(
          localizedReason: "Authenticate for Testing", // message for dialog
          options: const AuthenticationOptions(
              useErrorDialogs: false) // show error in dialog
          );
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      printLog(authenticated);

      _authorizedOrNot = authenticated ? "Authorized" : "Not Authorized";

      if (authenticated) {
        Get.to(CongratulationScreen());
      }
    });
  }



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
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // VideoConatiner(),
                      Container(
                        height: size.height / 1.4,
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
                                    Text('Sign Up with Email',
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
                                              'Name',
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
                                              keyboardType: TextInputType.text,
                                              controller:
                                              siginInController
                                                  .nametxtController,
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets
                                                      .all(16),
                                                  border: customBorder,
                                                  fillColor: white,
                                                  filled: true,
                                                  hintText: 'Name',
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
                                                  .usernametxtController,
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
                                                            .usernametxtController.text.isNotEmpty) {
                                                          siginInController.sendEmail();
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
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(height: 2),
                                            TextFormField(

                                              onChanged: (value){
                                                 siginInController.validatePassword(value);

                                              },
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              obscureText: siginInController
                                                  .togggle,
                                              controller:
                                              siginInController
                                                  .passwordtxtController,
                                              validator: (value) {
                                                if (value!.trim().isEmpty) {
                                                  return 'Please enter password';
                                                }
                                                if(siginInController.password_strength == 4 / 4){
                                                  // create account event
                                                  return null;
                                                }else{
                                                  return " Password should contain Capital, small letter & Number & Special";
                                                }
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
                                              height: 5,
                                            ),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: LinearProgressIndicator(
                                            value: siginInController.password_strength,
                                            backgroundColor: Colors.grey[300],
                                            minHeight: 5,
                                            color: siginInController.password_strength <= 1 / 4
                                                ? Colors.red
                                                : siginInController.password_strength == 2 / 4
                                                ? Colors.yellow
                                                : siginInController.password_strength == 3 / 4
                                                ? Colors.blue
                                                : Colors.green,
                                          )),
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
                                              controller:
                                              siginInController
                                                  .cpasswordtxtController,
                                              validator: (value) {
                                                if (value!.trim().isEmpty) {
                                                  return 'Please enter confirm password';
                                                } else {
                                                  if (value !=
                                                      siginInController
                                                          .passwordtxtController
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
                                              height: 15,
                                            ),
                                            Text(
                                              'Referral Code',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets
                                                      .all(16),
                                                  border: customBorder,
                                                  fillColor: white,
                                                  filled: true,
                                                  hintText: 'Referral Code',
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
                                                    text: 'Continue',
                                                    bColor: primaryColor,
                                                    tColor: Colors.white,
                                                    press: () {
                                                      if (_formkey.currentState!
                                                          .validate()) {
                                                        if(siginInController.checkBox) {
                                                          siginInController
                                                              .signUpVerification(
                                                              'manual');
                                                        }
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

                      Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              side: const BorderSide(
                                color: onboardingButtoncolor,
                                width: 1.5,
                              ),
                              checkColor: Colors.white,
                              value: siginInController.checkBox,
                              activeColor: onboardingButtoncolor,
                              onChanged: (value) {
                                siginInController.toogleCheckbox();
                              },
                            ),
                            const PrivacyPolicy(),
                          ]),

                      SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('or Sign Up with',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Authentication().signInWithGoogle("Signup");
                              },
                              child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: letsgobuttonColor,
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Colors.white,
                                    child: Image.asset(
                                      constImage.google,
                                      width: 25,
                                      height: 25,
                                    ),
                                  ))),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                              onTap: () {
                                Authentication().signInWithFacebook("Signup");
                              },
                              child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: letsgobuttonColor,
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Colors.white,
                                    child: Image.asset(
                                      constImage.facebook,
                                      width: 25,
                                      height: 25,
                                    ),
                                  ))),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                              onTap: () {
                                _authenticateMe();
                              },
                              child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: letsgobuttonColor,
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Colors.white,
                                    child: Image.asset(
                                      constImage.finger,
                                      width: 25,
                                      height: 25,
                                    ),
                                  ))),
                        ],
                      ),

                      SizedBox(
                        height: 5,
                      ),

                      Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Have an Account?',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                              ),
                            ),
                            GestureDetector(onTap: () {
                              Get.off(LoginScreen());
                            },
                              child:
                            Text(
                              'Log In',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: primaryColor1
                              ),
                            )),
                          ]),

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
