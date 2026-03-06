@echo off
chcp 65001 > nul
echo ========================================
echo OCR PDF Tool - 安装脚本
echo ========================================
echo.

REM 检查 Python 是否安装
python --version > nul 2>&1
if errorlevel 1 (
    echo ❌ 错误: 未找到 Python
    echo 请从 https://www.python.org/downloads/ 下载并安装 Python
    pause
    exit /b 1
)

echo ✅ Python 已安装
python --version
echo.

REM 升级 pip
echo 📦 正在升级 pip...
python -m pip install --upgrade pip
echo.

REM 安装依赖
echo 📦 正在安装依赖...
pip install -r requirements.txt
if errorlevel 1 (
    echo.
    echo ❌ 依赖安装失败，请检查错误信息
    pause
    exit /b 1
)

echo.
echo ✅ 安装完成！
echo.
echo 接下来的步骤:
echo 1. 将你的 PDF 文件放入 input/ 目录
echo 2. 运行 run_ocr.bat 开始处理
echo 3. 处理结果会保存在 output/ 目录
echo.
pause
