import 'package:cp_driver_app/pages/pay/controller/select_pay_dialog_controller.dart';
import 'package:get/get.dart';

import '../../../base/base_refresh_controller.dart';
import '../../../base/base_request_controller.dart';
import '../../../entity/base_entity.dart';
import '../../../entity/car/price_plan_entity.dart';
import '../../../enum/response_status.dart';
import '../../../enum/scroll_view_action_type.dart';
import '../../../base/class_name.dart';
import '../../../logger/logger.dart';
import '../../my/controller/my_controller.dart';
import '../repository/car_detail_repository.dart';

/**
 * desc  : 车辆价格方案详情页面controller
 * author: wangwx
 * date  : 2023-10-31
 */
class PricePlanDetailController
    extends BaseRequestController<CarDetailRepository, List<PricePlanEntity>> {

  late SelectPayDialogController selectPayController;

  @override
  void onInit() {
    logger.d("onInit() $className");
    super.onInit();

    final myController = Get.find<MyController>();
    myController.autoLogin();

    selectPayController = Get.find<SelectPayDialogController>();

    aRequest();
  }

  @override
  Future<void> aRequest({
    Map<String, dynamic>? parameters,
  }) async {
    response = await request.getPricePlanList(page: 1).catchError((error) {
      status = ResponseStatus.fail;
      update();
      return error;
    });
    status = response?.responseStatus ?? ResponseStatus.loading;

    data = response?.data ?? [];

    // TODO 假数据
    var bean = PricePlanEntity();
    bean.name = "税费：";
    bean.value = "购置税（经国家政策减免的除外）";
    data?.add(bean);

    bean = PricePlanEntity();
    bean.name = "保险：";
    bean.value = "交强险、车辆损失险、第三者责任险、司机座位责任险、乘客座位责任险、不计免赔特约险、全车盗抢险、发动机涉水损失险、自燃损失险、玻璃单独破碎险、车身划痕损失险";
    data?.add(bean);

    bean = PricePlanEntity();
    bean.name = "维修：";
    bean.value = "车辆本身原因产生的维修费用";
    data?.add(bean);

    bean = PricePlanEntity();
    bean.name = "车载硬件：";
    bean.value = "GPS、行车记录仪、倒车影像";
    data?.add(bean);

    bean = PricePlanEntity();
    bean.name = "养车：";
    bean.value = "检测";
    data?.add(bean);

    bean = PricePlanEntity();
    bean.name = "车辆配件：";
    bean.value = "贴膜、脚垫、座套/座垫";
    data?.add(bean);

    bean = PricePlanEntity();
    bean.name = "能源：";
    bean.value = "充电";
    data?.add(bean);

    bean = PricePlanEntity();
    bean.name = "服务：";
    bean.value = "运管/司管";
    data?.add(bean);

    bean = PricePlanEntity();
    bean.name = "服务：";
    bean.value = "运管/司管";
    data?.add(bean);

    bean = PricePlanEntity();
    bean.name = "服务：";
    bean.value = "运管/司管";
    data?.add(bean);

    bean = PricePlanEntity();
    bean.name = "服务：";
    bean.value = "运管/司管";
    data?.add(bean);

    bean = PricePlanEntity();
    bean.name = "服务：";
    bean.value = "运管/司管";
    data?.add(bean);

    bean = PricePlanEntity();
    bean.name = "服务：";
    bean.value = "运管/司管";
    data?.add(bean);

    bean = PricePlanEntity();
    bean.name = "服务：";
    bean.value = "运管/司管";
    data?.add(bean);

    bean = PricePlanEntity();
    bean.name = "服务：";
    bean.value = "运管/司管";
    data?.add(bean);

    bean = PricePlanEntity();
    bean.name = "服务：";
    bean.value = "运管/司管";
    data?.add(bean);

    bean = PricePlanEntity();
    bean.name = "其他：";
    bean.value = null;
    data?.add(bean);
    status = ResponseStatus.successHasContent;

    update();
  }
}
