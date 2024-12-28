import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBottomNavgitorBar extends StatefulWidget {
  final int index;
  final Function(int index) onChangeIndex;

  const MyBottomNavgitorBar(
      {Key? key, required this.index, required this.onChangeIndex})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _bottomNavgitorBarState();
}

class _bottomNavgitorBarState extends State<MyBottomNavgitorBar> {
  int selectIndex = 0;

  @override
  void initState() {
    super.initState();
    selectIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      width: ScreenUtil().screenWidth,
      height: 80.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _bottomNavgitorItem(Icons.shop_outlined, '购买', 0),
          _bottomNavgitorItem(Icons.manage_history_sharp, '管理', 1),
          _bottomNavgitorItem(Icons.person_2_outlined, '个人', 2)
        ],
      ),
    );
  }

  Widget _bottomNavgitorItem(IconData icon, String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectIndex = index;
          widget.onChangeIndex(index);
        });
      },
      child: Container(
        width: 80.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: index == selectIndex
              ? Colors.blue.withOpacity(0.5)
              : Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: index == selectIndex ? Colors.white : Colors.black,
            ),
            Text(
              name,
              style: TextStyle(
                  color: index == selectIndex ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
