#!/bin/bash

# Git 初始化脚本
# 创建人: Fanei

echo "🚀 初始化 Git 仓库..."

# 检查是否已存在 .git 目录
if [ -d ".git" ]; then
    echo "⚠️  Git 仓库已存在，跳过初始化"
else
    git init
    echo "✅ Git 仓库初始化完成"
fi

# 创建 .gitignore 文件（如果不存在）
if [ ! -f ".gitignore" ]; then
    cat > .gitignore << EOF
# 系统文件
.DS_Store
Thumbs.db

# 编辑器
.vscode/
.idea/
*.swp
*.swo
*~

# 日志文件
*.log

# 临时文件
*.tmp
*.temp
EOF
    echo "✅ 创建 .gitignore 文件"
fi

# 检查 index.html 是否存在
if [ ! -f "index.html" ]; then
    echo "⚠️  警告: index.html 文件不存在"
else
    echo "✅ 找到 index.html 文件"
fi

# 添加文件到 Git
echo "📦 添加文件到 Git..."
git add .

# 检查是否有变更
if git diff --staged --quiet; then
    echo "ℹ️  没有变更需要提交"
else
    # 首次提交
    git commit -m "Initial commit: 16KB Pagesize 优化与资源下载站

- 创建高性能单页 HTML 文件
- 内联关键 CSS（体积 < 4KB）
- 集成 Google AdSense 广告位
- 实现响应式设计和移动端优先布局
- 添加 16KB Pagesize 介绍内容
- 实现资源下载功能

创建人: Fanei"
    echo "✅ 首次提交完成"
fi

echo ""
echo "📊 Git 状态:"
git status

echo ""
echo "✨ 初始化完成！"
echo "💡 提示: 使用 'git remote add origin <your-repo-url>' 添加远程仓库"
echo "💡 提示: 使用 'git push -u origin main' 推送到远程仓库"

