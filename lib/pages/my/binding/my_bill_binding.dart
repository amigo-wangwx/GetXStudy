import 'package:cp_driver_app/base/class_name.dart';
import 'package:cp_driver_app/pages/my/controller/bill/my_bill_all_controller.dart';
import 'package:cp_driver_app/pages/my/controller/bill/my_bill_controller.dart';
import 'package:cp_driver_app/pages/my/controller/bill/my_bill_overdue_controller.dart';
import 'package:cp_driver_app/pages/my/controller/bill/my_bill_paid_controller.dart';
import 'package:cp_driver_app/pages/my/controller/bill/my_bill_to_paid_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyBillBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      tag: className(MyBillController),
      () => RefreshController(initialRefresh: true),
    );
    Get.lazyPut(() => MyBillController());
    Get.lazyPut<int>(
      tag: className(MyBillController),
      () => 1,
    );

    /// 全部
    Get.lazyPut(
      tag: className(MyBillAllController),
      () => RefreshController(initialRefresh: true),
    );
    Get.lazyPut(() => MyBillAllController());
    Get.lazyPut<int>(
      tag: className(MyBillAllController),
      () => 1,
    );

    /// 待支付
    Get.lazyPut(
      tag: className(MyBillToPaidController),
      () => RefreshController(initialRefresh: true),
    );
    Get.lazyPut(() => MyBillToPaidController());
    Get.lazyPut<int>(
      tag: className(MyBillToPaidController),
      () => 1,
    );

    /// 已支付
    Get.lazyPut(
      tag: className(MyBillPaidController),
      () => RefreshController(initialRefresh: true),
    );
    Get.lazyPut(() => MyBillPaidController());
    Get.lazyPut<int>(
      tag: className(MyBillPaidController),
      () => 1,
    );

    /// 已逾期
    Get.lazyPut(
      tag: className(MyBillOverdueController),
      () => RefreshController(initialRefresh: true),
    );
    Get.lazyPut(() => MyBillOverdueController());
    Get.lazyPut<int>(
      tag: className(MyBillOverdueController),
      () => 1,
    );
  }
}
