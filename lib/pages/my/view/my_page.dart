// import 'package:flutter/cupertino.dart';
import 'package:cp_driver_app/pages/my/widgets/bar_item.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:cp_driver_app/app_service/account_service.dart';
import 'package:cp_driver_app/enum/my.dart' as my;
import 'package:cp_driver_app/pages/my/controller/my_controller.dart';
import 'package:cp_driver_app/resource/assets_image_constant.dart';
import 'package:cp_driver_app/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPage extends GetView<MyController> {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            pinned: true,
            floating: true,
            snap: true,
            stretch: true,
            expandedHeight: 211.h,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
                StretchMode.fadeTitle
              ],
              background: Stack(
                children: [
                  Expanded(
                    child: Image.asset(
                      AssetsImageConstant.myPageHeaderIcon,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 28.h, left: 16.5.w, right: 16.5.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 15.w,
                            ),
                            CircleAvatar(
                              radius: 30.r,
                              child: Image.asset(
                                AssetsImageConstant.defaultAvatar,
                              ),
                            ),
                            SizedBox(
                              width: 9.w,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "顾卓阳",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "个人信息管理",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.white),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          color: Colors.white,
                                          size: 18.w,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          height: 125.h,
                          margin: EdgeInsets.only(top: 18.h),
                          // padding: EdgeInsets.symmetric(horizontal: 18.w),
                          padding: EdgeInsets.fromLTRB(18.w, 14.h, 18.w, 22.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(11.r),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFD7D7D7).withAlpha(45),
                                offset: const Offset(1, 0),
                                blurRadius: 5,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "选项卡",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                              ),
                              SizedBox(height: 18.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  BarItemWidget(
                                    title: "订单",
                                    imgPath: AssetsImageConstant.myOrderIcon,
                                    onTap: () => {Get.toNamed('myOrder')},
                                  ),
                                  BarItemWidget(
                                    title: "账单",
                                    imgPath: AssetsImageConstant.myBillIcon,
                                    onTap: () => {Get.toNamed(Routes.myBill)},
                                  ),
                                  BarItemWidget(
                                    title: "申请换车",
                                    imgPath:
                                        AssetsImageConstant.myCarChangeIcon,
                                    onTap: () => {print("申请换车")},
                                  ),
                                  BarItemWidget(
                                    title: "设置",
                                    imgPath: AssetsImageConstant.mySettingIcon,
                                    onTap: () => { Get.toNamed(Routes.setting)},
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 200.h,
              child: Text("底部"),
            ),
          )
        ],
      ),
    );
  }
}
