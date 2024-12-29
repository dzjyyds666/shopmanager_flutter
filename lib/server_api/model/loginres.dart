class LoginRsp {
  int? code;
  String? msg;
  String? time;
  LoginData? data;

  LoginRsp({this.code, this.msg, this.time, this.data});

  factory LoginRsp.fromJson(Map<String, dynamic> json) {
    return LoginRsp(
      code: json['code'] as int?,
      msg: json['msg'] as String?,
      time: json['time'] as String?,
      data: json['data'] != null
          ? LoginData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }
}

class LoginData {
  String? userId;
  String? userName;

  LoginData({
    this.userId,
    this.userName,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      userId: json['UserId'],
      userName: json['UserName'],
    );
  }
}

class LoginReq {
  String? email;
  String? password;
  String? captchaCode;
  String? verifyCode;
  String? captchaId;

  LoginReq({this.email, this.password,this.captchaCode,this.verifyCode,this.captchaId});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'verify_code': verifyCode,
      'captcha_code': captchaCode,
      'captcha_id': captchaId,
    };
  }
}
