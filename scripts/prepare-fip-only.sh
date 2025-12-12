#!/bin/bash
# 仅准备厂家FIP文件（使用通用BL2）

set -e

echo "=== 准备ZBT Z8102AX V2预构建文件（仅FIP） ==="

# 创建目录
mkdir -p prebuilt/zbt-z8102ax-v2

echo "1. 使用厂家提供的FIP文件..."
FIP_SOURCES=(
    "factory-fip/fip.bin"
    "factory-fip/bl31-uboot.fip"
    "fip.bin"
    "bl31-uboot.fip"
)

FIP_FOUND=false
for source in "${FIP_SOURCES[@]}"; do
    if [ -f "$source" ]; then
        cp "$source" prebuilt/zbt-z8102ax-v2/fip.bin
        echo "  ✓ 使用 $source"
        FIP_FOUND=true
        break
    fi
done

if [ "$FIP_FOUND" = false ]; then
    echo "  ✗ 错误：未找到厂家FIP文件"
    echo "  请将厂家FIP文件放在以下位置之一："
    echo "    - factory-fip/fip.bin"
    echo "    - factory-fip/bl31-uboot.fip"
    echo "    - fip.bin"
    echo "    - bl31-uboot.fip"
    exit 1
fi

echo ""
echo "2. 验证FIP文件..."
echo "FIP文件信息："
ls -lh prebuilt/zbt-z8102ax-v2/fip.bin
file prebuilt/zbt-z8102ax-v2/fip.bin

echo ""
echo "=== 预构建文件准备完成 ==="
echo "注意：使用OpenWrt通用BL2，无需准备单独的BL2文件"
