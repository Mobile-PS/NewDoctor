import 'dart:async';

import 'package:doctor_appointment_booking/congratulation.dart';
import 'package:doctor_appointment_booking/constants/common.dart';
import 'package:doctor_appointment_booking/models/login_model.dart';
import 'package:doctor_appointment_booking/repositories/mock_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';





class Authentication extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final MockRepository _mockRepository = MockRepository();

  // final loadingController = Get.put(LoadingController());
  final auth = FirebaseAuth.instance;



  Future<void> signInWithGoogle(String type) async {
    final GoogleSignInAccount? googleSignInAccount =
    await _googleSignIn.signIn();

    if (googleSignInAccount == null) return;


   // loadingController.toggleLoading();

    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;


    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

  //  loadingController.toggleLoading();


    final userCredential = await auth.signInWithCredential(credential);
    final user = userCredential.user;


    if (user != null) {

      String? name = user.providerData[0].displayName;
      String? mail = user.providerData[0].email;
      String? imageUrl = user.providerData[0].photoURL;
      String? userid = user.providerData[0].uid;

     // Get.to(CongratulationScreen());

      if(type == 'Signup') {
        final response = await _mockRepository.getSiginUpVerify(name!,
            mail!, "", "", 'google');

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
            mail!, "", "",'google');

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

      // final response = await _mockRepository.socialLoginRegister(mail!, 'google', userid!, name!);


      print(user);

     /* if (response != null && response.status == 200) {
        final successresp = SignInResponse.fromJson(response.data);

        _prefRepo.saveEditProfileData(successresp);*/

        /*final landingresponse = await MockRepository().getUserLanding(successresp.jwt!);
        if (landingresponse != null && landingresponse.status == 200) {
          final successresp = LandingResponse.fromJson(landingresponse.data);
          printLog(successresp.landingPage);

          if(successresp.landingPage =='name_screen') {

            Get.offNamed('/CreateAccountScreen');
          }

          if(successresp.landingPage =='role_screen') {
            Get.offNamed('/ChooseScreen');
          }
          if(successresp.landingPage =='buyerseller_home') {
            Get.offNamed('/Home');
          }
          if(successresp.landingPage =='pending_for_approval_screen') {
            Get.offNamed('/Verification');
          }

          if(successresp.landingPage =='agent_home') {
            Get.offNamed('/Home');
          }

        }*/

        signOut();

    }
    else{
     // loadingController.toggleLoading();

    }
    return;
  }

  signInWithFacebook(String type) async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      // you are logged
      final AccessToken accessToken = result.accessToken!;
      final facebookAuthCredential =
      FacebookAuthProvider.credential(accessToken.token);
      try {
        final UserCredential userCredential =
        await auth.signInWithCredential(facebookAuthCredential);
        final user = userCredential.user;

        print(user);

        if (user != null) {
          String? name = user.displayName;
          String? mail = user.providerData[0].email;
          String? imageUrl = user.providerData[0].photoURL;

        //  Get.to(CongratulationScreen());

          if(type == 'Signup') {
            final response = await _mockRepository.getSiginUpVerify(name!,
                mail!, "", "", 'facebook');

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
                mail!, "", "",'facebook');

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



        }
      } on FirebaseAuthException catch (e) {
        toast(_getMessageFromErrorCode(e));
        signOut();
        //return FAILURE;
      } catch (e) {
        // handle the error here
        toast("Oops! Something went wrong.");
        signOut();

      }
    } else {
      toast("Oops! Something went wrong.");
      signOut();

    }
  }



/*
  void postData() async {
    toggleLoading();
    final response = await _mockRepository.RealEasteTypes();

    printLog(response.status);

    if (response != null && response.status == 200) {
      printLog(response.data);
      realEstateTypesModel = RealEstateTypesModel.fromJson(response.data);
      getState();
      // showSnackbar('Success');
    } else {
      final errresp = CommonErrorResponse.fromJson(response.data);

      showSnackbar(errresp.error!.message!);

      printLog(response.data);
    }
    // toggleLoading();
    //  update();
  }
*/

    String _getMessageFromErrorCode(FirebaseAuthException e) {
      switch (e.code) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
        case "account-exists-with-different-credential":
        case "email-already-in-use":
          return "Email already used! Go to login page.";
        case "ERROR_WRONG_PASSWORD":
        case "wrong-password":
          return "Wrong email/password combination.";
        case "ERROR_USER_NOT_FOUND":
        case "user-not-found":
          return "No user found with this email!";
        case "ERROR_USER_DISABLED":
        case "user-disabled":
          return "User disabled!";
        case "ERROR_TOO_MANY_REQUESTS":
        case "ERROR_OPERATION_NOT_ALLOWED":
        case "operation-not-allowed":
          return "Server error, please try again later!";
        case "ERROR_INVALID_EMAIL":
        case "invalid-email":
          return "Email address is invalid!";
        case "invalid-credential":
          return "Invalid credential! Please try again.";
        default:
          return "Login failed. Please try again!";
      }
    }

    Future<void> signOut() async {
      auth.signOut();
      _googleSignIn.signOut();
    }

}
