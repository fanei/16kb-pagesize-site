# 16KB Pagesize 优化与资源下载站

**创建人: Fanei**

一个专注于 Google 16KB Pagesize 理念的高性能静态网站。网站具有极快的加载速度，关键资源体积控制在 16KB 以下（Gzip 压缩后），并采用合规的 AdSense 广告位。

## 📊 性能指标

- ✅ HTML 文件（原始）: ~7.7KB
- ✅ HTML 文件（Gzip 压缩后）: ~3.1KB
- ✅ 关键 CSS 内联: < 4KB
- ✅ 符合 16KB Pagesize 标准

## 🚀 快速开始

### 1. 初始化 Git 仓库

```bash
./init-git.sh
```

### 2. 配置 AdSense（可选）

编辑 `index.html`，替换以下内容：
- `ca-pub-XXXXXXXXXXXXXXXX` → 你的 AdSense 发布商 ID
- `data-ad-slot="1234567890"` → 你的广告位 ID
- `data-ad-slot="0987654321"` → 你的侧边栏广告位 ID

### 3. 本地预览

直接在浏览器中打开 `index.html`，或使用本地服务器：

```bash
# Python 3
python3 -m http.server 8000

# Node.js (需要安装 http-server)
npx http-server -p 8000
```

然后在浏览器访问 `http://localhost:8000`

## 📁 项目结构

```
16kb_page_size/
├── index.html              # 主 HTML 文件（包含内联 CSS）
├── init-git.sh            # Git 初始化脚本
├── DEPLOYMENT.md          # 部署指南
├── PERFORMANCE_CHECKLIST.md  # 性能验证清单
└── README.md              # 项目说明文档
```

## 🌐 部署

### Netlify

1. 将代码推送到 GitHub
2. 在 Netlify 导入 GitHub 仓库
3. 部署设置：构建命令留空，发布目录为 `/`
4. 点击部署

详细步骤请参考 [DEPLOYMENT.md](./DEPLOYMENT.md)

### Vercel

1. 将代码推送到 GitHub
2. 在 Vercel 导入 GitHub 仓库
3. 框架预设选择 "Other"
4. 点击部署

详细步骤请参考 [DEPLOYMENT.md](./DEPLOYMENT.md)

## ✅ 性能验证

使用 [PERFORMANCE_CHECKLIST.md](./PERFORMANCE_CHECKLIST.md) 中的清单验证网站性能。

推荐验证工具：
- [Google PageSpeed Insights](https://pagespeed.web.dev/)
- Chrome DevTools Lighthouse
- [WebPageTest](https://www.webpagetest.org/)

## 🎯 核心特性

- ✅ 语义化 HTML 结构
- ✅ 内联关键 CSS（< 4KB）
- ✅ 响应式设计（Mobile-First）
- ✅ 异步加载 JavaScript
- ✅ Google AdSense 合规集成
- ✅ 平滑滚动效果
- ✅ 极简主义设计风格

## 📝 技术栈

- **HTML5**: 语义化标签
- **CSS3**: 内联样式，响应式布局
- **JavaScript**: 原生 JS，最小化代码
- **AdSense**: 异步广告加载

## 🔧 自定义下载链接

编辑 `index.html` 中的下载按钮，修改以下部分：

```javascript
document.getElementById('ijkplayerBtn').addEventListener('click', function(e) {
    e.preventDefault();
    // 替换为实际下载链接
    window.location.href = 'https://your-download-link.com/ijkplayer.so';
});

document.getElementById('flutterBtn').addEventListener('click', function(e) {
    e.preventDefault();
    // 替换为实际下载链接
    window.location.href = 'https://your-download-link.com/flutter-resources';
});
```

## 📄 许可证

本项目采用 MIT 许可证。

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📧 联系方式

如有问题或建议，请通过以下方式联系：
- 创建 GitHub Issue
- 发送邮件（如已配置）

---

**注意**: 部署前请确保已配置正确的 AdSense 发布商 ID 和广告位 ID。

