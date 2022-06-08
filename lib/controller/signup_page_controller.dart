import 'dart:convert';


import 'package:doctor_appointment_booking/ChangePassword_screen.dart';
import 'package:doctor_appointment_booking/congratulation.dart';
import 'package:doctor_appointment_booking/constants/common.dart';
import 'package:doctor_appointment_booking/login_screen.dart';
import 'package:doctor_appointment_booking/models/common_error_response.dart';
import 'package:doctor_appointment_booking/models/login_model.dart';
import 'package:doctor_appointment_booking/repositories/mock_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpPageController extends GetxController {
  final MockRepository _mockRepository = MockRepository();


  TextEditingController nametxtController = TextEditingController();

  TextEditingController usernametxtController = TextEditingController();
  TextEditingController passwordtxtController = TextEditingController();
  TextEditingController phonetxtController = TextEditingController();
  TextEditingController cpasswordtxtController = TextEditingController();

  TextEditingController emailotptxtController = TextEditingController();
  TextEditingController otptxtController = TextEditingController();
  TextEditingController forgetpasstxtController = TextEditingController();
  TextEditingController confforgetpasstxtController = TextEditingController();


  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  double password_strength = 0;

  bool togggle = true;
  bool loading = false;
  bool checkBox = false;
  BuildContext? _context;



  void tooglePassword(){
    togggle = !togggle;
    update();
  }

  void toggleLoading() {
    if (loading) {
      loading = false;
    } else {
      loading = true;
    }
    update();
  }



  void toogleCheckbox() {
    checkBox = !checkBox;
    update();
  }


  bool validatePassword(String pass){
    String _password = pass.trim();
    if(_password.isEmpty){

        password_strength = 0;

    }else if(_password.length < 6 ){

        password_strength = 1 / 4;
    }else if(_password.length < 8){
        password_strength = 2 / 4;
    }else{
      if(pass_valid.hasMatch(_password)){
          password_strength = 4 / 4;
        return true;
      }else{
          password_strength = 3 / 4;
        return false;
      }
    }
    update();

    return false;

  }

  void signUpVerification(String logintype) async {

    toggleLoading();


      final response = await _mockRepository.getSiginUpVerify(nametxtController.text,
          usernametxtController.text,phonetxtController.text, passwordtxtController.text,logintype);

      printLog(response.status);

      if (response != null && response.status == 200) {
        // _widgets?.stopLoader();

        printLog(response.data);
        final successresp = Login_Model.fromJson(response.data);


        if (successresp.meta?.flag == 'SUCCESS') {
          Get.to(CongratulationScreen());
        }
        else {
          showSnackbar(successresp.meta!.message!);
        }


        // Get.back();
        // Get.toNamed('/home');


      }
      else {
        final errresp = Login_Model.fromJson(response.data);

        showSnackbar(errresp.meta!.message!);

        printLog(response.data);
      }


   // _widgets?.stopLoader();
    toggleLoading();
    update();

     }



  void sendEmail() async {

    toggleLoading();


    final response = await _mockRepository.getEmailOtp(usernametxtController.text);

    printLog(response.status);

    if (response != null && response.status == 200) {
      // _widgets?.stopLoader();

      printLog(response.data);

      showSnackbar('check your email for the otp');




      // Get.back();
      // Get.toNamed('/home');


    }
    else {
      final errresp = Login_Model.fromJson(response.data);

      showSnackbar(errresp.meta!.message!);

      printLog(response.data);
    }


    // _widgets?.stopLoader();
    toggleLoading();
    update();

  }

  void sendForgetEmail() async {

    toggleLoading();


    final response = await _mockRepository.getForgetOtp(emailotptxtController.text);

    printLog(response.status);

    if (response != null && response.status == 200) {
      // _widgets?.stopLoader();

      printLog(response.data);

      showSnackbar('check your email for the otp');

       Get.to(ChangePasswordScreen());


      // Get.back();
      // Get.toNamed('/home');


    }
    else {
      final errresp = Login_Model.fromJson(response.data);

      showSnackbar(errresp.meta!.message!);

      printLog(response.data);
    }


    // _widgets?.stopLoader();
    toggleLoading();
    update();

  }


  void verifyForgetEmail() async {

    toggleLoading();


    final response = await _mockRepository.getForgetVerify(emailotptxtController.text,otptxtController.text,confforgetpasstxtController.text);

    printLog(response.status);

    if (response != null && response.status == 200) {
      // _widgets?.stopLoader();

      printLog(response.data);

      showSnackbar('password change successfully');


        Get.offAll(LoginScreen());
      // Get.back();
      // Get.toNamed('/home');


    }
    else {
      final errresp = Login_Model.fromJson(response.data);

      showSnackbar(errresp.meta!.message!);

      printLog(response.data);
    }


    // _widgets?.stopLoader();
    toggleLoading();
    update();

  }



}
