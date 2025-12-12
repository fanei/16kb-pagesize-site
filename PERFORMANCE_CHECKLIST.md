# 16KB Pagesize 性能验证清单

**创建人: Fanei**

本清单用于验证网站是否符合 Google 16KB Pagesize 优化标准。

---

## ✅ 关键资源验证

### 1. HTML 文件大小
- [ ] HTML 文件（未压缩）< 16KB
- [ ] HTML 文件（Gzip 压缩后）< 16KB
- [ ] HTML 文件（Brotli 压缩后）< 16KB

**验证方法**:
```bash
# 检查文件大小
ls -lh index.html

# 使用 gzip 压缩测试
gzip -c index.html | wc -c
```

**目标**: Gzip 压缩后 < 16KB (16,384 字节)

---

### 2. 关键 CSS 验证
- [ ] 所有关键 CSS 已内联到 `<head>` 标签中
- [ ] 内联 CSS 体积 < 4KB（未压缩）
- [ ] 内联 CSS 体积 < 4KB（Gzip 压缩后）
- [ ] 没有外部 CSS 文件阻塞渲染

**验证方法**:
1. 查看页面源代码，确认 CSS 在 `<head>` 中
2. 提取 `<style>` 标签内容，检查大小
3. 使用 Chrome DevTools → Network → 禁用缓存 → 查看首次加载

---

### 3. JavaScript 验证
- [ ] JavaScript 代码体积最小化
- [ ] 使用 `defer` 或 `async` 属性加载外部脚本
- [ ] 没有阻塞渲染的同步 JavaScript
- [ ] AdSense 脚本使用异步加载

**验证方法**:
- Chrome DevTools → Network → 查看 JS 文件加载方式
- 确认 `<script>` 标签有 `async` 或 `defer` 属性

---

## 🎨 资源优化验证

### 4. 图片优化（如有）
- [ ] 所有图片使用 WebP 格式
- [ ] 图片使用 `loading="lazy"` 延迟加载
- [ ] 图片尺寸适当，未使用过大的图片
- [ ] 使用 `<picture>` 或 `srcset` 提供响应式图片

**验证方法**:
```bash
# 检查图片格式
file *.webp *.jpg *.png

# 检查图片大小
ls -lh images/
```

---

### 5. 代码压缩
- [ ] HTML 已移除不必要的空白和注释
- [ ] CSS 已压缩（去除空白、注释）
- [ ] JavaScript 已压缩（去除空白、注释）
- [ ] 所有代码已 Minify

**验证方法**:
- 使用在线工具或构建工具压缩代码
- 检查文件大小变化

---

## 🚀 性能指标验证

### 6. 首次内容绘制 (FCP)
- [ ] FCP < 1.0 秒（优秀）
- [ ] FCP < 2.5 秒（良好）

**验证工具**: Chrome DevTools → Lighthouse → Performance

---

### 7. 最大内容绘制 (LCP)
- [ ] LCP < 2.5 秒（优秀）
- [ ] LCP < 4.0 秒（良好）

**验证工具**: Chrome DevTools → Lighthouse → Performance

---

### 8. 首次输入延迟 (FID)
- [ ] FID < 100 毫秒（优秀）
- [ ] FID < 300 毫秒（良好）

**验证工具**: Chrome DevTools → Lighthouse → Performance

---

### 9. 累积布局偏移 (CLS)
- [ ] CLS < 0.1（优秀）
- [ ] CLS < 0.25（良好）

**验证工具**: Chrome DevTools → Lighthouse → Performance

---

## 🌐 网络传输验证

### 10. 总传输大小
- [ ] 关键资源（HTML + 内联 CSS）Gzip 压缩后 < 16KB
- [ ] 首次加载总资源 < 100KB（理想情况）
- [ ] 使用 Gzip 或 Brotli 压缩

**验证方法**:
1. Chrome DevTools → Network → 禁用缓存
2. 刷新页面
3. 查看 "Size" 列（显示压缩后大小）
4. 查看 "Transferred" 列（实际传输大小）

---

### 11. HTTP/2 和 HTTPS
- [ ] 网站使用 HTTPS
- [ ] 服务器支持 HTTP/2
- [ ] 没有混合内容警告

**验证方法**:
- Chrome DevTools → Network → 查看 Protocol 列
- 地址栏显示 HTTPS 锁图标

---

## 📱 响应式设计验证

### 12. 移动端优化
- [ ] 使用 Mobile-First 设计
- [ ] 视口元标签正确配置：`<meta name="viewport" content="width=device-width, initial-scale=1.0">`
- [ ] 在移动设备上测试显示正常
- [ ] 触摸目标大小 ≥ 44x44px

**验证方法**:
- Chrome DevTools → 设备工具栏 → 测试不同设备
- 实际移动设备测试

---

## 🎯 核心 Web 指标 (Core Web Vitals)

### 13. Google PageSpeed Insights
- [ ] 性能分数 ≥ 90
- [ ] 可访问性分数 ≥ 90
- [ ] 最佳实践分数 ≥ 90
- [ ] SEO 分数 ≥ 90

**验证工具**: https://pagespeed.web.dev/

---

## 🔍 代码质量验证

### 14. HTML 验证
- [ ] HTML 通过 W3C 验证器
- [ ] 使用语义化标签（`<header>`, `<main>`, `<footer>`, `<section>`）
- [ ] 所有图片有 `alt` 属性
- [ ] 所有链接有明确的 `href` 或 `aria-label`

**验证工具**: https://validator.w3.org/

---

### 15. CSS 验证
- [ ] CSS 通过 W3C 验证器
- [ ] 没有未使用的 CSS 规则
- [ ] 使用高效的 CSS 选择器

**验证工具**: https://jigsaw.w3.org/css-validator/

---

## 📊 最终检查清单

### 必须满足的核心要求
- [ ] **关键资源（HTML + 内联 CSS）Gzip 压缩后 < 16KB** ⭐ 核心指标
- [ ] 所有关键 CSS 已内联
- [ ] 没有阻塞渲染的外部资源
- [ ] 使用异步加载非关键资源
- [ ] 网站可以正常访问和交互
- [ ] AdSense 广告位正确集成（如适用）

---

## 🛠️ 推荐验证工具

1. **Chrome DevTools**
   - Network 标签：查看资源加载
   - Lighthouse 标签：性能评分
   - Performance 标签：运行时性能

2. **Google PageSpeed Insights**
   - https://pagespeed.web.dev/
   - 提供详细的性能报告和建议

3. **WebPageTest**
   - https://www.webpagetest.org/
   - 多地点、多设备测试

4. **GTmetrix**
   - https://gtmetrix.com/
   - 详细的性能分析报告

5. **命令行工具**
   ```bash
   # 检查文件大小
   ls -lh index.html
   
   # 使用 curl 检查响应头
   curl -I https://your-site.com
   
   # 使用 wget 下载并检查大小
   wget --spider --server-response https://your-site.com
   ```

---

## 📝 验证记录模板

```
验证日期: ___________
验证人: ___________

HTML 文件大小（Gzip）: _____ KB
内联 CSS 大小（Gzip）: _____ KB
总关键资源大小（Gzip）: _____ KB

PageSpeed Insights 分数: _____
Lighthouse 性能分数: _____

FCP: _____ 秒
LCP: _____ 秒
FID: _____ 毫秒
CLS: _____

是否通过 16KB Pagesize 验证: [ ] 是 [ ] 否

备注:
_______________________________________
_______________________________________
```

---

**完成所有检查项后，您的网站应该能够达到 16KB Pagesize 优化标准！** 🎉

