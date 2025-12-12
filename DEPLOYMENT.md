# 部署指南

**创建人: Fanei**

本指南将帮助您将 16KB Pagesize 优化与资源下载站免费部署到 Netlify 或 Vercel。

## 📋 部署前准备

1. 确保已完成 Git 初始化（运行 `./init-git.sh`）
2. 确保所有文件已提交到 Git
3. 准备一个 GitHub/GitLab/Bitbucket 账号

---

## 🌐 方式一：部署到 Netlify

### 步骤 1: 创建 GitHub 仓库

1. 在 GitHub 上创建新仓库（例如：`16kb-pagesize-site`）
2. 将本地代码推送到 GitHub：

```bash
git remote add origin https://github.com/你的用户名/16kb-pagesize-site.git
git branch -M main
git push -u origin main
```

### 步骤 2: 部署到 Netlify

1. 访问 [Netlify](https://www.netlify.com/)
2. 使用 GitHub 账号登录
3. 点击 "Add new site" → "Import an existing project"
4. 选择你的 GitHub 仓库
5. 配置部署设置：
   - **Build command**: 留空（静态网站无需构建）
   - **Publish directory**: `/` 或留空
6. 点击 "Deploy site"

### 步骤 3: 配置自定义域名（可选）

1. 在 Netlify 控制台，进入 "Domain settings"
2. 点击 "Add custom domain"
3. 按照提示配置 DNS 记录

### 步骤 4: 配置 Google AdSense

1. 在 `index.html` 中替换 `ca-pub-XXXXXXXXXXXXXXXX` 为你的 AdSense 发布商 ID
2. 替换 `data-ad-slot` 为你的实际广告位 ID
3. 提交更改并推送到 GitHub（Netlify 会自动重新部署）

---

## ⚡ 方式二：部署到 Vercel

### 步骤 1: 创建 GitHub 仓库

同 Netlify 步骤 1

### 步骤 2: 部署到 Vercel

1. 访问 [Vercel](https://vercel.com/)
2. 使用 GitHub 账号登录
3. 点击 "Add New Project"
4. 导入你的 GitHub 仓库
5. 配置项目设置：
   - **Framework Preset**: Other
   - **Root Directory**: `./`
   - **Build Command**: 留空
   - **Output Directory**: `./`
6. 点击 "Deploy"

### 步骤 3: 配置自定义域名（可选）

1. 在 Vercel 项目设置中，进入 "Domains"
2. 添加你的自定义域名
3. 按照提示配置 DNS 记录

### 步骤 4: 配置 Google AdSense

同 Netlify 步骤 4

---

## 🔧 性能优化建议

### 1. 启用 Gzip/Brotli 压缩

**Netlify**: 自动启用，无需配置

**Vercel**: 自动启用，无需配置

### 2. 配置 HTTP 缓存头

创建 `netlify.toml`（Netlify）或 `vercel.json`（Vercel）：

**Netlify (`netlify.toml`)**:
```toml
[[headers]]
  for = "/*"
  [headers.values]
    Cache-Control = "public, max-age=31536000, immutable"

[[headers]]
  for = "*.html"
  [headers.values]
    Cache-Control = "public, max-age=0, must-revalidate"
```

**Vercel (`vercel.json`)**:
```json
{
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        {
          "key": "Cache-Control",
          "value": "public, max-age=31536000, immutable"
        }
      ]
    },
    {
      "source": "/(.*).html",
      "headers": [
        {
          "key": "Cache-Control",
          "value": "public, max-age=0, must-revalidate"
        }
      ]
    }
  ]
}
```

### 3. 启用 HTTPS

Netlify 和 Vercel 都自动提供免费的 SSL 证书，无需额外配置。

---

## 📊 验证部署

部署完成后，使用以下工具验证性能：

1. **Google PageSpeed Insights**: https://pagespeed.web.dev/
2. **WebPageTest**: https://www.webpagetest.org/
3. **Lighthouse** (Chrome DevTools): 按 F12 → Lighthouse 标签

确保关键资源（HTML + 内联 CSS）在 Gzip 压缩后 < 16KB。

---

## 🐛 常见问题

### Q: 部署后页面显示空白？
A: 检查浏览器控制台错误，确保文件路径正确。

### Q: AdSense 广告不显示？
A: 
1. 确认已替换正确的 AdSense 发布商 ID 和广告位 ID
2. 等待 AdSense 审核通过（通常需要 24-48 小时）
3. 检查 AdSense 控制台中的广告单元状态

### Q: 如何更新网站内容？
A: 直接修改本地文件，提交并推送到 GitHub，Netlify/Vercel 会自动重新部署。

---

## 📝 注意事项

1. **AdSense 审核**: 新网站需要等待 Google AdSense 审核通过才能显示广告
2. **内容质量**: 确保网站内容原创且符合 AdSense 政策
3. **性能监控**: 定期使用性能工具检查网站加载速度
4. **备份**: 定期备份代码到 Git 仓库

---

**祝部署顺利！** 🎉

