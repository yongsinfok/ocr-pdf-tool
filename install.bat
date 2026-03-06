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

REM 检查 Tesseract
tesseract --version > nul 2>&1
if errorlevel 1 (
    echo.
    echo ⚠️  警告: 未找到 Tesseract OCR
    echo.
    echo Tesseract OCR 是必须的核心依赖
    echo.
    echo 请按以下步骤安装:
    echo 1. 访问 https://github.com/UB-Mannheim/tesseract/wiki
    echo 2. 下载最新的 Tesseract for Windows 安装程序
    echo 3. 运行安装程序，勾选 "Install for all users"
    echo 4. 安装完成后，将 Tesseract 添加到系统 PATH
    echo    通常路径为: C:\Program Files\Tesseract-OCR
    echo.
    echo 添加 PATH 的方法:
    echo 1. 右键 "此电脑" -^> 属性 -^> 高级系统设置
    echo 2. 环境变量 -^> 系统变量 -^> Path -^> 编辑
    echo 3. 新建，添加: C:\Program Files\Tesseract-OCR
    echo.
    echo 安装完成后，重新运行此脚本
    pause
    exit /b 1
)

echo ✅ Tesseract OCR 已安装
tesseract --version | findstr "tesseract"
echo.

REM 升级 pip
echo 📦 正在升级 pip...
python -m pip install --upgrade pip
echo.

REM 安装依赖
echo 📦 正在安装 Python 依赖...
pip install -r requirements.txt
if errorlevel 1 (
    echo.
    echo ❌ 依赖安装失败，请检查错误信息
    pause
    exit /b 1
)

echo.
echo ========================================
echo ✅ 安装完成！
echo ========================================
echo.
echo 接下来的步骤:
echo 1. 将你的 PDF 文件放入 input/ 目录
echo 2. 运行 run_ocr.bat 开始处理
echo 3. 处理结果会保存在 output/ 目录
echo.
pause
