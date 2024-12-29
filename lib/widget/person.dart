import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopmanager/Utils/Utils.dart';
import 'package:shopmanager/page/login.dart';
import 'package:shopmanager/page/order.dart';
import 'package:shopmanager/server_api.dart';
import 'package:shopmanager/server_api/model/httpresponse.dart';

class PersonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  void initState() {
    super.initState();
    print('个人页面初始化');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: ScreenUtil().screenWidth,
        ),
        Container(
          padding: EdgeInsets.all(20.w),
          margin:
              EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w, bottom: 20.h),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/test.webp',
                  width: 50.w,
                  height: 50.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 20.w),
              Text(
                'Aaron',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          width: ScreenUtil().screenWidth,
                          height: 150.h,
                          padding: EdgeInsets.all(20.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.r),
                              topRight: Radius.circular(20.r),
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                '确定要退出登录吗？',
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.black),
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        '取消',
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            color: Colors.black),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        // todo 退出登录
                                        print('退出登录');
                                        _logout();
                                      },
                                      child: Text(
                                        '确定',
                                        style: TextStyle(
                                            fontSize: 20.sp, color: Colors.red),
                                      ))
                                ],
                              )
                            ],
                          ),
                        );
                      });
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w),
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              )),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              _showEditDialog('用户名', (String value) {
                print('修改用户名为${value}');
              });
            },
            child: Row(
              children: [
                Icon(Icons.edit),
                SizedBox(width: 20.w),
                Text(
                  '修改用户名',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(Icons.arrow_right),
              ],
            ),
          ),
        ),
        _editUserInfoItem(Icons.edit, '修改密码', () {
          _showEditDialog('密码', (String value) {
            print('修改密码为${value}');
          });
        }),
        Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w),
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                _showUploadAvatarDialog();
              },
              behavior: HitTestBehavior.opaque,
              child: Row(
                children: [
                  Icon(Icons.edit),
                  SizedBox(width: 20.w),
                  Text(
                    '修改头像',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_right),
                ],
              ),
            )),
        SizedBox(height: 20.h),
        Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w),
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => OrderInfo()));
              },
              behavior: HitTestBehavior.opaque,
              child: Row(
                children: [
                  Icon(Icons.reorder),
                  SizedBox(width: 20.w),
                  Text(
                    '查看订单',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_right),
                ],
              ),
            ))
      ],
    );
  }

  Widget _editUserInfoItem(IconData icon, String name, Function() Callback) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: GestureDetector(
        onTap: Callback,
        behavior: HitTestBehavior.opaque,
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 20.w),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(Icons.arrow_right),
          ],
        ),
      ),
    );
  }

  void _showUploadAvatarDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('修改头像'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('上传头像');
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 1),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 200.w,
                              height: 200.h,
                              child: Center(
                                child: Icon(
                                  Icons.upload_file,
                                  size: 100,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('取消')),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('确定')),
                    ],
                  )
                ],
              ));
        });
  }

  void _showEditDialog(String name, Function(String value) Callback) {
    String _value = '';
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('修改${name}'),
              content: TextField(
                decoration: InputDecoration(
                  hintText: '请输入${name}',
                ),
                onChanged: (value) {
                  _value = value;
                },
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('取消')),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Callback(_value);
                    },
                    child: Text('确定')),
              ]);
        });
  }

  void _logout()async {
    String token = await Utils.getToken();
    ServerApi.Logout(token,_logoutSucess, _logoutFailed);
  }

  void _logoutSucess(httpResponse rsp) async {
    Utils.removeUserInfoFromSp().then((e) {
      Utils.showToast('退出成功', myColorPool.toastBackgroundSuccColor.hexCode(),
          myColorPool.toastTextBlueSuccColor.hexCode());
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
    });
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void _logoutFailed(httpResponse rsp) {
    Utils.showToast('退出失败', myColorPool.toastBackgroundSuccColor.hexCode(),
        myColorPool.toastTextBlueSuccColor.hexCode());
  }
}
