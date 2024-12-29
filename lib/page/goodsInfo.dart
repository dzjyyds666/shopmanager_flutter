import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoodsInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _goodsInfoState();
}

class _goodsInfoState extends State<GoodsInfo> {
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品详情"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: ScreenUtil().screenWidth,
              height: 20.h,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/test.webp",
                fit: BoxFit.cover,
                width: ScreenUtil().screenWidth * 0.9,
                height: 200.h,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.only(left:20.w,right:20.w),
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '数码产品',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '¥9999',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    '库存信息：100',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(height: 20.h),
                  Text('描述信息'),
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                        onPressed: () {
                          _showBuyDialog();
                        },
                        child: Text('购买')),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  void _showBuyDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text('购买'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('购买数量:$_count'),
                  Text('库存:100'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            // todo 添加库存条件判断
                            if (_count <= 1) {
                            } else {
                              setState(() {
                                _count--;
                                print(_count);
                              });
                            }
                          },
                          icon: Icon(Icons.remove)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _count++;
                              print(_count);
                            });
                          },
                          icon: Icon(Icons.add))
                    ],
                  )
                ],
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
                    },
                    child: Text('购买'))
              ],
            );
          });
        });
  }
}
