import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dream_bit_cats/res/app_const.dart';
import 'package:dream_bit_cats/services/network_service/interfaces/i_base_http_error.dart';
import 'package:dream_bit_cats/services/network_service/interfaces/i_parameter.dart';
import 'package:dream_bit_cats/services/network_service/models/base_http_response.dart';
import 'package:dream_bit_cats/services/network_service/models/no_connection_http_error.dart';

class NetworkService {
  static final NetworkService _instance = NetworkService._privateConstructor();

  static NetworkService get instance => _instance;

  late Dio _dio;

  NetworkService._privateConstructor() {
    _dio = Dio();
  }

  Future<bool> checkInternetConnection() async {
    try {
      final List<InternetAddress> result = await InternetAddress.lookup(AppConst.exampleUrl);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } catch (_) {
      return false;
    }
    return false;
  }

  Future<BaseHttpResponse> request({
    required HttpType type,
    required String route,
    required IParameter parameter,
  }) async {
    Response? response;
    final String requestUrl = AppConst.baseUrl + route;
    final Options options = Options(headers: {
      AppConst.accept: AppConst.contentTypeValue,
      AppConst.contentTypeKey: AppConst.contentTypeValue,
    });

    try {
      switch (type) {
        case HttpType.httpGet:
          response = await _dio.get(
            requestUrl,
            options: options,
            queryParameters: parameter.getParams(),
          );
          break;
        case HttpType.httpPost:
          response = await _dio.post(
            requestUrl,
            options: options,
            queryParameters: parameter.getParams(),
          );
          break;
      }

      if (response.statusCode == null || response.statusCode! >= 300) {
        return BaseHttpResponse(
          error: NoConnectionHttpError(
            error: response.data,
            statusCode: response.statusCode ?? AppConst.noConnectionStatusCode,
          ),
        );
      }

      return BaseHttpResponse(response: response.data);
    } on DioError catch (error) {
      BaseHttpResponse(
        error: IBaseHttpError(
          statusCode: response?.statusCode ?? AppConst.noConnectionStatusCode,
          error: error.error,
        ),
      );
    }
    return BaseHttpResponse();
  }
}
