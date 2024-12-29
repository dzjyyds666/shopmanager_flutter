import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopmanager/page/homePage.dart';
import 'package:shopmanager/page/login.dart';

import 'Utils/Utils.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isLogin = await Utils.readUserInfoFromSp();

  runApp(MyApp(
    isLogin: isLogin,
  ));
}

class MyApp extends StatelessWidget {
  bool isLogin = false;

  MyApp({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) {
        return MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xfff362C56),
          ),
          title: 'ShopManage',
          home: child,
        );
      },
      child: isLogin ? HomePage() : LoginPage(),
    );
  }
}
