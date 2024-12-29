import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopmanager/Utils/Utils.dart';
import 'package:shopmanager/page/homePage.dart';
import 'package:shopmanager/page/resgister.dart';
import 'package:shopmanager/server_api.dart';
import 'package:shopmanager/server_api/model/httpresponse.dart';
import 'package:shopmanager/server_api/model/loginres.dart';

import '../server_api/model/Captcha.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _loginState();
}

class _loginState extends State<LoginPage> {
  int loginType = 0; // 0: 密码登录 1: 邮箱登录
  String _email = "";
  String _password = "";
  String _verifyCode = "";
  String _captchaCode = "";

  CaptchaData _captchaData = CaptchaData();

  @override
  void initState() {
    super.initState();
    ServerApi.getCaptcha(_getCaptcha, _getCaptchaFailed);
  }

  void _getCaptcha(CaptchaResp rsp) {
    setState(() {
      _captchaData.id = rsp.data?.id;
      _captchaData.captcha = rsp.data?.captcha;
    });
  }

  void _getCaptchaFailed(CaptchaResp rsp) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      body: Material(
        color: Colors.blue,
        child: Stack(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                          GestureDetector(
                            child: Text(
                              "密码登录",
                              style: TextStyle(
                                fontSize: 20.sp,
                                color:
                                    loginType == 0 ? Colors.blue : Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                loginType = 0;
                              });
                            },
                          ),
                          Text(
                            ' / ',
                            style: TextStyle(fontSize: 20.sp),
                          ),
                          GestureDetector(
                            child: Text(
                              "验证码登录",
                              style: TextStyle(
                                fontSize: 20.sp,
                                color:
                                    loginType == 1 ? Colors.blue : Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                loginType = 1;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        width: 275.w,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r)),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.r)),
                              color: Colors.white, // 设置背景颜色
                            ),
                            style: TextStyle(color: Colors.black),
                            placeholder: "请输入邮箱",
                            placeholderStyle:
                                TextStyle(color: Colors.grey, fontSize: 16.sp),
                            onChanged: (value) {
                              _email = value;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      loginType == 0
                          ? SizedBox(
                              width: 275.w,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.r)),
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
                                  obscureText: true,
                                  padding: EdgeInsets.all(10.w),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.r)),
                                    color: Colors.white, // 设置背景颜色
                                  ),
                                  style: TextStyle(color: Colors.black),
                                  placeholder: "请输入密码",
                                  placeholderStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16.sp),
                                  onChanged: (value) {
                                    _password = value;
                                  },
                                ),
                              ),
                            )
                          : Row(
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.r)),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      _verifyCode = value;
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.r)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '发送验证码',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    if (_email.isNotEmpty) {
                                      ServerApi.sendVerfiyCode(
                                          _email,
                                          _sendVerfiyCode,
                                          _sendVerfiyCodeFailed);
                                    } else {
                                      Utils.showToast(
                                          '邮箱不为空',
                                          myColorPool.toastBackgroundErrorColor
                                              .hexCode(),
                                          myColorPool.toastTextErrorColor
                                              .hexCode());
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
                                _captchaCode = value;
                              },
                            ),
                          ),
                          SizedBox(width: 20.w),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20.r),
                              // child: Image.asset(
                              //   'assets/test.webp',
                              //   width: 100.w,
                              //   height: 50.h,
                              //   fit: BoxFit.cover,
                              // ),
                              child: GestureDetector(
                                child: _captchaData.captcha == null
                                    ? Icon(Icons.image)
                                    : Image.memory(
                                        Base64Decoder().convert(_captchaData
                                                .captcha!
                                                .split(',')[1] ??
                                            ""),
                                        width: 100.w,
                                        height: 50.h,
                                        fit: BoxFit.cover,
                                      ),
                                onTap: () {
                                  // 点击刷新验证码
                                  ServerApi.getCaptcha(
                                      _getCaptcha, _getCaptchaFailed);
                                },
                              ))
                        ],
                      ),
                      SizedBox(height: 20.h),
                      GestureDetector(
                        onTap: () {
                          _login();
                        },
                        behavior: HitTestBehavior.opaque, // 确保点击区域不透明
                        child: Container(
                          width: 275.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.r))),
                          child: Center(
                              child: Text("登录",
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
                                  builder: (BuildContext context) =>
                                      ResgisterPage()));
                        },
                        child: Text(
                          '没有账号？点击注册',
                          style: TextStyle(color: Colors.blue, fontSize: 14.sp),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void _login() {
    if (loginType == 0) {
      // 密码登录, 调用接口
      LoginReq req = LoginReq(
          email: _email,
          password: _password,
          captchaCode: _captchaCode,
          captchaId: _captchaData.id);
      ServerApi.LoginByPass(req, _loginSuccess, _loginFailed);
    } else if (loginType == 1) {
      // 验证码登录, 调用接口
      LoginReq req = LoginReq(
          email: _email,
          verifyCode: _verifyCode,
          captchaCode: _captchaCode,
          captchaId: _captchaData.id);
      ServerApi.LoginByVerifyCode(req, _loginSuccess, _loginFailed);
    }
  }

  void _loginSuccess(LoginRsp rsp) async {
    Utils.showToast('登录成功', myColorPool.toastBackgroundSuccColor.hexCode(),
        myColorPool.toastTextBlueSuccColor.hexCode());

    // 把用户信息存入缓存
    await Utils.setUserIntoCache(
        rsp.data!.userId!, rsp.msg!, rsp.data!.userName!);

    print('跳转到主页');
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => HomePage()));
  }

  void _loginFailed(LoginRsp rsp) {
    Utils.showToast(rsp.msg!, myColorPool.toastBackgroundErrorColor.hexCode(),
        myColorPool.toastTextErrorColor.hexCode());
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
