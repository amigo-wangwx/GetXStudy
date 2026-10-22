import 'package:cp_driver_app/base/class_name.dart';
import 'package:cp_driver_app/pages/my/controller/order/my_order_%20canceled_controller.dart';
import 'package:cp_driver_app/pages/my/controller/order/my_order_controller.dart';
import 'package:cp_driver_app/pages/my/controller/order/my_order_done_controller.dart';
import 'package:cp_driver_app/pages/my/controller/order/my_order_fulfillment_controller.dart';
import 'package:cp_driver_app/pages/my/controller/order/my_order_paid_controller.dart';
import 'package:cp_driver_app/pages/my/controller/order/my_order_pick_up_controller.dart';
import 'package:cp_driver_app/pages/my/controller/order/my_order_signed_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      tag: className(MyOrderController),
      () => RefreshController(initialRefresh: true),
    );
    Get.lazyPut(() => MyOrderController());
    Get.lazyPut<int>(
      tag: className(MyOrderController),
      () => 1,
    );

    /// 待签约
    Get.lazyPut(
      tag: className(MyOrderSignedController),
      () => RefreshController(initialRefresh: true),
    );
    Get.lazyPut(() => MyOrderSignedController());
    Get.lazyPut<int>(
      tag: className(MyOrderSignedController),
      () => 1,
    );

    /// 待支付
    Get.lazyPut(
      tag: className(MyOrderPaidController),
      () => RefreshController(initialRefresh: true),
    );
    Get.lazyPut(() => MyOrderPaidController());
    Get.lazyPut<int>(
      tag: className(MyOrderPaidController),
      () => 1,
    );

    /// 待提车
    Get.lazyPut(
      tag: className(MyOrderPickUpController),
      () => RefreshController(initialRefresh: true),
    );
    Get.lazyPut(() => MyOrderPickUpController());
    Get.lazyPut<int>(
      tag: className(MyOrderPickUpController),
      () => 1,
    );

    /// 履约中
    Get.lazyPut(
      tag: className(MyOrderFulfillmentController),
      () => RefreshController(initialRefresh: true),
    );
    Get.lazyPut(() => MyOrderFulfillmentController());
    Get.lazyPut<int>(
      tag: className(MyOrderFulfillmentController),
      () => 1,
    );

    /// 已完成
    Get.lazyPut(
      tag: className(MyOrderDoneController),
      () => RefreshController(initialRefresh: true),
    );
    Get.lazyPut(() => MyOrderDoneController());
    Get.lazyPut<int>(
      tag: className(MyOrderDoneController),
      () => 1,
    );

    /// 已取消
    Get.lazyPut(
      tag: className(MyOrderCanceledController),
      () => RefreshController(initialRefresh: true),
    );
    Get.lazyPut(() => MyOrderCanceledController());
    Get.lazyPut<int>(
      tag: className(MyOrderCanceledController),
      () => 1,
    );
  }
}
