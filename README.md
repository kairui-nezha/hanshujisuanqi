# Made with love by Gemini3 Pro GPT-4o GPT-5.2-Codex

#  ~~感谢Google和OpenAI对本项目的大力支持~~

# 🧮 Flutter 跨平台科学函数计算器

![Flutter](https://img.shields.io/badge/Flutter-3.0%2B-blue?logo=flutter)
![Platform](https://img.shields.io/badge/平台-Android%20|%20Windows-lightgrey)
![构建状态](https://github.com/kairui-nezha/hanshujisuanqiactions/workflows/release.yml/badge.svg)
![License](https://img.shields.io/badge/许可证-MIT-green)

这是一个使用 **Flutter** 构建的现代化、响应式科学计算器应用。
专为 **Android (移动端)** 和 **Windows (桌面端)** 设计，内置强大的数学表达式解析引擎和实时函数绘图功能。

---

## ✨ 功能特性

- **📱 自适应 UI 设计**:
  - **Android**: 优化的竖屏布局，适合单手操作。
  - **Windows**: 扩展的横屏布局，充分利用宽屏空间展示完整键盘。
- **🔢 科学计算能力**:
  - 支持基础运算及 `sin`, `cos`, `tan` (角度制), `log`, `ln`, `^`, `√` 等函数。
  - 支持复杂表达式解析 (例如: `2 * sin(30) + 5^2`)。
  - 支持括号 `()` 运算及光标编辑历史输入。
- **📈 函数绘图功能**:
  - 输入带 `x` 的公式即可生成图像 (例如: `x^2 - 4`, `sin(x)`).
  - 基于 `fl_chart` 实现的交互式图表。
- **🚀 集成 CI/CD 自动化**:
  - 通过 GitHub Actions 自动构建 Android APK 和 Windows EXE。
  - 推送 `v*` 标签时自动发布 Release 版本。
---

## 🛠️ 技术栈

- **框架**: [Flutter](https://flutter.dev/) (Dart)
- **状态管理**: [flutter_riverpod](https://pub.dev/packages/flutter_riverpod)
- **数学引擎**: [math_expressions](https://pub.dev/packages/math_expressions)
- **图表库**: [fl_chart](https://pub.dev/packages/fl_chart)
- **CI/CD**: GitHub Actions

---

## 📥 下载安装

请前往 [**Releases (发布页)**](https://github.com/kairui-nezha/hanshujisuanqi/releases) 下载最新编译好的安装包：
- 🤖 **Android**: `calculator-android.apk`
- 💻 **Windows**: `calculator-windows.zip` (解压后运行 `.exe` 文件)

---

## 🚀 快速开始 (开发者)

### 环境要求
- Flutter SDK (>= 3.0.0)
- **Windows 开发**: Visual Studio 2022 (需勾选 "C++ 桌面开发" 组件)
- **Android 开发**: Android Studio & SDK

### 安装步骤

1. **克隆仓库**
   ```bash
   git clone [https://github.com/kairui-nezha/hanshujisuanqi.git](https://github.com/kairui-nezha/hanshujisuanqi.git)
   cd scientific_calculator
