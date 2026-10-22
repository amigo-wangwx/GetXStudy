import 'package:cp_driver_app/pages/car/controller/price_plan_detail_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../base/class_name.dart';
import '../controller/car_detail_controller.dart';
import '../repository/car_detail_repository.dart';

class CarDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CarDetailRepository(),
    );

    /// 需要通过tag来进行区分,避免RefreshController反复使用导致的内存泄露与崩溃
    /// 其实后来想想,其实把page与RefreshController在这里进行put,直接在onInit里面初始化反而逻辑更加简单
    Get.lazyPut(
      tag: className(CarDetailController),
      () => RefreshController(initialRefresh: true),
    );
    Get.lazyPut<int>(
      tag: className(CarDetailController),
      () => 1,
    );
    Get.lazyPut(
      () => CarDetailController(),
    );

    Get.lazyPut(
      () => PricePlanDetailController(),
    );

  }
}
