import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umrahcar/models/forgot_password_otp_model.dart';
import 'package:umrahcar/models/login_model.dart';

import '../models/forgot_verify_otp_model.dart';
import '../models/login_model.dart';
import '../models/login_model.dart';
import '../models/login_model.dart';
import '../models/login_model.dart';
import '../utils/const.dart';

class DioClient {
  final Dio _dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(onRequest: (options, handler) async {
        final _sharedPref = await SharedPreferences.getInstance();
        if (_sharedPref.containsKey('userId')) {
          options.headers["Authorization"] =
          "Bearer ${_sharedPref.getString('userId')}";
        }
        return handler.next(options);
      }),
    );

  Future<LoginModel> login(Map<String,dynamic> model,BuildContext context) async {
    final _sharedPref = await SharedPreferences.getInstance();
    var uid=_sharedPref.getString('userId');
    print("uiduid: ${uid}");


    try {
      final response =
      await _dio.post('$baseUrl/login_agents', data: model);
      if (response.statusCode == 200) {
        print("hiiii ${response.data}");
        var res= LoginModel.fromJson(response.data);
        return res;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email or Password is incorrect")));
        throw 'SomeThing Missing';
      }
    } catch (e) {
      rethrow;
    }
  }


  Future<ForgotPasswordOtpModel> forgotPasswordOtp(Map<String,dynamic> model,BuildContext context) async {

    try {
      final response =
      await _dio.post('$baseUrl/reset_password_agents', data: model);
      if (response.statusCode == 200) {
        print("hiiii ${response.data}");
        var res= ForgotPasswordOtpModel.fromJson(response.data);
        return res;
      }
      else  {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Email does not exists.")));
        throw 'SomeThing Missing';
      }
    } catch (e) {
      rethrow;
    }
  }



  Future<ForgotOtpVerifyModel> verifyForgotPasswordOtp(Map<String,dynamic> model,BuildContext context) async {

    try {
      final response =
      await _dio.post('$baseUrl/verify_otp_agents', data: model);
      if (response.statusCode == 200) {
        print("hiiii ${response.data}");
        var res= ForgotOtpVerifyModel.fromJson(response.data);
        return res;
      }
      else  {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("OTP is incorrect.")));
        throw 'SomeThing Missing';
      }
    } catch (e) {
      rethrow;
    }
  }
  Future<ForgotOtpVerifyModel> resetNewPassword(Map<String,dynamic> model,BuildContext context) async {

    try {
      final response =
      await _dio.post('$baseUrl/reset_password_set_agents', data: model);
      if (response.statusCode == 200) {
        print("hiiii ${response.data}");
        var res= ForgotOtpVerifyModel.fromJson(response.data);
        return res;
      }
      else  {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("OTP is incorrect.")));
        throw 'SomeThing Missing';
      }
    } catch (e) {
      rethrow;
    }
  }

}
