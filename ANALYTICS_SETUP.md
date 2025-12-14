# 网站统计和访问量分析设置指南

**创建人: Fanei**

本指南介绍如何为 16KB Pagesize 网站添加访问统计和下载追踪功能。

---

## 📊 推荐方案对比

### 方案一：Google Analytics (GA4) ⭐ 推荐

**优点**：
- ✅ 完全免费
- ✅ 功能强大（浏览量、用户数、来源、设备等）
- ✅ 实时数据
- ✅ 支持事件追踪（可追踪下载）
- ✅ 符合 16KB Pagesize（异步加载，不阻塞渲染）

**缺点**：
- ⚠️ 需要 Google 账号
- ⚠️ 在中国大陆访问可能受限（但数据收集不受影响）

### 方案二：简单访问计数器

**优点**：
- ✅ 轻量级
- ✅ 不依赖第三方服务

**缺点**：
- ❌ 功能有限
- ❌ 需要后端支持（或使用第三方服务）

### 方案三：Netlify/Vercel 内置统计

**优点**：
- ✅ 无需额外配置
- ✅ 自动统计

**缺点**：
- ❌ 功能较基础
- ❌ 需要付费版本才有详细数据

---

## 🚀 方案一：Google Analytics (GA4) 设置

### 第一步：创建 Google Analytics 账号

1. 访问：https://analytics.google.com/
2. 使用你的 Google 账号登录
3. 点击 "开始测量" 或 "Start measuring"
4. 创建账号：
   - 账号名称：例如 "16KB Pagesize Site"
   - 点击 "下一步"
5. 创建属性：
   - 属性名称：例如 "16KB Pagesize Website"
   - 时区：选择你的时区
   - 货币：选择你的货币
   - 点击 "下一步"
6. 填写业务信息（可选）：
   - 行业类别：选择 "技术"
   - 业务规模：选择合适的大小
   - 点击 "创建"

### 第二步：获取测量 ID

1. 创建完成后，你会看到 "数据流" 设置
2. 选择 "网站"
3. 填写网站信息：
   - 网站网址：输入你的网站地址（例如：`https://your-site.netlify.app`）
   - 流名称：例如 "Main Website"
4. 点击 "创建流"
5. **复制测量 ID**（格式：`G-XXXXXXXXXX`）

### 第三步：在网站中集成 GA4

#### 方法 1：使用 gtag.js（推荐，异步加载）

在 `index.html` 的 `<head>` 标签中添加：

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

将 `G-XXXXXXXXXX` 替换为你的实际测量 ID。

#### 方法 2：使用 Google Tag Manager（更灵活）

如果需要更复杂的追踪，可以使用 GTM，但会增加一些代码量。

### 第四步：追踪下载事件

在下载按钮上添加事件追踪：

```html
<a href="downloads/file.zip" class="btn" onclick="gtag('event', 'download', {'event_category': 'Downloads', 'event_label': 'ijkplayer SO'});">Download ijkplayer 16KB SO</a>
```

或者使用 JavaScript：

```javascript
document.getElementById('downloadBtn').addEventListener('click', function() {
    gtag('event', 'download', {
        'event_category': 'Downloads',
        'event_label': 'ijkplayer SO',
        'value': 1
    });
});
```

---

## 📈 方案二：简单访问计数器

### 使用第三方服务（无需后端）

#### 1. GoatCounter（推荐，轻量级）

1. 访问：https://www.goatcounter.com/
2. 注册账号（免费）
3. 添加网站
4. 获取统计代码
5. 添加到网站 `<head>` 中

**优点**：轻量级，隐私友好，符合 GDPR

#### 2. Plausible Analytics

1. 访问：https://plausible.io/
2. 注册账号（有免费试用）
3. 添加网站
4. 获取统计代码

**优点**：隐私友好，轻量级

---

## 🔍 方案三：Netlify/Vercel 内置统计

### Netlify Analytics

1. 登录 Netlify 控制台
2. 进入你的网站项目
3. 点击 "Analytics" 标签
4. 启用 Analytics（需要付费计划）

### Vercel Analytics

1. 登录 Vercel 控制台
2. 进入你的项目
3. 在项目设置中启用 Analytics
4. 在代码中添加：

```javascript
import { Analytics } from '@vercel/analytics/react';
```

---

## 📊 查看统计数据

### Google Analytics

1. 访问：https://analytics.google.com/
2. 登录后选择你的属性
3. 查看 "报告"：
   - **实时**：当前在线用户
   - **概览**：总访问量、用户数、会话数
   - **获取**：流量来源
   - **参与度**：页面浏览量、平均会话时长
   - **转化**：事件追踪（如下载）

### 关键指标说明

- **用户数**：访问你网站的唯一用户数量
- **会话数**：用户访问会话的总数
- **页面浏览量**：页面被查看的总次数
- **平均会话时长**：用户平均停留时间
- **跳出率**：只查看一个页面就离开的会话百分比

---

## 🎯 推荐实施步骤

### 对于你的网站，我推荐：

1. **主要统计**：使用 Google Analytics (GA4)
   - 功能全面，免费
   - 可以追踪下载事件
   - 符合 16KB Pagesize（异步加载）

2. **下载追踪**：在下载按钮上添加事件追踪
   - 可以知道哪些资源被下载最多
   - 帮助优化内容

3. **实施步骤**：
   - 创建 GA4 账号并获取测量 ID
   - 在 `index.html` 中添加 GA4 代码
   - 在下载按钮上添加事件追踪
   - 等待 24-48 小时后查看数据

---

## ⚠️ 注意事项

1. **隐私政策**：如果使用 Google Analytics，需要在隐私政策中说明使用了 GA
2. **GDPR 合规**：如果面向欧盟用户，可能需要 Cookie 同意横幅
3. **性能影响**：GA4 使用异步加载，不会阻塞页面渲染
4. **数据延迟**：GA4 数据通常有 24-48 小时的延迟

---

## 🔧 快速集成模板

获取到 GA4 测量 ID 后，告诉我，我可以帮你直接集成到网站中。

**需要的信息**：
- Google Analytics 测量 ID（格式：`G-XXXXXXXXXX`）

---

**设置完成后，你就可以在 Google Analytics 控制台查看详细的访问统计了！** 📊

