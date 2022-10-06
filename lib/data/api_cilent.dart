import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiClinet extends GetConnect implements GetxService {
  String token = "";
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClinet({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authrization': 'Bearer $token',
    };
  }

  Future<Response> getData(
    String url,
  ) async {
    try {
      Response response = await get(url);
      print(" i got the data");
      return response;
    } catch (e) {
      print(" no founds");
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
