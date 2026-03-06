@echo off
chcp 65001 > nul
echo ========================================
echo OCR PDF Tool - 处理脚本
echo ========================================
echo.

REM 检查 input 目录
if not exist "input" (
    echo 正在创建 input/ 目录...
    mkdir input
)

if not exist "output" (
    echo 正在创建 output/ 目录...
    mkdir output
)

REM 检查是否有 PDF 文件
dir /b input\*.pdf > nul 2>&1
if errorlevel 1 (
    echo ❌ 错误: input/ 目录中没有 PDF 文件
    echo.
    echo 请将你的 PDF 文件放入 input/ 目录后再运行此脚本
    echo.
    pause
    exit /b 1
)

echo 📂 找到以下 PDF 文件:
dir /b input\*.pdf
echo.

echo 配置 (可编辑 config.json 修改):
if exist "config.json" (
    type config.json
) else (
    echo 使用默认配置
)
echo.

pause
echo.
echo 🔍 开始处理...
echo.

python ocr.py --batch

echo.
echo ========================================
echo 处理完成！
echo ========================================
echo.
echo 📄 输出文件在 output/ 目录
echo.
echo 按任意键打开 output 目录...
pause > nul
explorer output
