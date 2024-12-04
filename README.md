# Flutter WeChat with Tailwind

使用Flutter、Tailwind CSS和GetX构建的微信客户端克隆项目。

## 变更历史

### 2024-03-xx - 初始化项目
- 创建项目基础结构
- 添加必要的依赖：
  - GetX用于状态管理和导航
  - flutter_tailwind用于样式管理
  - shared_preferences用于本地存储
  - flutter_svg用于SVG图标支持
- 配置基础开发环境

## 计划功能
1. 身份验证
   - 手机号登录
   - 验证码验证
   - 用户注册

2. 消息功能
   - 私聊消息
   - 群聊消息
   - 消息通知
   - 消息搜索

3. 联系人
   - 好友列表
   - 群组列表
   - 新的朋友
   - 通讯录同步

4. 发现
   - 朋友圈
   - 扫一扫
   - 小程序
   - 游戏

5. 我的
   - 个人信息
   - 设置
   - 支付
   - 收藏

## 开发环境
- Flutter 3.19.x
- Dart 3.3.x
- Android Studio / VS Code
- Android SDK 34
- iOS SDK 17+ (用于iOS开发)
- GetX 4.6.6
- flutter_tailwind 2.3.0

## 依赖说明
- get: 状态管理和路由
- flutter_tailwind: UI样式管理
- shared_preferences: 本地数据存储
- flutter_svg: SVG图标支持
- dio: 网络请求
- cached_network_image: 图片缓存
- flutter_screenutil: 屏幕适配
- permission_handler: 权限处理
- flutter_easyloading: 加载提示
- flutter_dotenv: 环境变量管理
- logger: 日志管理
- intl: 国际化支持

## 如何运行
1. 确保已安装Flutter SDK
2. 克隆项目
3. 运行 `flutter pub get`
4. 运行 `flutter run`

## 贡献指南
欢迎提交Pull Request和Issue。

## 许可证
MIT License
