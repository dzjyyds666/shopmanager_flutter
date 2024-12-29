class RegisterReq {
  String? verifyCode;
  String? email;
  String? password;
  String? captchaCode;
  String? captchaId;

  RegisterReq(
      {this.verifyCode,
      this.email,
      this.password,
      this.captchaId,
      this.captchaCode});

  Map<String,dynamic> toJson() {
    return {
      "captcha_code": verifyCode,
      "email": email,
      "password": password,
      "verify_code": captchaCode,
      "captcha_id": captchaId
    };
  }
}
