import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('订单详情'),
        centerTitle: true,
        actions: [
          TextButton(onPressed: (){}, child: Text('删除订单',style: TextStyle(color: Colors.red,fontSize: 14.sp),))
        ],
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '订单编号：3u82743873892137128937',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20.h,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset('assets/test.webp'),
            ),
            SizedBox(height: 20.h),
            Container(
              width: 335.w,
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '商品名称：iphone13promax',
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    '购买数目：10',
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        '订单金额：',
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '¥1000',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        '订单状态：',
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '已完成',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    '创建时间：2024-10-20 18:09:11',
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                // todo 支付订单
              },
              child: Container(
                width: 335.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text('去支付',style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.bold),),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
