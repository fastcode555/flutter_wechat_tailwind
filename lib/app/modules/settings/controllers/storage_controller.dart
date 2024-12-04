import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StorageController extends GetxController {
  // 存储空间使用情况
  final totalUsage = '2.1 GB'.obs;
  final imageUsage = '1.2 GB'.obs;
  final videoUsage = '600 MB'.obs;
  final fileUsage = '300 MB'.obs;

  // 使用百分比
  double get usagePercentage => 0.7; // 70% 使用率

  // 清理图片
  Future<void> cleanImages() async {
    final result = await Get.dialog<bool>(
      AlertDialog(
        title: const Text('清理图片'),
        content: const Text('确定要清理所有聊天图片吗？'),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: const Text('确定'),
          ),
        ],
      ),
    );

    if (result == true) {
      // TODO: 实现清理图片逻辑
      imageUsage.value = '0 B';
      _updateTotalUsage();
      Get.snackbar('提示', '图片清理完成');
    }
  }

  // 清理视频
  Future<void> cleanVideos() async {
    final result = await Get.dialog<bool>(
      AlertDialog(
        title: const Text('清理视频'),
        content: const Text('确定要清理所有聊天视频吗？'),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: const Text('确定'),
          ),
        ],
      ),
    );

    if (result == true) {
      // TODO: 实现清理视频逻辑
      videoUsage.value = '0 B';
      _updateTotalUsage();
      Get.snackbar('提示', '视频清理完成');
    }
  }

  // 清理文件
  Future<void> cleanFiles() async {
    final result = await Get.dialog<bool>(
      AlertDialog(
        title: const Text('清理文件'),
        content: const Text('确定要清理所有聊天文件吗？'),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: const Text('确定'),
          ),
        ],
      ),
    );

    if (result == true) {
      // TODO: 实现清理文件逻辑
      fileUsage.value = '0 B';
      _updateTotalUsage();
      Get.snackbar('提示', '文件清理完成');
    }
  }

  // 一键清理
  Future<void> cleanAll() async {
    final result = await Get.dialog<bool>(
      AlertDialog(
        title: const Text('一键清理'),
        content: const Text('确定要清理所有聊天数据吗？'),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: const Text('确定'),
          ),
        ],
      ),
    );

    if (result == true) {
      // TODO: 实现一键清理逻辑
      imageUsage.value = '0 B';
      videoUsage.value = '0 B';
      fileUsage.value = '0 B';
      _updateTotalUsage();
      Get.snackbar('提示', '一键清理完成');
    }
  }

  // 更新总使用量
  void _updateTotalUsage() {
    // TODO: 实现计算总使用量的逻辑
    totalUsage.value = '0 B';
  }
}
