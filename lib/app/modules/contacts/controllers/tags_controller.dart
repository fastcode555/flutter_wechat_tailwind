import 'package:get/get.dart';

class TagsController extends GetxController {
  final tags = <TagModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTags();
  }

  Future<void> loadTags() async {
    await Future.delayed(const Duration(seconds: 1));
    tags.value = List.generate(
      5,
      (index) => TagModel(
        id: index.toString(),
        name: '标签 $index',
        memberCount: 10 + index,
      ),
    );
  }
}

class TagModel {
  final String id;
  final String name;
  final int memberCount;

  TagModel({
    required this.id,
    required this.name,
    required this.memberCount,
  });
} 