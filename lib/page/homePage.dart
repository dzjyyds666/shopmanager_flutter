import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shopmanager/widget/bottomNavgitorBar.dart';
import 'package:shopmanager/widget/manage.dart';
import 'package:shopmanager/widget/person.dart';

import '../widget/shopPage.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        if (selectIndex == 0) ShopPage(),
        if (selectIndex == 1) ManagePage(),
        if (selectIndex == 2) PersonPage(),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: MyBottomNavgitorBar(
              index: selectIndex,
              onChangeIndex: _onChangeIndex,
            ))
      ],
    )));
  }

  void _onChangeIndex(int index) {
    setState(() {
      selectIndex = index;
    });
  }
}
