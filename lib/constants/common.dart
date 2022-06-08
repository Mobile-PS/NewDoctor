import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';



void openURL(String _url) async => await canLaunch(_url)
    ? await launch(_url)
    : showSnackbar("Oops! Something went wrong.");

printLog(dynamic value) {
  if (kDebugMode) {
    log("--------- App logs ---------\n$value");
  }
}

Future<bool?> toast(String message) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black54,
    textColor: Colors.white,
    fontSize: 15.0,
  );
}

showSnackbar(String message, [int timeInSec = 3]) {
  Get.showSnackbar(GetSnackBar(
    message: message,
    duration: Duration(seconds: timeInSec),
    snackStyle: SnackStyle.FLOATING,
  ));
}


hideKeyBoard() => SystemChannels.textInput.invokeMethod('TextInput.hide');



