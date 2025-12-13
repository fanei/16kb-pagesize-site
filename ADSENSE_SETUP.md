# Google AdSense 配置详细指南

**创建人: Fanei**

本指南将详细说明如何为 16KB Pagesize 网站配置 Google AdSense 广告。

---

## 📋 前置条件

在开始之前，请确保：

1. ✅ 网站已经部署上线（Netlify 或 Vercel）
2. ✅ 网站有实际内容（不是空白页面）
3. ✅ 网站有隐私政策页面（我们已经创建了 `privacy.html`）
4. ✅ 网站可以正常访问（有 HTTPS）
5. ✅ 你有一个 Google 账号

---

## 🚀 第一步：申请 Google AdSense 账号

### 1.1 访问 AdSense 官网

1. 打开浏览器，访问：https://www.google.com/adsense/
2. 点击右上角的 **"开始使用"** 或 **"Get Started"** 按钮
3. 使用你的 Google 账号登录（如果没有账号，先注册一个）

### 1.2 填写网站信息

1. **网站 URL**：输入你部署好的网站地址
   - 例如：`https://your-site.netlify.app` 或 `https://your-site.vercel.app`
   
2. **国家/地区**：选择你的国家（例如：中国）

3. **付款信息**（可选，可以稍后填写）：
   - 如果你在中国大陆，AdSense 可能无法直接申请，需要：
     - 使用海外 Google 账号
     - 或者使用其他广告平台（如百度联盟）

### 1.3 提交申请

1. 阅读并同意 AdSense 计划政策
2. 点击 **"创建账号"** 或 **"Create Account"**
3. 等待 Google 审核（通常需要 1-7 天，有时更长）

### 1.4 审核期间需要做什么

在等待审核期间，确保你的网站：

- ✅ 有原创、有价值的内容
- ✅ 有隐私政策页面（我们已经有了）
- ✅ 网站可以正常访问
- ✅ 没有违反 AdSense 政策的内容（如色情、暴力、赌博等）

---

## ✅ 第二步：获取 AdSense 发布商 ID

### 2.1 登录 AdSense 控制台

1. 审核通过后，访问：https://www.google.com/adsense/
2. 使用你的 Google 账号登录
3. 进入 AdSense 控制台

### 2.2 找到你的发布商 ID

1. 在 AdSense 控制台首页，你会看到类似这样的信息：
   ```
   发布商 ID: ca-pub-1234567890123456
   ```
   或者
   ```
   Publisher ID: ca-pub-1234567890123456
   ```

2. **复制这个 ID**，格式通常是：`ca-pub-` 后面跟着一串数字

   ⚠️ **重要**：这个 ID 是唯一的，不要泄露给他人

---

## 📍 第三步：创建广告单元

### 3.1 创建第一个广告单元（Header 广告）

1. 在 AdSense 控制台，点击左侧菜单的 **"广告"** 或 **"Ads"**
2. 点击 **"按广告单元"** 或 **"By ad unit"**
3. 点击 **"创建广告单元"** 或 **"Create ad unit"**

4. **填写广告单元信息**：
   - **名称**：例如 `Header Ad` 或 `顶部广告`
   - **广告格式**：选择 **"展示广告"** 或 **"Display ads"**
   - **广告尺寸**：选择 **"响应式"** 或 **"Responsive"**（推荐）
   - 点击 **"创建"** 或 **"Create"**

5. **获取广告代码**：
   - 创建成功后，你会看到一段代码，类似这样：
   ```html
   <ins class="adsbygoogle"
        style="display:block"
        data-ad-client="ca-pub-1234567890123456"
        data-ad-slot="1234567890"
        data-ad-format="auto"
        data-full-width-responsive="true"></ins>
   <script>
        (adsbygoogle = window.adsbygoogle || []).push({});
   </script>
   ```

6. **记录以下信息**：
   - `data-ad-client` 的值：`ca-pub-1234567890123456`（这就是你的发布商 ID）
   - `data-ad-slot` 的值：`1234567890`（这是广告位 ID）

