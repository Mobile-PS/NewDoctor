
import 'package:doctor_appointment_booking/constants/const_color.dart';
import 'package:doctor_appointment_booking/constants/const_image.dart';
import 'package:doctor_appointment_booking/constants/const_string.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';




const kAnimationDuration = Duration(microseconds: 100);

final constString = ConstString();
final constImage = ConstImage();

const String oneRatingHeader = "Nah!";
const String twoRatingHeader = "Bad";
const String threeRatingHeader = "Neutral";
const String fourRatingHeader = "Good";
const String fiveRatingHeader = "Awesome!";

const String oneRatingContent =
    "Far below my expectations, need immense\nimprovement";
const String twoRatingContent =
    "Could definitely improve as it did not meet\nexpectations";
const String threeRatingContent = "It was not bad but could definitely improve";
const String fourRatingContent = "It was fine but could have been better";
const String fiveRatingContent = "Great experience, absolutely loved it!";

const String oneRatingQuestion = "What went wrong?";
const String twoRatingQuestion = "What went wrong?";
const String threeRatingQuestion = "What went wrong?";
const String fourRatingQuestion = "What could be better?";
const String fiveRatingQuestion = "What did you like?";

List<Map<String, String>> onboardingData = [
  {
    "text": "Get an edge over other buyers",
    "text1": "Use Refoyer to make an offer, and we'll back it with our cash to make it stand out to sellers",
    "image": constImage.onboardImage1
  },
  {
    "text": "Get an edge over other buyers",
    "text1": "Use Refoyer to make an offer, and we'll back it with our cash to make it stand out to sellers",
    "image": constImage.onboardImage2
  },
  {
    "text": "Get an edge over other buyers",
    "text1": "Use Refoyer to make an offer, and we'll back it with our cash to make it stand out to sellers",
    "image": constImage.onboardImage3
  },
];


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

/*
final submittedPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
    borderRadius: BorderRadius.circular(10),
  ),
);
*/

final customBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: BorderSide(
    color: borderColor,
    width: 1.0,
  ),
);


final customfocusBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: BorderSide(
    color: onboardingButtoncolor,
    width: 1.0,
  ),
);

final customerrorBorder =  OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: BorderSide(
    color: Colors.red,
    width: 1.0,
  ),
);

final RegExp emailRegex = new RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

final RegExp numberRegex = new RegExp(
    r"^[0-9]$");

final RegExp letterRegex = new RegExp(
    r'[a-zA-Z]');

final RegExp minEightletterRegex = new RegExp(
    r'[0-9]');

final RegExp urlRegex = new RegExp( r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?");



