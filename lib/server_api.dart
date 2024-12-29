import 'package:dio/dio.dart';
import 'package:shopmanager/server_api/http_api.dart';
import 'package:shopmanager/server_api/model/Captcha.dart';

import 'package:shopmanager/server_api/model/httpresponse.dart';
import 'package:shopmanager/server_api/model/loginres.dart';

class ServerApi {
  static final baseUrl = 'http://10.94.109.68:8888/api/v1';
  static final _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl, // 设置基础URL
    ),
  )
    ..interceptors.add(
      LogInterceptor(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true),
    );
  static var _httpClient = RestClient(_dio);

  static Future<void> getCaptcha(void Function(CaptchaResp rsp) getCaptcha,
      void Function(CaptchaResp rsp) getCaptchaFailed) async {
    _httpClient.getCaptcha().then((value) {
      if (value.code == 10200) {
        getCaptcha(value);
      } else {
        getCaptchaFailed(value);
      }
    });
  }

  static Future<void> sendVerfiyCode(
      String email,
      void Function(httpResponse rsp) sendVerfiyCode,
      void Function(httpResponse rsp) sendVerfiyCodeFailed) async {
    _httpClient.sendVerfiyCode(email).then((httpResponse) {
      if (httpResponse.code == 10200) {
        sendVerfiyCode(httpResponse);
      } else {
        sendVerfiyCodeFailed(httpResponse);
      }
    });
  }

  static Future<void> LoginByPass(
      LoginReq req,
      void Function(LoginRsp rsp) loginSuccess,
      void Function(LoginRsp rsp) loginFailed) async {
    _httpClient.LoginByPass(req).then((loginRsp) {
      if (loginRsp.code == 10200) {
        loginSuccess(loginRsp);
      } else {
        loginFailed(loginRsp);
      }
    });
  }

  static Future<void> LoginByVerifyCode(
      LoginReq req,
      void Function(LoginRsp rsp) loginSuccess,
      void Function(LoginRsp rsp) loginFailed) async {
    _httpClient.LoginByVerfy(req).then((loginRsp) {
      if (loginRsp.code == 10200) {
        loginSuccess(loginRsp);
      } else {
        loginFailed(loginRsp);
      }
    });
  }

  static Future<void> Logout(String token,void Function(httpResponse rsp) logout,
      void Function(httpResponse rsp) logoutFailed) async {
    _httpClient.Logout(token).then((rsp) {
      if (rsp.code == 10200) {
        logout(rsp);
      } else {
        logoutFailed(rsp);
      }
    });
  }
}
