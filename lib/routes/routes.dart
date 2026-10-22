import 'package:cp_driver_app/pages/car/binding/car_detail_binding.dart';
import 'package:cp_driver_app/pages/my/binding/my_bill_binding.dart';
import 'package:cp_driver_app/pages/my/view/my_bill_page.dart';
import 'package:cp_driver_app/pages/my/view/order/order_detail_canceled_page.dart';
import 'package:cp_driver_app/pages/car/view/price_plan_detail_page.dart';
import 'package:cp_driver_app/pages/my/view/order/order_detail_done_page.dart';
import 'package:cp_driver_app/pages/my/view/order/order_detail_fulfillment_page.dart';
import 'package:cp_driver_app/pages/my/view/order/order_detail_pick_up_page.dart';
import 'package:cp_driver_app/pages/my/view/setting/setting_page.dart';
import 'package:cp_driver_app/pages/pay/binding/select_pay_dialog_binding.dart';

import '../pages/car/view/car_detail_page.dart';
import '../pages/message/binding/msg_binding.dart';

import 'package:cp_driver_app/pages/my/binding/my_order_binding.dart';
import 'package:cp_driver_app/pages/my/view/my_order_page.dart';
import 'package:cp_driver_app/pages/my/view/order/order_detail_paid_page.dart';
import 'package:cp_driver_app/pages/my/view/order/order_detail_signed_page.dart';
import 'package:get/get.dart';

import '../pages/my/view/theme_setting_page.dart';
import '../example_app/state_mixin_example_page.dart';
import '../enum/tag_type.dart';
import '../pages/coin_rank/bindings/coin_rank_binding.dart';
import '../pages/coin_rank/view/coin_rank_page.dart';
import '../pages/common/unknown_page.dart';
import '../pages/home/binding/home_binding.dart';
import '../pages/home/binding/hot_key_binding.dart';
import '../pages/home/view/hot_key_page.dart';
import '../pages/launch/splash_page.dart';
import '../pages/launch/welcome_page.dart';
import '../pages/main/bindings/main_binding.dart';
import '../pages/main/view/main_page.dart';
import '../pages/my/binding/login_binding.dart';
import '../pages/my/binding/my_binding.dart';
import '../pages/my/binding/my_coin_history_binding.dart';
import '../pages/my/binding/my_collect_binding.dart';
import '../pages/my/binding/register_binding.dart';
import '../pages/my/view/login_page.dart';
import '../pages/my/view/my_coin_history_page.dart';
import '../pages/my/view/my_collect_page.dart';
import '../pages/my/view/register_page.dart';
import '../pages/home/binding/search_result_binding.dart';
import '../pages/home/view/search_result_page.dart';
import '../pages/tree/bindings/tabs_binding.dart';
import '../pages/tree/view/tabs_page.dart';
import '../pages/tree/view/tree_page.dart';
import '../pages/web/binding/web_binding.dart';
import '../pages/web/view/web_page.dart';
import 'middleware/login_middleware.dart';
import 'middleware/web_middleware.dart';

abstract class Routes {
  Routes._();

  static const coinRink = '/coinRink';

  static const hotKey = "/hotKey";

  static const searchResult = "/searchResult";

  static const tree = "/tree";

  static const project = "/project";

  static const publicNumber = "/publicNumber";

  static const main = "/main";

  static const login = "/login";

  static const register = "/register";

  static const myCoinHistory = "/myCoinHistory";

  static const myCollect = "/myCollect";

  static const web = "/web/:notShowCollectIcon";

  static const welcome = "/welcome";

  static const splash = "/splash";

  //<editor-fold desc="车辆信息相关">
  static const carDetail = "/home/car/detail";

  static const carPricePlanDetail = "/home/car/pricePlanDetail";

  //</editor-fold>

  /// 选择支付方式弹框
  static const selectPayDialog = "/pay/selectPayDialog";

  static const unknown = "/unknown";

  static const stateMixinExample = "/stateMixinExample";

  /// 我的订单
  static const myOrder = "/myOrder";

  /// 我的订单-待签约
  static const myOrderSigned = "/myOrderSigned";

  /// 我的订单-待签约
  static const myOrderPaid = "/myOrderPaid";

