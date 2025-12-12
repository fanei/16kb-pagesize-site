#!/bin/bash

# 16KB Pagesize 文件大小检查脚本
# 创建人: Fanei

echo "🔍 检查 16KB Pagesize 文件大小..."
echo ""

# 检查 index.html 是否存在
if [ ! -f "index.html" ]; then
    echo "❌ 错误: index.html 文件不存在"
    exit 1
fi

# 获取文件大小（字节）
ORIGINAL_SIZE=$(wc -c < index.html)
GZIP_SIZE=$(gzip -c index.html | wc -c)

# 转换为 KB
ORIGINAL_KB=$(echo "scale=2; $ORIGINAL_SIZE / 1024" | bc)
GZIP_KB=$(echo "scale=2; $GZIP_SIZE / 1024" | bc)

# 16KB 限制（字节）
LIMIT=16384

echo "📊 文件大小统计:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "原始大小:     $ORIGINAL_SIZE 字节 ($ORIGINAL_KB KB)"
echo "Gzip 压缩后:  $GZIP_SIZE 字节 ($GZIP_KB KB)"
echo "16KB 限制:    16384 字节 (16.00 KB)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# 检查是否符合要求
if [ $GZIP_SIZE -le $LIMIT ]; then
    echo "✅ 通过！Gzip 压缩后大小 ($GZIP_KB KB) 小于 16KB"
    REMAINING=$(echo "$LIMIT - $GZIP_SIZE" | bc)
    REMAINING_KB=$(echo "scale=2; $REMAINING / 1024" | bc)
    echo "💡 剩余空间: $REMAINING 字节 ($REMAINING_KB KB)"
    exit 0
else
    echo "❌ 失败！Gzip 压缩后大小 ($GZIP_KB KB) 超过 16KB"
    EXCEED=$(echo "$GZIP_SIZE - $LIMIT" | bc)
    EXCEED_KB=$(echo "scale=2; $EXCEED / 1024" | bc)
    echo "⚠️  超出限制: $EXCEED 字节 ($EXCEED_KB KB)"
    echo ""
    echo "💡 优化建议:"
    echo "   1. 进一步压缩 CSS"
    echo "   2. 移除不必要的 HTML 注释"
    echo "   3. 简化 JavaScript 代码"
    exit 1
fi

