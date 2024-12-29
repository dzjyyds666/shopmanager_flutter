import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../page/goodsInfo.dart';

class ShopPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  void initState() {
    super.initState();
    print('shopPage初始化');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Text(
            '欢迎使用超市管理系统',
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        SizedBox(
          height: 80.h,
          child: ListView.builder(
            itemCount: 10,
            // 横向
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return _typeItem('数码', '$index');
            },
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Text(
            '热门产品',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10.h),
        Expanded(
            child: SingleChildScrollView(
          child: Wrap(
            children: [
              _goodsItme(),
              _goodsItme(),
              _goodsItme(),
              _goodsItme(),
              _goodsItme(),
              _goodsItme(),
              _goodsItme(),
              _goodsItme(),
              _goodsItme(),
              _goodsItme(),
              _goodsItme(),
              _goodsItme(),
              _goodsItme(),
              _goodsItme(),
            ],
          ),
        )),
        SizedBox(height: 80.h)
      ],
    );
  }

  Widget _typeItem(String name, String id) {
    return Container(
      width: 70.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.w),
      ),
      margin: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shop_outlined,
            size: 30,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 15.sp),
          ),
        ],
      ),
    );
  }

  Widget _goodsItme() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GoodsInfo()));
      },
      child: Container(
          width: ScreenUtil().screenWidth * 0.5,
          padding: EdgeInsets.all(10.w),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.w),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.w),
                      topRight: Radius.circular(10.w)),
                  child: Image.asset(
                    'assets/test.webp',
                    width: ScreenUtil().screenWidth * 0.5 - 20.w,
                    height: 150.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.w),
                  child: Row(
                    children: [
                      Text('商品名称'),
                      Spacer(),
                      Text('￥100'),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
