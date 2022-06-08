import 'dart:convert';


import 'package:doctor_appointment_booking/congratulation.dart';
import 'package:doctor_appointment_booking/constants/common.dart';
import 'package:doctor_appointment_booking/models/common_error_response.dart';
import 'package:doctor_appointment_booking/models/login_model.dart';
import 'package:doctor_appointment_booking/repositories/mock_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SigninPageController extends GetxController {
  final MockRepository _mockRepository = MockRepository();

  TextEditingController usernametxtController = TextEditingController();
  TextEditingController passwordtxtController = TextEditingController();
  TextEditingController phonetxtController = TextEditingController();


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


  void signinVerification(String type,String platform) async {

    toggleLoading();

    if(type == 'Email') {
      final response = await _mockRepository.getSiginVerifyEmail(
          usernametxtController.text, passwordtxtController.text, "",platform);

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
    }
    else{

      final response = await _mockRepository.getSiginVerifyEmail(
          "", passwordtxtController.text, phonetxtController.text,platform);

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

    }

   // _widgets?.stopLoader();
    toggleLoading();
    update();

     }





}
