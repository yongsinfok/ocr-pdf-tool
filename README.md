# OCR PDF Tool 🔍

基于 OCRmyPDF 的简单工具，将扫描的图片 PDF 转换为可搜索的文本 PDF。

## ✨ 特点

- 📄 处理大型 PDF 文件（400+ 页，75MB+）
- 🌏 支持多语言（包括中文）
- 🚀 多核加速处理
- 💻 Windows 友好（包含 .bat 脚本）
- 🎯 保留原始图片，只添加文本层

## 🚀 快速开始

### Windows 用户

```powershell
# 1. 克隆仓库
git clone https://github.com/yongsinfok/ocr-pdf-tool.git
cd ocr-pdf-tool

# 2. 双击运行 install.bat 安装依赖
install.bat

# 3. 将你的 PDF 放到 input/ 目录

# 4. 双击运行 run_ocr.bat 开始处理
run_ocr.bat

# 5. 处理完成后，结果在 output/ 目录
```

### Linux/Mac 用户

```bash
# 1. 克隆仓库
git clone https://github.com/yongsinfok/ocr-pdf-tool.git
cd ocr-pdf-tool

# 2. 安装依赖
pip install -r requirements.txt

# 3. 将你的 PDF 放到 input/ 目录

# 4. 运行 OCR
python ocr.py

# 5. 处理完成后，结果在 output/ 目录
```

## 📁 目录结构

```
ocr-pdf-tool/
├── input/          # 放入你的 PDF 文件
├── output/         # 处理后的 PDF 输出
├── ocr.py          # 主程序
├── config.json     # 配置文件
├── install.bat     # Windows 安装脚本
├── run_ocr.bat     # Windows 运行脚本
└── requirements.txt # Python 依赖
```

## ⚙️ 配置

编辑 `config.json` 来自定义设置：

```json
{
  "language": "chi_sim",  // 语言：chi_sim=简体中文, eng=英语
  "jobs": 4,              // 使用 CPU 核心数
  "force_ocr": true,      // 强制 OCR（即使看起来已有文本）
  "quality": "high"       // 质量：low, medium, high
}
```

### 支持的语言代码

| 语言 | 代码 |
|------|------|
| 简体中文 | `chi_sim` |
| 繁体中文 | `chi_tra` |
| 英语 | `eng` |
| 日语 | `jpn` |
| 韩语 | `kor` |

## 🎯 使用示例

### 处理单个文件

```bash
python ocr.py --input input/my_document.pdf --output output/my_document_ocr.pdf
```

### 处理整个目录

```bash
python ocr.py --batch
```

### 指定语言和核心数

```bash
python ocr.py --language chi_sim --jobs 8
```

## 📊 性能提示

对于大型 PDF（400+ 页）：

- **CPU 核心**：使用 `--jobs 8` 或更高（根据你的 CPU）
- **预计时间**：5-15 分钟（取决于 CPU 性能）
- **内存**：建议至少 8GB RAM
- **磁盘空间**：确保有足够空间（输出文件可能和输入一样大）

## ⚠️ 注意事项

1. **首次运行会慢**：OCRmyPDF 会下载 Tesseract 语言数据包
2. **质量 vs 速度**：`quality: "high"` 会更慢但更准确
3. **输出格式**：输出仍是 PDF，可以复制和搜索文本
4. **原始文件**：原始文件不会被修改

## 🔧 故障排除

### 问题：找不到 Tesseract

**解决方案**：
- Windows：安装时已包含，或从 https://github.com/UB-Mannheim/tesseract/wiki 下载
- Linux：`sudo apt install tesseract-ocr`
- Mac：`brew install tesseract`

### 问题：语言包缺失

**解决方案**：
```bash
# Linux
sudo apt install tesseract-ocr-chi-sim

# Mac
brew install tesseract-lang

# Windows（自动安装）
```

### 问题：处理速度太慢

**解决方案**：
- 增加 `jobs` 数量（如 8 或 16）
- 降低 `quality` 设置
- 先用几页测试

## 📝 高级用法

### 使用命令行直接调用

```bash
# 基本 OCR
ocrmypdf input.pdf output.pdf

# 指定语言
ocrmypdf -l chi_sim input.pdf output.pdf

# 多核处理
ocrmypdf --jobs 8 -l chi_sim input.pdf output.pdf

# 强制 OCR
ocrmypdf --force-ocr -l chi_sim input.pdf output.pdf

# 跳过已有文本层
ocrmypdf --skip-text -l chi_sim input.pdf output.pdf
```

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

MIT License

## 🔗 相关链接

- [OCRmyPDF 官方文档](https://ocrmypdf.readthedocs.io/)
- [Tesseract OCR](https://github.com/tesseract-ocr/tesseract)
- [本仓库](https://github.com/yongsinfok/ocr-pdf-tool)

---

**享受可搜索的 PDF 吧！** 🎉
