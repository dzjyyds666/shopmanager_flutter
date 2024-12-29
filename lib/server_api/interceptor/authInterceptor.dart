import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString('token');
    if (token == null) {
      return "";
    } else {
      return token;
    }
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print('获取token');
    String token = await getToken();
    options.headers['Authorization'] = token;
    handler.next(options); // 继续请求流
  }
}
