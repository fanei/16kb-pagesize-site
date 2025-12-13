# 16KB Pagesize Optimization & Downloads

**Creator: Fanei**

A high-performance static site focused on Google's 16KB Pagesize principle. The critical payload is kept under 16KB (after Gzip) and integrates compliant AdSense ad slots.

## 📊 Performance metrics

- ✅ HTML 文件（原始）: ~7.7KB
- ✅ HTML file (raw): ~7.7KB
- ✅ HTML file (Gzip): ~3.1KB
- ✅ Critical CSS inline: < 4KB
- ✅ Meets the 16KB Pagesize target

## 🚀 Quick start

### 1. Initialize the Git repository

```bash
./init-git.sh
```

### 2. Configure AdSense (optional)

Edit `index.html` and replace:
- `ca-pub-XXXXXXXXXXXXXXXX` → your AdSense publisher ID
- `data-ad-slot="1234567890"` → your ad slot ID
- `data-ad-slot="0987654321"` → your sidebar ad slot ID

### 3. Preview locally

Open `index.html` directly, or run a local server:

```bash
# Python 3
python3 -m http.server 8000

# Node.js (需要安装 http-server)
npx http-server -p 8000
```

Then visit `http://localhost:8000` in your browser.

## 📁 Project structure

```
16kb_page_size/
├── index.html                 # Main HTML (with inline CSS)
├── init-git.sh                # Git init script
├── DEPLOYMENT.md              # Deployment guide
├── PERFORMANCE_CHECKLIST.md   # Performance checklist
└── README.md                  # Project documentation
```

## 🌐 Deployment

### Netlify

1. Push the code to GitHub
2. Import the GitHub repo in Netlify
3. Deployment settings: leave build command empty, publish directory `/`
4. Deploy

See [DEPLOYMENT.md](./DEPLOYMENT.md) for detailed steps.

### Vercel

1. Push the code to GitHub
2. Import the GitHub repo in Vercel
3. Select "Other" as the framework preset
4. Deploy

See [DEPLOYMENT.md](./DEPLOYMENT.md) for detailed steps.

## ✅ Performance validation

Use [PERFORMANCE_CHECKLIST.md](./PERFORMANCE_CHECKLIST.md) to validate performance.

Recommended tools:
- [Google PageSpeed Insights](https://pagespeed.web.dev/)
- Chrome DevTools Lighthouse
- [WebPageTest](https://www.webpagetest.org/)

## 🎯 Key features

- ✅ Semantic HTML structure
- ✅ Inline critical CSS (< 4KB)
- ✅ Responsive design (mobile-first)
- ✅ Async JavaScript loading
- ✅ Compliant Google AdSense integration
- ✅ Smooth scrolling
- ✅ Minimalist design

## 📝 Tech stack

- **HTML5**: semantic elements
- **CSS3**: inline styles, responsive layout
- **JavaScript**: vanilla JS, minimal code
- **AdSense**: async ad loading

## 🔧 Customize download links

Edit the `<a>` buttons in `index.html` and change their `href` values:
- `downloads/16kb_page_size.zip` → your actual download URL (if needed)
- `https://pub.dev/packages/td_fplayer` → your target link

## 📄 License

MIT License.

## 🤝 Contributing

Issues and pull requests are welcome.

## 📧 Contact

For questions or suggestions:
- Open a GitHub issue
- Send an email (if configured)

---

**Note**: Before deploying, make sure your AdSense publisher ID and ad slot IDs are configured correctly.

