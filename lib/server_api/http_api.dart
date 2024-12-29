import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:shopmanager/server_api/model/loginres.dart';


import 'model/Captcha.dart';
import 'model/httpresponse.dart';

part 'http_api.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/getCaptcha')
  @Headers({
    'Origin': '*',
    'Content-Type': 'application/json',
  })
  Future<CaptchaResp> getCaptcha();

  @GET('/sendVerfiyCode')
  @Headers({
    'Origin': '*',
    'Content-Type': 'application/json',
  })
  Future<httpResponse> sendVerfiyCode(
    @Query('email') String email,
  );

  @POST('/loginByPass')
  @Headers({
    'Origin': '*',
    'Content-Type': 'application/json',
  })
  Future<LoginRsp> LoginByPass(@Body() LoginReq req);

  @POST("/loginByVerfy")
  @Headers({
    'Origin': '*',
    'Content-Type': 'application/json',
  })
  Future<LoginRsp> LoginByVerfy(@Body() LoginReq req);

  @GET('/logout')
  @Headers({
    'Origin': '*',
    'Content-Type': 'application/json',
  })
  Future<httpResponse> Logout(@Header('Authorization') String token);
}
