import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:popular_people/core/config/end_points.dart';
import 'package:popular_people/core/di/dependency_injection.dart' as di;
import 'package:popular_people/core/handlers/shared_handler.dart';

abstract class Network {
  Future<Response> get(
    {required String? url,
      Map<String, dynamic>? query,
      Map<String, dynamic>? headers,
      bool withToken = true}
    /* {Map<String, String> headers} */
  );
  Future<dynamic> post(
      {required String? url,
      Map<String, dynamic>? body,
      bool isImageBody = false,
      FormData? imageBody,
      Map<String, dynamic>? query,
      bool withToken = true,
      Map<String, dynamic>? headers} /* {/* Map<String, String> headers, */ } */);
  /* Future<dynamic> put(String url, {/* Map<String, String> headers, */ dynamic body});
  Future<dynamic> delete(String url,/*  {Map<String, String> headers} */); */
}

class NetworkImpl extends Network{
  static NetworkImpl? _instance;
  final Dio _dio = Dio();
  NetworkImpl._internal();
  factory NetworkImpl.init() {
    if (_instance == null) {
      _instance = NetworkImpl._internal();
      _instance!._dio.options.baseUrl = ApiEndPoints.baseUrl;
    }
    return _instance!;
  }
@override
  Future<Response> get(
      {required String? url,
      Map<String, dynamic>? query,
      Map<String, dynamic>? headers,
      bool withToken = true}) async {
    String token = '';
    Response? res;
    if (headers != null) {
      _dio.options.headers = headers;
    } else if (withToken) {
      token = await di
          .sl<SharedHandler>()
          .getData(key: SharedKeys().token, valueType: ValueType.string);
      _dio.options.headers = {
        'authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZDM4Y2JkNGFmZDRhOWQ2YWM3ZDQ5MDM4ZDM4NmU3ZSIsIm5iZiI6MTcyMTY2MTg5Mi41NzMwMjIsInN1YiI6IjY0ZjYxNmYzZjI5ZDY2MDBlMzQ0NDg1MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.B0LiBIbJcuXi5YefaXbu3GLVrvz4mp7vpoLR2aueVwU',
        'Accept': 'application/json',
        'Accept-Language': "US"
      };
    }
    try {
      res = await _dio.get(url!,
          queryParameters: query,
          options: Options(headers: _dio.options.headers));
      // log_request(request: url, requestMethod: "GET", query: query ?? {}, headers: _dio!.options.headers);
      return res;
    } on DioException catch (e) {
      log('status: ${e.response!.statusMessage}');
      log('statusCode: ${e.response!.statusCode}');
      log('Dio exception: ${e.stackTrace}');
      log('message: ${e.message}');
      log('error: ${e.error.toString()}');
      // log('token headers: ${e.response!.headers.value('Accept')}');
      log('headers: ${e.response!.requestOptions.headers}');
      log('headers map: ${e.response!.headers.map}');
      log('headers token key: ${e.response!.headers.map.containsKey('authorization')}');

      log('Dio exception: ${e.response!.data.toString()}');
      rethrow;
    } catch (e) {
      log('catch: ${e.toString()}');

      rethrow;
    }
  }

  Future<dynamic> delete(
      {required String? url,
      Map<String, dynamic>? body,
      bool isImageBody = false,
      FormData? imageBody,
      Map<String, dynamic>? query,
      bool withToken = true,
      Map<String, dynamic>? headers}) async {
    try {
      String token = '';
      Response res;
      if (headers != null) {
        _dio.options.headers = headers;
      } else if (withToken) {
        token = await di
            .sl<SharedHandler>()
            .getData(key: SharedKeys().token, valueType: ValueType.string);
        log("Post -> url: $url");
        log('Post -> body:$body');
        log('token: $token');
        _dio.options.headers = {
          'authorization': 'Bearer $token',
          'Accept': 'application/json',
        };
      }

      res = await _dio.delete(url!,
          data: isImageBody ? imageBody : body,
          queryParameters: query,
          options: Options(headers: _dio.options.headers));
      if (res.statusCode! >= 200 || res.statusCode! < 300) {
        return res;
      } else {
        throw Exception("Error");
      }
    } on DioException catch (e) {
      log('status: ${e.response!.statusMessage}');
      log('statusCode: ${e.response!.statusCode}');
      log('Dio exception: ${e.stackTrace}');
      log('message: ${e.message}');
      log('error: ${e.error.toString()}');
      // log('token headers: ${e.response!.headers.value('Accept')}');
      log('headers: ${e.response!.requestOptions.headers}');
      log('headers map: ${e.response!.headers.map}');
      log('headers token key: ${e.response!.headers.map.containsKey('authorization')}');
      log('post body: ${e.response!.requestOptions.data.toString()}');
      log('Dio exception: ${e.response!.data.toString()}');
      rethrow;
    } catch (e) {
      log('catch: ${e.toString()}');

      rethrow;
    }
  }

@override
  Future<dynamic> post(
      {required String? url,
      Map<String, dynamic>? body,
      bool isImageBody = false,
      FormData? imageBody,
      Map<String, dynamic>? query,
      bool withToken = true,
      Map<String, dynamic>? headers}) async {
    try {
      String token = '';
      Response res;
      if (headers != null) {
        _dio.options.headers = headers;
      } else if (withToken) {
        token = await di
            .sl<SharedHandler>()
            .getData(key: SharedKeys().token, valueType: ValueType.string);
        log("Post -> url: $url");
        log('Post -> body:$body');
        log('token: $token');
        _dio.options.headers = {
          'authorization': 'Bearer $token',
          'Accept': 'application/json',
        };
      }

      res = await _dio.post(url!,
          data: isImageBody ? imageBody : body,
          queryParameters: query,
          options: Options(headers: _dio.options.headers));
      if (res.statusCode! >= 200 || res.statusCode! < 300) {
        return res;
      } else {
        throw Exception("Error");
      }
    } on DioException catch (e) {
      log('status: ${e.response!.statusMessage}');
      log('statusCode: ${e.response!.statusCode}');
      log('Dio exception: ${e.stackTrace}');
      log('message: ${e.message}');
      log('error: ${e.error.toString()}');
      // log('token headers: ${e.response!.headers.value('Accept')}');
      log('headers: ${e.response!.requestOptions.headers}');
      log('headers map: ${e.response!.headers.map}');
      log('headers token key: ${e.response!.headers.map.containsKey('authorization')}');
      log('post body: ${e.response!.requestOptions.data.toString()}');
      log('Dio exception: ${e.response!.data.toString()}');
      rethrow;
    } catch (e) {
      log('catch: ${e.toString()}');

      rethrow;
    }
  }
}
