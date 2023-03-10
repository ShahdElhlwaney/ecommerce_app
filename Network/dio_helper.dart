

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper
{

  static Dio dio=Dio(
      BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type':'application/json'
          }
      )
  );

  static Future<Response> getData({
    @required String? url,
    @required Map<String,dynamic>? query,
    String lang='en',
    @required String? token

  })async
  {
    dio.options.headers= {
      'Content-Type':'application/json',
      'lang': lang,
      'Authorization': token
    };
    return dio.get(url!,
        queryParameters: query,

    );
  }
  static Future<Response> postData({
    String lang='en',

    required String url,
    @required Map<String,dynamic>? query,
    required Map<String,dynamic> data,
    @required String? token


  })async {
    dio.options.headers= {
      'Content-Type':'application/json',
      'lang': lang,
      'Authorization': token
    };
    return dio.post(url,queryParameters: query,data: data);
  }

}