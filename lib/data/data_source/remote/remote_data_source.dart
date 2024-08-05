import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:online_learning/core/constans.dart';
import 'package:online_learning/data/data_source/local/storage_helper.dart';
import 'package:online_learning/data/data_source/local/storage_keys.dart';

import '../../model/failure.dart';

abstract class RemoteDataSource {
  Future<Response> httpRequsest(
      {String path = "/",
      required String methodType,
      bool isAuth = false,
      dynamic bodyData});
}

class RemoteDataSourceImp extends RemoteDataSource {
  final Dio client;
  RemoteDataSourceImp({required this.client});

  @override
  Future<Response> httpRequsest(
      {String path = "/",
      required String methodType,
      bool isAuth = false,
      bodyData}) async {
    try {
      print((bodyData));
      var header = {'Content-Type': 'application/json'};
      if (isAuth) {
        var token = await StorageHelper.get(StorageKeys.fcm_token);
        header['Authorization'] = "Bearer $token";
      }
      switch (methodType) {
        case "get":
          return await client.get("${URL.baseUrl + path}",options: Options(headers: header));
        case "post":
          return await client.post("${URL.baseUrl + path}",
              data: (bodyData), options: Options(headers: header));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint('DioError: ${e.response?.statusMessage}');
      } else {
        throw const ServerFailure('Server error');
      }
    }
    return await client.get("${URL.baseUrl + path}");
  }
}
