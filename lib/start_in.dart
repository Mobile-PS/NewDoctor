import 'package:doctor_appointment_booking/constants/button_widget.dart';
import 'package:doctor_appointment_booking/constants/const_color.dart';
import 'package:doctor_appointment_booking/constants/constants.dart';
import 'package:doctor_appointment_booking/login_screen.dart';
import 'package:doctor_appointment_booking/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SartScreen extends StatefulWidget {
  @override
  State<SartScreen> createState() => _SartScreenState();
}

class _SartScreenState extends State<SartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
        child:
      SingleChildScrollView(
          child: Container(
              color: Colors.white,
              margin: EdgeInsets.only(left: 20, right: 20),
              height: MediaQuery.of(context).size.height -50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 15,
                  ),

                  Padding(padding: EdgeInsets.only(right: 10.0),
                    child:
                  Text(
                    'Select Language',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    DropdownButton<String>(
                        underline: SizedBox(),
                        icon: Icon(
                          Icons.language,
                          color: Colors.black,
                        ),
                      items: <String>[
                        'English',
                        'Hindi',
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        //   agentController.updateState(newValue!);
                      },
                    )

                  ),
                  /*ToggleSwitch(
                    minWidth: 70.0,
                    initialLabelIndex: 1,
                    cornerRadius: 10.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: ['English', 'Hindi'],
                    activeBgColors: [[Colors.blue],[Colors.pink]],
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),*/

                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child:
                  SizedBox(
                    height: 200.0,
                    width: 200.0,
                    child: Image.asset(
                      constImage.logoImage,
                      fit: BoxFit.cover,
                    ),
                  )),
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                        ButtonWidget(
                          text: 'Login',
                          bColor: primaryColor,
                          tColor: Colors.white,
                          press: () {
                            Get.to(LoginScreen());
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ButtonWidget(
                          text: 'Sign up',
                          bColor: primaryColor1,
                          tColor: Colors.white,
                          press: () {
                            Get.to(SignupScreen());
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ButtonWidget(
                          text: 'Explore as Guest',
                          bColor: primarylightColor,
                          tColor: Colors.white,
                          press: () {
                            Get.to(SignupScreen());
                          },
                        ),

                      ])),
                ],
              )))),
    );
  }
}
