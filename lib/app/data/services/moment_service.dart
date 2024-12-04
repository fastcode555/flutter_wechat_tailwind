import 'package:flutter_wechat_tailwind/app/data/services/auth_service.dart';
import 'package:get/get.dart';

import '../models/moment_model.dart';

class MomentService extends GetxService {
  final _moments = <MomentModel>[].obs;

  List<MomentModel> get moments => _moments;

  final _myMoments = <MomentModel>[].obs;

  List<MomentModel> get myMoments => _myMoments;

  @override
  void onInit() {
    super.onInit();
    loadMoments();
  }

  Future<void> loadMoments() async {
    // TODO: 从服务器加载朋友圈
    _moments.value = [
      MomentModel(
        id: '1',
        userId: '2',
        content: '今天天气真好',
        images: ['https://picsum.photos/200/300'],
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        likes: [],
        comments: [],
      ),
      MomentModel(
        id: '1',
        userId: '2',
        content: '今天天气真好',
        images: ['https://picsum.photos/200/300'],
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        likes: [],
        comments: [],
      ),
      MomentModel(
        id: '2',
        userId: '3',
        content: '分享一首歌',
        images: [],
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
        likes: [],
        comments: [],
      ),
      MomentModel(
        id: '2',
        userId: '3',
        content: '分享一首歌2',
        images: [],
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
        likes: [],
        comments: [],
      ),
      MomentModel(
        id: '2',
        userId: '3',
        content: '分享一首歌3',
        images: [],
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
        likes: [],
        comments: [],
      ),
    ];
    _updateMyMoments();
  }

  void _updateMyMoments() {
    final currentUser = Get.find<AuthService>().user;
    if (currentUser != null) {
      _myMoments.value = _moments.where((m) => m.userId == currentUser.id).toList();
    }
  }

  Future<void> publishMoment(String content, List<String> images) async {
    final currentUser = Get.find<AuthService>().user;
    if (currentUser == null) return;

    final moment = MomentModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: currentUser.id,
      content: content,
      images: images,
      createdAt: DateTime.now(),
      likes: [],
      comments: [],
    );

    // TODO: 发送到服务器
    _moments.insert(0, moment);
    _updateMyMoments();
  }

  Future<void> likeMoment(String momentId) async {
    final currentUser = Get.find<AuthService>().user;
    if (currentUser == null) return;

    final index = _moments.indexWhere((m) => m.id == momentId);
    if (index != -1) {
      final moment = _moments[index];
      final like = LikeModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userId: currentUser.id,
        createdAt: DateTime.now(),
      );

      // TODO: 发送到服务器
      _moments[index] = MomentModel(
        id: moment.id,
        userId: moment.userId,
        content: moment.content,
        images: moment.images,
        createdAt: moment.createdAt,
        likes: [...moment.likes, like],
        comments: moment.comments,
        privacy: moment.privacy,
      );
      _updateMyMoments();
    }
  }

  Future<void> commentMoment(String momentId, String content, {String? replyTo}) async {
    final currentUser = Get.find<AuthService>().user;
    if (currentUser == null) return;

    final index = _moments.indexWhere((m) => m.id == momentId);
    if (index != -1) {
      final moment = _moments[index];
      final comment = CommentModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userId: currentUser.id,
        content: content,
        createdAt: DateTime.now(),
        replyTo: replyTo,
      );

      // TODO: 发送到服务器
      _moments[index] = MomentModel(
        id: moment.id,
        userId: moment.userId,
        content: moment.content,
        images: moment.images,
        createdAt: moment.createdAt,
        likes: moment.likes,
        comments: [...moment.comments, comment],
        privacy: moment.privacy,
      );
      _updateMyMoments();
    }
  }
}