  /// 我的订单-待取车
  static const myOrderPickUp = "/myOrderPickUp";

  /// 我的订单-履约中
  static const myOrderFulfillment = "/myOrderFulfillment";

  /// 我的订单-已完成
  static const myOrderDone = "/myOrderDone";

  /// 我的订单-已取消
  static const myOrderCanceled = "/myOrderCanceled";

  static const myBill = "/myBill";

  static const setting = "/setting";
  static const themeSetting = "/themeSetting";

  ///页面合集
  static final routePage = [
    GetPage(
      name: coinRink,
      page: () => const CoinRankPage(),
      binding: CoinRankBinding(),
      middlewares: [LoginMiddleware()],
    ),
    GetPage(
      name: hotKey,
      page: () => const HotKeyPage(),
      binding: HotKeyBinding(),
    ),
    GetPage(
      name: searchResult,
      page: () => const SearchResultPage(),
      binding: SearchResultBinding(),
    ),
    GetPage(
      name: tree,
      page: () => const TreePage(),
      binding: TabsBinding(TagType.tree),
    ),
    GetPage(
      name: project,
      page: () => const TabsPage(type: TagType.project),
      binding: TabsBinding(TagType.project),
    ),
    GetPage(
      name: publicNumber,
      page: () => const TabsPage(type: TagType.publicNumber),
      binding: TabsBinding(TagType.publicNumber),
    ),
    GetPage(
      name: main,
      page: () => const MainPage(),
      bindings: [
        MainBinding(),
        HomeBinding(),
        MsgBinding(),
        TabsBinding(TagType.project),
        TabsBinding(TagType.publicNumber),
        TabsBinding(TagType.tree),
        MyBinding(),
      ],
    ),
    GetPage(
      name: login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: myCoinHistory,
      page: () => const MyCoinHistoryPage(),
      binding: MyCoinHistoryBinding(),
    ),
    GetPage(
      name: myCollect,
      page: () => const MyCollectPage(),
      bindings: [MyCollectBinding(), WebBinding()],
    ),

    /// ----------- 我的订单 begin
    GetPage(
      name: myOrder,
      page: () => const MyOrderPage(),
      bindings: [MyOrderBinding()],
    ),
    GetPage(name: myOrderSigned, page: () => const OrderDetailSignedPage()),
    GetPage(name: myOrderPaid, page: () => const OrderDetailPaidPage()),

    GetPage(name: myOrderPickUp, page: () => const OrderDetailPickUpPage()),

    GetPage(
      name: myOrderFulfillment,
      page: () => const OrderDetailFulfillmentPage(),
    ),
    GetPage(name: myOrderDone, page: () => const OrderDetailDonePage()),
    GetPage(name: myOrderCanceled, page: () => const OrderDetailCanceledPage()),

    /// ----------- 我的订单 end
    /// ----------- 我的账单 begin
    GetPage(
      name: myBill,
      page: () => const MyBillPage(),
      bindings: [MyBillBinding()],
    ),

    /// ----------- 我的账单 end
    GetPage(
      name: web,
      page: () => WebPage(),
      binding: WebBinding(),
      middlewares: [WebMiddleware()],
    ),
    GetPage(
      name: stateMixinExample,
      page: () => const StateMixinExamplePage(),
      binding: StateMixinBinding(),
    ),
    GetPage(name: unknown, page: () => const UnknownPage()),
    GetPage(name: welcome, page: () => const WelcomePage()),
    GetPage(name: splash, page: () => const SplashPage()),

    //<editor-fold desc="车辆信息 相关页面">
    GetPage(
      name: carDetail,
      page: () => const CarDetailPage(),
      binding: CarDetailBinding(),
    ),
    GetPage(
      name: carPricePlanDetail,
      page: () => const PricePlanDetailPage(),
      bindings: [CarDetailBinding(), SelectPayDialogBinding()],
    ),
    //</editor-fold>

    GetPage(name: setting, page: () => const SettingPage()),
    GetPage(name: themeSetting, page: () => const ThemeSettingPage()),
  ];

  static final unknownPage = GetPage(
    name: Routes.unknown,
    page: () => const UnknownPage(),
  );
}
