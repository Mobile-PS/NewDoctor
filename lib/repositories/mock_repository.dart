import 'package:dio/dio.dart';
import 'package:doctor_appointment_booking/constants/http.dart';
import 'package:doctor_appointment_booking/repositories/_base.dart';
import 'package:doctor_appointment_booking/services/configs/constants.dart';
import 'package:flutter/cupertino.dart';




class MockRepository extends BaseRepository {
 // MockRepository(Dio dio) : super(dio);

  Future<dynamic>? getSiginVerifyEmail(String username,String password,String phone,String logintype) {
    return requestApi(
      method: POST,
      url: LoginUrl,
      data: {
        paramUsername: username,
        paramPassword: password,
        paramMobile: phone,
        social:logintype

      },
      options: Options(headers: getHeader())
    ).then((response) {
      return response;
    });
  }


  Future<dynamic>? getSiginUpVerify(String name,String email,String mobile,String password,String logintype) {
    return requestApi(
        method: POST,
        url: RegisterUrl,
        data: {
          paramName: name,
          paramUsername: email,
          paramMobile: mobile,
          paramPassword: password,
          social:logintype
        },
        options: Options(headers: getHeader())
    ).then((response) {
      return response;
    });
  }


  Future<dynamic>? getEmailOtp(String email) {
    return requestApi(
        method: POST,
        url: EmailOtpUrl,
        data: {
          'email': email
        },
        options: Options(headers: getHeader())
    ).then((response) {
      return response;
    });
  }


  Future<dynamic>? getForgetOtp(String email) {
    return requestApi(
        method: POST,
        url: ForgetOtpUrl,
        data: {
          'email': email
        },
        options: Options(headers: getHeader())
    ).then((response) {
      return response;
    });
  }


  Future<dynamic>? getForgetVerify(String email,String otp,String password ) {
    return requestApi(
        method: POST,
        url: ForgetOtpUrl,
        data: {
          'email': email,
          'otp':otp,
          'password':password
        },
        options: Options(headers: getHeader())
    ).then((response) {
      return response;
    });
  }

}
