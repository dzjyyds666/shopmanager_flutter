import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopmanager/widget/bottomNavgitorBar.dart';

class ManagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: ScreenUtil().screenWidth,
        ),
        Padding(
          padding: EdgeInsets.all(20.w),
          child: Text(
            '管理系统',
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w), color: Colors.white),
          width: 335.w,
          height: 200.w,
          child: Text('数据可视化区域'),
        ),
        SizedBox(height: 20.h),
        Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w),
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.w),
          ),
          child: Column(
            children: [
              _manageItem(Icons.edit, '商品管理', () {
                _showShopEdit();
              }),
              _manageItem(Icons.edit, '订单管理', () {
                _showOrderManage();
              }),
              _manageItem(Icons.edit, '用户管理', () {
                _showUserManage();
              }),
              _manageItem(Icons.edit, '分类管理', () {
                _showTypeEdit();
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _manageItem(IconData icon, String name, Function() Callback) {
    return GestureDetector(
      onTap: Callback,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 10.w),
            Text(name),
            Spacer(),
            Icon(Icons.arrow_right)
          ],
        ),
      ),
    );
  }

  void _showShopEdit() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              padding: EdgeInsets.all(20.w),
              width: 300.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.w),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    child: Row(
                      children: [
                        Icon(Icons.upload_outlined),
                        SizedBox(width: 10.w),
                        Text('上架商品'),
                        Spacer(),
                        Icon(Icons.arrow_right)
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _showUploadFileDialog();
                    },
                  ),
                  SizedBox(height: 20.w),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    child: Row(
                      children: [
                        Icon(Icons.download_outlined),
                        SizedBox(width: 10.w),
                        Text('商品状态管理'),
                        Spacer(),
                        Icon(Icons.arrow_right)
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _showTakeOffShopDialog();
                    },
                  ),
                  SizedBox(height: 20.w),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                        SizedBox(width: 10.w),
                        Text('修改商品信息'),
                        Spacer(),
                        Icon(Icons.arrow_right)
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _showUploadFileDialog();
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  void _showUploadFileDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text('上架商品'),
            content: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    // todo 上传图片
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.w)),
                    child: Column(
                      children: [
                        Icon(Icons.upload_file),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text('上传商品图片')
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: '请输入商品名称',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: '请输入商品价格',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: '请输入商品库存',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10.w,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: '请输入商品描述',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3, // 设置为 null 或一个较大的数值以允许多行输入
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: 200.w,
                  height: 50.h,
                  child: Expanded(child: dropDownList()),
                ),
                SizedBox(height: 10.h),
                ElevatedButton(
                  onPressed: () {
                    // todo 上架商品
                  },
                  child: Text('上架商品'),
                )
              ]),
            ),
          );
        });
  }

  void _showTakeOffShopDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.white,
              title: Text('下架商品'),
              content: Container(
                constraints: BoxConstraints(maxHeight: 500.h),
                child: SingleChildScrollView(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                  _takeOffShopItem('手机', '1'),
                  _takeOffShopItem('电脑', '2'),
                  _takeOffShopItem('书', '3'),
                  _takeOffShopItem('书', '4'),
                  _takeOffShopItem('书', '5'),
                  _takeOffShopItem('书', '6'),
                  _takeOffShopItem('书', '4'),
                  _takeOffShopItem('书', '5'),
                  _takeOffShopItem('书', '6'),
                ])),
              ));
        });
  }

  Widget _takeOffShopItem(String name, String id) {
    return Container(
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Row(
        children: [
          Icon(Icons.shop),
          SizedBox(width: 10.w),
          Text('name'),
          Spacer(),
          TextButton(
              onPressed: () {
                // todo 下架商品
              },
              child: Text('下架'))
        ],
      ),
    );
  }

  void _showOrderManage() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              padding: EdgeInsets.all(20.w),
              width: 300.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.w),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    child: Row(
                      children: [
                        Icon(Icons.upload_outlined),
                        SizedBox(width: 10.w),
                        Text('查看所有订单'),
                        Spacer(),
                        Icon(Icons.arrow_right)
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _showAllOrderInfo();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showAllOrderInfo() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.white,
              title: Text('订单列表'),
              content: Container(
                constraints: BoxConstraints(
                  maxHeight: 500.h,
                ),
                child: SingleChildScrollView(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                  _orderInfoItem('手机', '1'),
                  _orderInfoItem('电脑', '2'),
                  _orderInfoItem('书', '3'),
                  _orderInfoItem('书', '3'),
                ])),
              ));
        });
  }

  Widget _orderInfoItem(String name, String id) {
    return Container(
        padding: EdgeInsets.all(10.w),
        margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10.w),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200.w,
              child: Text(
                '订单编号：1983128342374893274491',
                style: TextStyle(fontSize: 12.sp),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: 200.w,
              child: Text(
                '商品：iphone13promax',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: 200.w,
              child: Text(
                '订单金额：￥1000',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: 200.w,
              child: Text(
                '订单所有者：aaron',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: 200.w,
              child: Text(
                '订单状态：已付款',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: 200.w,
              child: Text(
                '时间：2024-10-10 13:20:56',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ));
  }

  void _showUserManage() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.white,
              title: Text('用户管理'),
              content: Container(
                constraints: BoxConstraints(
                  maxHeight: 500.h,
                ),
                child: SingleChildScrollView(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                  _userManageItem('aaron', '1'),
                  _userManageItem('aaron', '2'),
                  _userManageItem('aaron', '3'),
                ])),
              ));
        });
  }

  Widget _userManageItem(String name, String id) {
    return Container(
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Row(
        children: [
          Icon(Icons.shop),
          SizedBox(width: 10.w),
          Text(name),
          Spacer(),
          TextButton(
              onPressed: () {
                // todo 用户管理，设置vip
              },
              child: Text('vip'))
        ],
      ),
    );
  }

  void _showTypeEdit() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              padding: EdgeInsets.all(20.w),
              width: 300.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.w),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    child: Row(
                      children: [
                        Icon(Icons.add_box_outlined),
                        SizedBox(width: 10.w),
                        Text('添加分类'),
                        Spacer(),
                        Icon(Icons.arrow_right)
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _showAddTypeDialog();
                    },
                  ),
                  SizedBox(height: 20.w),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    child: Row(
                      children: [
                        Icon(Icons.delete_outline),
                        SizedBox(width: 10.w),
                        Text('删除分类'),
                        Spacer(),
                        Icon(Icons.arrow_right)
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _showDeleteTypeDialog();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showAddTypeDialog() {
    String typeName = "";
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.white,
              title: Text('添加分类'),
              content: Container(
                  constraints: BoxConstraints(maxHeight: 500.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: '请输入分类名称',
                        ),
                        onChanged: (value) {
                          typeName = value;
                        },
                      ),
                      SizedBox(height: 20.h),
                      ElevatedButton(
                          onPressed: () {
                            // todo 添加分类
                          },
                          child: Text('添加'))
                    ],
                  )));
        });
  }

  void _showDeleteTypeDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.white,
              title: Text('用户管理'),
              content: Container(
                constraints: BoxConstraints(
                  maxHeight: 500.h,
                ),
                child: SingleChildScrollView(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                  _showTypeItem('数码产品', '1'),
                  _showTypeItem('aaron', '2'),
                  _showTypeItem('aaron', '3'),
                ])),
              ));
        });
  }

  Widget _showTypeItem(String name, String id) {
    return Container(
        padding: EdgeInsets.all(10.w),
        margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10.w),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.shop),
                SizedBox(width: 10.w),
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Spacer(),
                TextButton(
                    onPressed: () {
                      // todo 用户管理，设置vip
                    },
                    child: Text('删除'))
              ],
            ),
            Text('GoodsNumber:100'),
          ],
        ));
  }
}

class dropDownList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _dropDownListState();
}

class _dropDownListState extends State<dropDownList> {
  String _selectedValue = '选项1';
  List<String> _dropdownItems = ['选项1', '选项2', '选项3'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: _selectedValue,
        onChanged: (String? newValue) {
          setState(() {
            _selectedValue = newValue!;
          });
        },
        items: _dropdownItems
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ))
            .toList());
  }
}
