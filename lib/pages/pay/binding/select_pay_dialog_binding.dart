import 'package:cp_driver_app/base/class_name.dart';
import 'package:get/get.dart';

import '../controller/select_pay_dialog_controller.dart';

/**
 * desc  : 选择支付方式 Binding
 * author: wangwx
 * date  : 2023-11-01
 */
class SelectPayDialogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        tag: className(SelectPayDialogController),
        () => SelectPayDialogController());

    Get.lazyPut(() => SelectPayDialogController());
  }
}
