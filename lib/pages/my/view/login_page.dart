import 'package:base_module/speak_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:cp_driver_app/base/resign_first_view.dart';
import 'package:cp_driver_app/pages/my/controller/login_controller.dart';
import 'package:cp_driver_app/routes/routes.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResignFirstView(
      child: Scaffold(
        appBar: SpeakAppBar(
          leading: true,
          title: "登录",
          backIconColor: const Color(0xFF525252),
          backgroundColor: const Color(0xF9F9F9),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CupertinoTextField(
                            controller: controller.userNameTextFiledController,
                            focusNode: controller.userNameFocusNode,
                            textInputAction: TextInputAction.next,
                            onSubmitted: (_) => controller
                                .userNameTextFieldOnSubmitted(context),
                            placeholder: "手机号",
                            onChanged: (value) =>
                                controller.userNameIsNotEmpty.value =
                                    value.isNotEmpty,
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                          width: 40.w,
                          child: InkWell(
                            child: const Icon(Icons.clear),
                            onTap: () {
                              controller.userNameTextFiledController.text = "";
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Obx(
                            () => CupertinoTextField(
                              enabled: controller.userNameIsNotEmpty.value,
                              controller:
                                  controller.passwordTextFiledController,
                              focusNode: controller.passwordFocusNode,
                              textInputAction: TextInputAction.done,
                              placeholder: "密码",
                              obscureText: controller.obscureText.value,
                              onChanged: (value) =>
                                  controller.passwordIsNotEmpty.value =
                                      value.isNotEmpty,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.w,
                          width: 38.h,
                          child: Obx(
                            () => InkWell(
                              child: controller.obscureText.value
                                  ? const Icon(Icons.remove_red_eye)
                                  : const Icon(Icons.security),
                              onTap: () {
                                final value = controller.obscureText.value;
                                controller.obscureText.value = !value;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, right: 15),
                          child: GestureDetector(
                            child: Text(
                              "还没有注册?",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 15,
                              ),
                            ),
                            onTap: () async {
                              final result = await Get.toNamed(Routes.register);
                              if (result != null) {
                                navigator?.pop(result);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 15,
                        right: 15,
                      ),
                      child: SizedBox(
                        /// 这个地方可以写宽一点 会被Padding卡住
                        width: double.infinity,
                        height: 44,
                        child: Obx(
                          () => Visibility(
                            visible:
                                controller.userNameIsNotEmpty.value &&
                                controller.passwordIsNotEmpty.value,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).primaryColor,
                                ),
                              ),
                              child: const Text(
                                "登录",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              onPressed: () {
                                controller.login(
                                  username: controller
                                      .userNameTextFiledController
                                      .text,
                                  password: controller
                                      .passwordTextFiledController
                                      .text,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
