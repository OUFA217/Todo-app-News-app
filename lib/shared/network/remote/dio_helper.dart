// ignore_for_file: unused_element

import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

Map<String, String> _headers = <String, String>{
  'Content-Type': 'application/json',
  'Accept': 'application/json',
};

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'http://192.168.1.2:9000/',
          receiveDataWhenStatusError: true,
          headers: {'Content-Type': 'application/json'}),
    );
  }

  static Future<Response> createUser({
    required url,
    required Map<String, dynamic> query,
  }) async {
    return await dio!.post(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> getdata({
    required url,
    required Map<String, dynamic> query,
  }) async {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postLogin(
      {required url,
      required Map<String, dynamic> data,
      String lang = 'en',
      String? token,
      required Map<String, dynamic> query}) async {
    dio!.options.headers = {
      'lang': lang,
      'token': token,
      'Content-Type': 'application/json',
    };
    return dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
