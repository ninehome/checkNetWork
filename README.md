# push_pic_video

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.




flutter build web --release --base-href "/flutter_web_demo/"



启用 GitHub Pages

打开你仓库的 Settings → Pages

在 Source 选择 Deploy from a branch

分支选择 main，目录选 /(root)

保存之后，GitHub 会给你一个地址：

https://你的用户名.github.io/webdemo/

4️⃣ 修复子路径问题（重点⚠️）

GitHub Pages 默认会挂在 子路径（比如 /flutter_web_demo/），
所以你打包时要加上：

flutter build web --release --base-href "/flutter_web_demo/"
