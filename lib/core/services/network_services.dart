import 'package:dio/dio.dart';

abstract class NetworkServices {
  Future<Response> get(String url);
  Future<Response> post(String url, dynamic body);
  Future<Response> put(String url, dynamic body);
  Future<Response> delete(String url);
}

class NetworkServicesImplementation implements NetworkServices {
  final Dio dio = Dio();

  NetworkServicesImplementation();
  @override
  Future<Response> get(String url) async {
    final response = await dio.get(url);
    return response;
  }

  @override
  Future<Response> post(String url, body) async {
    final response = await dio.post('', data: body);
    return response;
  }

  @override
  Future<Response> put(String url, body) async {
    final response = await dio.put('', data: body);
    return response;
  }

  @override
  Future<Response> delete(String url) async {
    final response = await dio.delete(url);
    return response;
  }
}
