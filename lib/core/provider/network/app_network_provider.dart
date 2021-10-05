// import 'dart:async';
// import "package:dio/dio.dart";
//
// class Client{
//   Dio init() {
//     Dio _dio = new Dio();
//     _dio.interceptors.add(new ApiInterceptors());
//     _dio.options.baseUrl = "http://example.com/api";
//     return _dio;
//   }
// }
//
// class ApiInterceptors extends Interceptor {
//   @override
//   Future<dynamic> onRequest(RequestOptions options) async {
//     // do something before request is sent
//   }
//
//   @override
//   Future<dynamic> onError(DioError dioError) {
//     // do something to error
//   }
//
//   @override
//   Future<dynamic> onResponse(Response response) async {
//     // do something before response
//   }
// }