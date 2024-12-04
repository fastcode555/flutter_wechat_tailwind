class SettingItemModel {
  final String title;
  final String? subtitle;
  final String? route;
  final bool isSwitch;
  final bool switchValue;
  final Function(bool)? onSwitchChanged;

  SettingItemModel({
    required this.title,
    this.subtitle,
    this.route,
    this.isSwitch = false,
    this.switchValue = false,
    this.onSwitchChanged,
  });
} 