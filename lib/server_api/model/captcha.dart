class CaptchaResp {
  int? code;
  String? msg;
  String? time;
  CaptchaData? data;

  CaptchaResp({this.code, this.msg, this.time, this.data});

  factory CaptchaResp.fromJson(Map<String, dynamic> json) {
    return CaptchaResp(
      code: json['code'] as int?,
      msg: json['msg'] as String?,
      time: json['time'] as String?,
      data: json['data'] != null ? CaptchaData.fromJson(json['data'] as Map<String, dynamic>) : null,
    );
  }
}


class CaptchaData {
  String? captcha;
  String? id;

  CaptchaData({this.captcha, this.id});

  factory CaptchaData.fromJson(Map<String, dynamic> json) {
    return CaptchaData(
      captcha: json['captcha'] as String?,
      id: json['id'] as String?,
    );
  }
}