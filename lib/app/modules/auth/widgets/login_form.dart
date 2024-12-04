import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class LoginForm extends GetView<AuthController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return column.p16.children([
      // 手机号输入
      container.white.p16.child(
        TextField(
          onChanged: controller.setPhoneNumber,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            hintText: '请输入手机号',
            border: InputBorder.none,
          ),
        ),
      ),

      h16,

      // 验证码输入
      container.white.p16.child(
        row.children([
          Expanded(
            child: TextField(
              onChanged: controller.setVerificationCode,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: '请输入验证码',
                border: InputBorder.none,
              ),
            ),
          ),
          Obx(() => text('获取验证码').primary.click(
                onTap: controller.canSendCode ? () => controller.sendVerificationCode() : null,
              )),
        ]),
      ),

      h32,

      // 登录按钮
      Obx(() => container.primary.p16.center.rounded8
          .child(
            controller.isLoading.value ? const CircularProgressIndicator(color: Colors.white) : text('登录').white.f16.mk,
          )
          .click(
            onTap: controller.canLogin ? () => controller.login() : null,
          )),
    ]);
  }
}
