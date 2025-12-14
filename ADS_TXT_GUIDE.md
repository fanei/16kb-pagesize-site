# ads.txt 文件说明

**创建人: Fanei**

## 📄 什么是 ads.txt？

`ads.txt`（Authorized Digital Sellers）是 Google AdSense 要求的一个文本文件，用于声明授权销售你网站广告的发布商。这个文件可以防止未授权的广告销售，保护你的广告收入。

## 🔍 为什么需要 ads.txt？

1. **AdSense 要求**：Google AdSense 建议（在某些情况下要求）网站提供 ads.txt 文件
2. **防止欺诈**：防止未授权的第三方冒充你的网站销售广告
3. **提高收入**：确保广告收入正确归属到你的 AdSense 账号
4. **审核通过**：缺少 ads.txt 可能影响 AdSense 审核

## 📝 ads.txt 文件格式

文件内容格式：
```
google.com, pub-你的发布商ID, DIRECT, f08c47fec0942fa0
```

**格式说明**：
- `google.com`：广告销售平台（Google）
- `pub-你的发布商ID`：你的 AdSense 发布商 ID（格式：`pub-6190901558128381`）
- `DIRECT`：直接关系（表示你直接授权 Google）
- `f08c47fec0942fa0`：Google 的认证标识符（固定值）

## 📍 文件位置

`ads.txt` 文件必须放在网站的**根目录**下，可以通过以下 URL 访问：
- `https://your-domain.com/ads.txt`
- `https://your-site.netlify.app/ads.txt`
- `https://your-site.vercel.app/ads.txt`

## ✅ 已创建的文件

我已经为你创建了 `ads.txt` 文件，内容如下：
```
google.com, pub-6190901558128381, DIRECT, f08c47fec0942fa0
```

这个文件使用了你的发布商 ID：`ca-pub-6190901558128381`

## 🚀 部署步骤

1. **提交文件到 Git**：
   ```bash
   git add ads.txt
   git commit -m "Add ads.txt for AdSense authorization"
   git push
   ```

2. **验证文件可访问**：
   - 部署完成后，访问：`https://your-site.com/ads.txt`
   - 应该能看到文件内容

3. **在 AdSense 中验证**：
   - 登录 AdSense 控制台
   - Google 会自动检测 ads.txt 文件
   - 通常需要几小时到几天时间

## ⚠️ 注意事项

1. **文件必须可访问**：确保 `https://your-site.com/ads.txt` 可以正常访问
2. **格式必须正确**：文件格式必须严格按照规范，不能有多余的空格或换行
3. **发布商 ID 必须正确**：确保使用正确的发布商 ID
4. **HTTPS 要求**：文件必须通过 HTTPS 访问（Netlify/Vercel 自动提供）

## 🔍 如何验证

1. **手动检查**：
   - 访问 `https://your-site.com/ads.txt`
   - 确认能看到文件内容

2. **AdSense 检查**：
   - 登录 AdSense 控制台
   - 在"网站"设置中查看 ads.txt 状态
   - 如果显示"已找到"或"Verified"，说明配置成功

3. **第三方工具**：
   - 使用 https://adstxt.guru/ 检查 ads.txt 文件

## 📊 常见问题

### Q: ads.txt 文件找不到怎么办？
A: 确保文件在网站根目录，文件名是 `ads.txt`（小写），并且已部署到线上。

### Q: 发布商 ID 格式是什么？
A: 格式是 `pub-` 后面跟着数字，例如：`pub-6190901558128381`（注意是 `pub-` 不是 `ca-pub-`）

### Q: 可以有多个发布商吗？
A: 可以，每行一个发布商，例如：
```
google.com, pub-1234567890123456, DIRECT, f08c47fec0942fa0
another-platform.com, pub-9876543210987654, DIRECT, xxxxx
```

### Q: 文件大小有限制吗？
A: 建议保持在 1KB 以内，通常几行就够了。

---

**文件已创建，提交代码后即可生效！** ✅

