import 'package:flutter_wechat_tailwind/app/data/models/moment_model.dart';
import 'package:get/get.dart';

import '../../../data/services/moment_service.dart';

class MomentsController extends GetxController {
  final MomentService _momentService = Get.find<MomentService>();

  final isLoading = false.obs;
  final isRefreshing = false.obs;
  final hasMore = true.obs;

  List<MomentModel> get moments => _momentService.moments;

  List<MomentModel> get myMoments => _momentService.myMoments;

  @override
  void onInit() {
    super.onInit();
    _loadMoments();
  }

  Future<void> _loadMoments() async {
    if (isLoading.value) return;
    isLoading.value = true;
    try {
      await _momentService.loadMoments();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refresh() async {
    isRefreshing.value = true;
    try {
      await _loadMoments();
    } finally {
      isRefreshing.value = false;
    }
  }

  Future<void> loadMore() async {
    if (!hasMore.value || isLoading.value) return;
    // TODO: 加载更多朋友圈
  }

  Future<void> publishMoment(String content, List<String> images) async {
    await _momentService.publishMoment(content, images);
    await refresh();
  }

  Future<void> likeMoment(String momentId) async {
    await _momentService.likeMoment(momentId);
  }

  Future<void> commentMoment(String momentId, String content, {String? replyTo}) async {
    await _momentService.commentMoment(momentId, content, replyTo: replyTo);
  }
}
