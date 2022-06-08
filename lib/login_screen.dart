import 'package:doctor_appointment_booking/auth/authentication.dart';
import 'package:doctor_appointment_booking/congratulation.dart';
import 'package:doctor_appointment_booking/constants/common.dart';
import 'package:doctor_appointment_booking/constants/const_color.dart';
import 'package:doctor_appointment_booking/constants/constants.dart';
import 'package:doctor_appointment_booking/form1.dart';
import 'package:doctor_appointment_booking/form2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  int currentPage = 0;
  double _value = 10;
  TabController? _tabController;

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
        options: const AuthenticationOptions(useErrorDialogs: false)// show error in dialog
      );
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {

      printLog(authenticated);

      _authorizedOrNot = authenticated ? "Authorized" : "Not Authorized";

      if(authenticated){
        Get.to(CongratulationScreen());
      }
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2.5,
          width: MediaQuery.of(context).size.width,
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
                      child: Column(
                        children: [
                          Text('Login using Email Id/Mobile',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: primaryColor)),
                          SizedBox(
                            height: 20.0,
                          ),
                          TabBar(
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Login using',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(onTap: () {

                      Authentication().signInWithGoogle("Login");

                    },
                      child:
                    CircleAvatar(
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
                    GestureDetector(onTap: () {

                      Authentication().signInWithFacebook("Login");

                    },
                      child:
                    CircleAvatar(
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

                    GestureDetector(onTap: () {

                      _authenticateMe();

                    },
                        child:
                    CircleAvatar(
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
                  height: 20,
                ),
              ],
            ))),
      ]),
    );
  }
}
