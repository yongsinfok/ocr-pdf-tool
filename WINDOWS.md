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

### "Tesseract not found" 或 "Could not find program 'tesseract' on the PATH"

**解决方案：** 安装 Tesseract OCR

#### 步骤 1：下载 Tesseract

访问：https://github.com/UB-Mannheim/tesseract/wiki

点击 "Latest Windows installer" 下载最新的安装程序。

#### 步骤 2：安装 Tesseract

1. 运行下载的安装程序
2. **重要：** 勾选 "Install for all users"（为所有用户安装）
3. 选择安装路径（默认：`C:\Program Files\Tesseract-OCR`）

#### 步骤 3：添加到系统 PATH

1. 按 `Win + X`，选择"系统"
2. 点击"高级系统设置"
3. 点击"环境变量"
4. 在"系统变量"区域找到"Path"，点击"编辑"
5. 点击"新建"，输入：`C:\Program Files\Tesseract-OCR`
6. 点击"确定"保存所有窗口

#### 步骤 4：验证安装

**重要：** 必须重新打开 CMD 或 PowerShell 才能生效！

```cmd
tesseract --version
```

如果看到版本信息，说明安装成功。

#### 快速验证（推荐）

安装完成后，运行安装脚本：
```powershell
install.bat
```

如果显示"✅ Tesseract OCR 已安装"，说明配置成功。

### "Language data not found"

**解决方案：** OCRmyPDF 会自动下载语言包。首次运行会慢一些，请耐心等待。

## 📞 问题反馈

如果遇到其他问题，请到 GitHub 提 Issue：
https://github.com/yongsinfok/ocr-pdf-tool/issues
