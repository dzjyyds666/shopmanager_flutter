class httpResponse {
  int? code;
  String? msg;
  String? time;

  httpResponse({
    this.code,
    this.msg,
    this.time,
  });

  factory httpResponse.fromJson(Map<String, dynamic> json) {
    return httpResponse(
      code: json['code'] as int?,
      msg: json['msg'] as String?,
      time: json['time'] as String?,
    );
  }
}
