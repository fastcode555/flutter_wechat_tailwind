import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../widgets/login_form.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('登录').f18.mk,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: column.center.children([
            h60,
            Icons.wechat.icon.primary.s80.mk,
            h40,
            const LoginForm(),
          ]),
        ),
      ),
    );
  }
} 