### 3.2 创建第二个广告单元（Sidebar 广告）

1. 重复上面的步骤，创建第二个广告单元
2. **名称**：例如 `Sidebar Ad` 或 `侧边栏广告`
3. **记录第二个广告位的 `data-ad-slot` 值**

---

## 🔧 第四步：在网站中集成 AdSense 代码

### 4.1 编辑 index.html 文件

打开 `index.html` 文件，找到以下位置并替换：

#### 位置 1：AdSense 脚本（在 `</body>` 标签之前）

**找到这段代码**：
```html
<!-- Google AdSense Script -->
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-XXXXXXXXXXXXXXXX" crossorigin="anonymous"></script>
```

**替换为**：
```html
<!-- Google AdSense Script -->
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-你的发布商ID" crossorigin="anonymous"></script>
```

将 `ca-pub-你的发布商ID` 替换为你实际的发布商 ID（例如：`ca-pub-1234567890123456`）

#### 位置 2：Header 广告位（在 `<main>` 标签内）

**找到这段代码**：
```html
<!-- AdSense Header Ad -->
<div class="ads-container">
    <ins class="adsbygoogle" style="display:block" data-ad-client="ca-pub-XXXXXXXXXXXXXXXX" data-ad-slot="1234567890" data-ad-format="auto" data-full-width-responsive="true"></ins>
</div>
```

**替换为**：
```html
<!-- AdSense Header Ad -->
<div class="ads-container">
    <ins class="adsbygoogle" style="display:block" data-ad-client="ca-pub-你的发布商ID" data-ad-slot="你的第一个广告位ID" data-ad-format="auto" data-full-width-responsive="true"></ins>
</div>
```

#### 位置 3：Sidebar 广告位（在侧边栏）

**找到这段代码**：
```html
<aside class="sidebar">
    <div class="ads-container">
        <ins class="adsbygoogle" style="display:block" data-ad-client="ca-pub-XXXXXXXXXXXXXXXX" data-ad-slot="0987654321" data-ad-format="auto" data-full-width-responsive="true"></ins>
    </div>
</aside>
```

**替换为**：
```html
<aside class="sidebar">
    <div class="ads-container">
        <ins class="adsbygoogle" style="display:block" data-ad-client="ca-pub-你的发布商ID" data-ad-slot="你的第二个广告位ID" data-ad-format="auto" data-full-width-responsive="true"></ins>
    </div>
</aside>
```

#### 位置 4：AdSense 初始化脚本（在 `</body>` 标签之前）

**找到这段代码**：
```html
<script>
    (adsbygoogle = window.adsbygoogle || []).push({});
    (adsbygoogle = window.adsbygoogle || []).push({});
</script>
```

这段代码不需要修改，它会自动初始化所有广告位。

### 4.2 完整示例

替换完成后的代码应该是这样的：

```html
<!-- Google AdSense Script -->
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-1234567890123456" crossorigin="anonymous"></script>

<!-- 在页面中的广告位 -->
<ins class="adsbygoogle" 
     style="display:block" 
     data-ad-client="ca-pub-1234567890123456" 
     data-ad-slot="1234567890" 
     data-ad-format="auto" 
     data-full-width-responsive="true"></ins>

<!-- 初始化脚本 -->
<script>
    (adsbygoogle = window.adsbygoogle || []).push({});
</script>
```

---

## 🧪 第五步：测试和验证

### 5.1 本地测试

1. 保存 `index.html` 文件
2. 在浏览器中打开 `index.html`（或刷新本地服务器页面）
3. 打开浏览器开发者工具（按 F12）
4. 查看 Console（控制台）标签，检查是否有错误

### 5.2 部署到线上

1. 提交代码到 Git：
   ```bash
   git add index.html
   git commit -m "配置 AdSense 广告"
   git push
   ```

2. 等待 Netlify/Vercel 自动部署完成（通常 1-2 分钟）

3. 访问你的网站，检查广告是否显示

### 5.3 验证广告显示

**正常情况**：
- 广告位会显示 Google 广告内容
- 或者显示占位符（如果还在审核中）

