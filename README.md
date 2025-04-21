# 📋 My Checklist App

A simple Flutter checklist application with customizable background colors and local JSON storage.

一个用 Flutter 编写的简易清单应用，支持背景色自定义和本地 JSON 存储。

---

## 📱 Features | 功能特点

- ✔️ Add, toggle and delete tasks  
  添加、完成、删除任务  
- 🎨 Change background color in Settings  
  在设置中切换背景颜色  
- 💾 Save tasks locally as JSON  
  将任务列表以 JSON 文件形式保存在本地  

---

## 📂 Project Structure | 项目结构

```
lib/
├── main_app.dart               # App 入口和主题配置
├── task_model.dart             # Task 数据模型
├── main_navigation_screen.dart # 主页面和 Drawer 菜单
├── checklist_screen.dart       # 清单页面
├── settings_screen.dart        # 设置页面
├── widgets.dart                # 可复用控件（如果有）
```

---

## 🚀 Getting Started | 快速开始

### 1. Install dependencies | 安装依赖  
```bash
flutter pub get
```

### 2. Run the app | 运行应用  
```bash
flutter run
```

---

## 📖 Notes | 说明

- 本项目使用 `path_provider` 和 `dart:io` 实现本地 JSON 文件存储。
- 所有页面的逻辑已拆分为独立文件，便于维护和扩展。
- 如需导出 APK 或发布，可参考 Flutter 官方文档。

---

## 📌 To-Do | 后续计划

- 🔄 多主题支持  
- 📱 iOS / Web 适配  
- ☁️ 云端同步功能  

---

## 📝 License | 许可证

MIT License
