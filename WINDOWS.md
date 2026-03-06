# Windows 用户说明

## ⚠️ 已知限制

在 Windows 上，以下功能**不可用**（因为 `unpaper` 工具不支持 Windows）：

- ❌ `clean` - 图像清理
- ❌ `deskew` - 自动矫正

这些功能在默认配置中已禁用，不影响 OCR 功能。

## ✅ 可用功能

- ✅ OCR 文字识别
- ✅ 多语言支持
- ✅ 多核加速
- ✅ 自动旋转页面
- ✅ 批量处理

## 🚀 快速开始

```powershell
# 1. 确保已更新到最新版本
cd ocr-pdf-tool
git pull

# 2. 运行处理脚本
run_ocr.bat
```

## 📝 当前配置

Windows 上的默认配置 (`config.json`)：

```json
{
  "language": "eng",
  "jobs": 4,
  "force_ocr": true,
  "quality": "high",
  "deskew": false,      // Windows 不可用
  "clean": false,      // Windows 不可用
  "rotate_pages": true
}
```

## 💡 性能优化

对于大文件（400+ 页），可以增加 CPU 核心数：

```json
{
  "jobs": 8  // 改成 8 或更多（根据你的 CPU）
}
```

## 🔧 如果遇到错误

### "The program 'unpaper' could not be executed"

**解决方案：** 这个错误已经被修复。请拉取最新版本：

```powershell
git pull
```

### "Tesseract not found"

**解决方案：** 安装 Tesseract OCR

1. 从这里下载：https://github.com/UB-Mannheim/tesseract/wiki
2. 安装时勾选 "Install for all users"
3. 将 Tesseract 安装目录（通常是 `C:\Program Files\Tesseract-OCR`）添加到系统 PATH

### "Language data not found"

**解决方案：** OCRmyPDF 会自动下载语言包。首次运行会慢一些，请耐心等待。

## 📞 问题反馈

如果遇到其他问题，请到 GitHub 提 Issue：
https://github.com/yongsinfok/ocr-pdf-tool/issues