**如果看不到广告**：
- 等待 24-48 小时（Google 需要时间审核和匹配广告）
- 检查浏览器控制台是否有错误
- 确认 AdSense 账号已通过审核
- 确认广告代码中的 ID 是否正确

---

## 📊 第六步：在 AdSense 控制台查看数据

1. 登录 AdSense 控制台
2. 点击左侧菜单的 **"报告"** 或 **"Reports"**
3. 你可以看到：
   - 广告展示次数
   - 点击次数
   - 收入（需要达到最低支付金额才会显示）

---

## ⚠️ 重要注意事项

### 1. AdSense 政策遵守

**严禁以下行为**：
- ❌ 点击自己的广告（会被封号）
- ❌ 要求他人点击广告
- ❌ 在广告附近放置误导性内容
- ❌ 使用自动化工具点击广告
- ❌ 在不符合政策的网站上放置广告

### 2. 收入说明

- AdSense 收入取决于多个因素：网站流量、广告点击率、广告单价等
- 需要达到最低支付金额（通常是 $100）才能收款
- 收入不是立即到账的，有结算周期

### 3. 中国大陆用户特别说明

如果你在中国大陆：
- Google AdSense 可能无法直接申请
- 可以考虑：
  - 使用海外 Google 账号
  - 使用 VPN（但需注意合规性）
  - 使用其他广告平台（如百度联盟、搜狗联盟等）

---

## 🐛 常见问题解答

### Q1: 申请被拒绝了怎么办？

**A**: 
- 检查网站内容是否原创、有价值
- 确保有隐私政策页面
- 确保网站可以正常访问
- 等待一段时间后重新申请

### Q2: 广告不显示怎么办？

**A**: 
- 检查广告代码是否正确
- 确认 AdSense 账号已通过审核
- 等待 24-48 小时（Google 需要时间匹配广告）
- 检查浏览器控制台是否有错误

### Q3: 如何知道广告代码是否正确？

**A**: 
- 检查 `data-ad-client` 是否是你的发布商 ID
- 检查 `data-ad-slot` 是否是正确的广告位 ID
- 检查 AdSense 脚本 URL 中的 `client` 参数是否正确

### Q4: 可以修改广告样式吗？

**A**: 
- 可以调整广告容器的 CSS 样式
- 但不要修改 AdSense 提供的 HTML 代码结构
- 不要隐藏或遮挡广告

### Q5: 一个网站可以放多个广告吗？

**A**: 
- 可以，但不要超过 AdSense 政策允许的数量
- 通常建议：每页 3-5 个广告位
- 我们的网站目前有 2 个广告位，符合政策

---

## 📝 配置检查清单

完成配置后，请检查：

- [ ] AdSense 账号已申请并通过审核
- [ ] 已获取发布商 ID（格式：`ca-pub-xxxxxxxxxxxxxx`）
- [ ] 已创建至少 2 个广告单元
- [ ] 已获取广告位 ID（格式：数字）
- [ ] 已替换 `index.html` 中的所有占位符
- [ ] 已提交代码并部署到线上
- [ ] 网站可以正常访问
- [ ] 广告位显示正常（或显示占位符）

---

## 🎯 快速配置模板

如果你已经获取了 AdSense ID，可以直接使用以下模板替换：

**发布商 ID**: `ca-pub-你的发布商ID`
**第一个广告位 ID**: `你的第一个广告位ID`
**第二个广告位 ID**: `你的第二个广告位ID`

在 `index.html` 中全局替换：
- `ca-pub-XXXXXXXXXXXXXXXX` → `ca-pub-你的发布商ID`
- `1234567890` → `你的第一个广告位ID`
- `0987654321` → `你的第二个广告位ID`

---

**配置完成后，记得提交代码并推送到 GitHub，让网站自动重新部署！** 🚀

如有问题，可以参考：
- [Google AdSense 帮助中心](https://support.google.com/adsense/)
- [AdSense 政策中心](https://support.google.com/adsense/answer/48182)

