/*
 * @Author: 米亚流年 miyaliunian@gmail.com
 * @Date: 2023-10-25 16:50:37
 * @LastEditors: 米亚流年 miyaliunian@gmail.com
 * @LastEditTime: 2023-10-27 18:34:03
 * @FilePath: /cp_driver_app/lib/pages/common/status_view.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:cp_driver_app/base/base_controller.dart';
import 'package:cp_driver_app/enum/response_status.dart';
import 'loading_view.dart';
import 'error_view.dart';
import 'empty_view.dart';

typedef WidgetBuilder<T extends BaseController> = Widget Function(T);

/// 响应View,这个view和网络请求的回调紧密联系,是我经过几次思考后得出的方案
class StatusView<T extends BaseController> extends StatelessWidget {
  /// 这里将loading\error\empty的页面都改成可选类型,方便自定义
  final Widget? loadingView;

  final WidgetBuilder<T>? errorViewBuilder;

  final WidgetBuilder<T> contentBuilder;

  final WidgetBuilder<T>? emptyViewBuilder;

  final String? tag;

  const StatusView(
      {Key? key,
      this.loadingView,
      this.errorViewBuilder,
      required this.contentBuilder,
      this.emptyViewBuilder,
      this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      tag: tag,
      builder: ((controller) {
        // AI告诉我用IndexedStack来切换不同的状态视图这种方式不太好,因为IndexedStack会在构建时就把所有的子视图都构建出来
        // 这样会导致在页面初始的时候就会触发所有的网络请求,而不是在对应的状态下才触发网络请求
        // 所以我选择了使用switch来切换不同的状态视图
        //return responseStatusWidgetWithSwitch(controller);

        // 默认情况下使用IndexedStack来切换不同的状态视图
        return responseStatusWidgetWithIndexStack(controller);
      }),
    );
  }

  Widget _errorView(T controller) {
    if (errorViewBuilder != null) {
      return errorViewBuilder!(controller);
    } else {
      return ErrorView(retryAction: controller.retry);
    }
  }

  Widget _emptyView(T controller) {
    if (emptyViewBuilder != null) {
      return emptyViewBuilder!(controller);
    } else {
      return EmptyView(emptyTap: controller.emptyTap);
    }
  }

  /// 这种方式好像在构建首页的时候无法触发首页刷新操作,导致无法做首页的网络请求,正常的页面无法构建
  /// 在更多的页面尝试你会发现下面这种方式是不行的
  /// IndexedStack的构建是先把所有页面构建出来,然后在对应页面下拉操作中使用controller做网络请求
  /// 接着网络请求返回的状态反馈到IndexedStack,展示对应状态的页面
  /// 如果想要用下面这个方式,需要在页面对应控制器的onInit或者onReady就做网络请求,而且RefreshController就不用初始的时候就刷新了
  Widget responseStatusWidgetWithSwitch(T controller) {
    switch (controller.status) {
      case ResponseStatus.loading:
        return loadingView ?? const LoadingView();
      case ResponseStatus.fail:
        return _errorView(controller);
      case ResponseStatus.successHasContent:
        return contentBuilder(controller);
      case ResponseStatus.successNoData:
        return _emptyView(controller);
    }
  }

  Widget responseStatusWidgetWithIndexStack(T controller) {
    return IndexedStack(
      index: controller.status.value,
      children: [
        loadingView ?? const LoadingView(),
        _errorView(controller),
        contentBuilder(controller),
        _emptyView(controller),
      ],
    );
  }
}
