import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../util/constants.dart';
import 'exceptions.dart';

class ApiHandler {
  var options = BaseOptions(
      baseUrl: 'http://canteen.benzyinfotech.com/api/v3/',
      headers: {
        Constants.auth: Constants.bearerToken,
      });
  Future<dynamic> post(String url) async {
    var responseJson;
    Dio dio = Dio(options);
    try {
      final response = await dio.post(url);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException(Constants.noInternetMessage);
    }
    return responseJson;
  }

  dynamic _returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 400:
        throw BadRequestException(response.data.toString());
      case 403:
        throw UnauthorisedException(response.data.toString());
      default:
        throw FetchDataException(
            'Error occured with Server : ${response.statusCode}');
    }
  }
}
