import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../base/class_name.dart';
import '../controller/msg_controller.dart';
import '../repository/msg_repository.dart';

class MsgBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MsgRepository(),
    );

    /// 需要通过tag来进行区分,避免RefreshController反复使用导致的内存泄露与崩溃
    /// 其实后来想想,其实把page与RefreshController在这里进行put,直接在onInit里面初始化反而逻辑更加简单
    Get.lazyPut(
      tag: className(MsgController),
      () => RefreshController(initialRefresh: true),
    );
    Get.lazyPut<int>(
      tag: className(MsgController),
      () => 1,
    );
    Get.lazyPut(
      () => MsgController(),
    );
  }
}
