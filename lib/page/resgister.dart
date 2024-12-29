import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopmanager/page/login.dart';

import '../Utils/Utils.dart';
import '../server_api.dart';
import '../server_api/model/Captcha.dart';
import '../server_api/model/httpresponse.dart';

class ResgisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _registerState();
}

class _registerState extends State<ResgisterPage> {
  CaptchaData _captchaData = CaptchaData();

  String email = "";
  String password = "";
  String verifyCode = "";
  String captchaCode = "";

  void _getCaptcha(CaptchaResp rsp) {
    setState(() {
      _captchaData.id = rsp.data?.id;
      _captchaData.captcha = rsp.data?.captcha;
    });
  }

  void _getCaptchaFailed(CaptchaResp rsp) {}

  @override
  void initState() {
    super.initState();
    ServerApi.getCaptcha(_getCaptcha, _getCaptchaFailed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: 0,
          child: Image.network(
            'https://cdn.pixabay.com/photo/2024/04/15/08/30/ai-generated-8697298_1280.jpg',
            fit: BoxFit.fitWidth,
            width: ScreenUtil().screenWidth,
          ),
        ),
        Positioned(
            bottom: 0,
            child: Container(
              height: 500.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
              width: ScreenUtil().screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    '注册账号',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: 275.w,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.r)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            // 阴影颜色
                            spreadRadius: 5,
                            // 阴影扩散半径
                            blurRadius: 7,
                            // 阴影模糊半径
                            offset: Offset(0, 3), // 阴影偏移量
                          ),
                        ],
                      ),
                      child: CupertinoTextField(
                        cursorColor: Colors.black,
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                          color: Colors.white, // 设置背景颜色
                        ),
                        style: TextStyle(color: Colors.black),
                        placeholder: "请输入邮箱",
                        placeholderStyle:
                            TextStyle(color: Colors.grey, fontSize: 16.sp),
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: 275.w,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.r)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            // 阴影颜色
                            spreadRadius: 5,
                            // 阴影扩散半径
                            blurRadius: 7,
                            // 阴影模糊半径
                            offset: Offset(0, 3), // 阴影偏移量
                          ),
                        ],
                      ),
                      child: CupertinoTextField(
                        obscureText: true,
                        cursorColor: Colors.black,
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                          color: Colors.white, // 设置背景颜色
                        ),
                        style: TextStyle(color: Colors.black),
                        placeholder: "请输入密码",
                        placeholderStyle:
                            TextStyle(color: Colors.grey, fontSize: 16.sp),
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 155.w,
                        height: 50.h,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '邮箱验证码',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.r)),
                            ),
                          ),
                          onChanged: (value) {
                            verifyCode = value;
                          },
                        ),
                      ),
                      SizedBox(width: 20.w),
                      GestureDetector(
                        child: Container(
                          width: 100.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r)),
                          ),
                          child: Center(
                            child: Text(
                              '发送验证码',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        onTap: () {
                          if (email.isNotEmpty) {
                            ServerApi.sendVerfiyCode(
                                email, _sendVerfiyCode, _sendVerfiyCodeFailed);
                          } else {
                            Utils.showToast(
                                '邮箱不为空',
                                myColorPool.toastBackgroundErrorColor.hexCode(),
                                myColorPool.toastTextErrorColor.hexCode());
                          }
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 155.w,
                        height: 50.h,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '验证码',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.r)),
                            ),
                          ),
                          onChanged: (value) {
                            captchaCode = value;
                          },
                        ),
                      ),
                      SizedBox(width: 20.w),
                      GestureDetector(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: _captchaData.captcha == null
                                ? Icon(Icons.image)
                                : Image.memory(
                                    Base64Decoder().convert(
                                        _captchaData.captcha!.split(',')[1] ??
                                            ""),
                                    width: 100.w,
                                    height: 50.h,
                                    fit: BoxFit.cover,
                                  )),
                        onTap: () {
                          // 点击刷新验证码
                          ServerApi.getCaptcha(_getCaptcha, _getCaptchaFailed);
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      width: 275.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.r)),
                        color: Colors.blue,
                      ),
                      child: Center(
                          child: Text("注册",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp))),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text(
                        '已有账号？前往登录',
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
            ))
      ],
    ));
  }

  void _sendVerfiyCode(httpResponse rsp) {
    // 添加提示
    Utils.showToast('获取验证码成功', myColorPool.toastBackgroundSuccColor.hexCode(),
        myColorPool.toastTextBlueSuccColor.hexCode());
  }

  void _sendVerfiyCodeFailed(httpResponse rsp) {
    // 添加提示
    Utils.showToast(rsp.msg!, myColorPool.toastBackgroundErrorColor.hexCode(),
        myColorPool.toastTextErrorColor.hexCode());
  }
}
