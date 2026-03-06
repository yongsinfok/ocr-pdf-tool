#!/usr/bin/env python3
"""
OCR PDF Tool - 将扫描的 PDF 转换为可搜索的文本 PDF
"""

import os
import sys
import json
import argparse
from pathlib import Path
from ocrmypdf import ocr

# 读取配置
def load_config():
    config_path = Path(__file__).parent / "config.json"
    if config_path.exists():
        with open(config_path, 'r', encoding='utf-8') as f:
            return json.load(f)
    return {
        "language": "chi_sim",
        "jobs": 4,
        "force_ocr": True,
        "quality": "high",
        "deskew": True,
        "clean": True,
        "rotate_pages": True
    }

# 处理单个文件
def process_file(input_file, output_file, config):
    """处理单个 PDF 文件"""
    print(f"\n📄 正在处理: {input_file}")
    print(f"⚙️  配置: 语言={config['language']}, 核心数={config['jobs']}, 质量={config['quality']}")
    print(f"⏳ 开始处理...")

    try:
        ocr(
            input_file,
            output_file,
            language=config['language'],
            jobs=config['jobs'],
            force_ocr=config['force_ocr'],
            deskew=config['deskew'],
            clean=config['clean'],
            rotate_pages=config['rotate_pages'],
            output_type='pdf'
        )
        print(f"✅ 成功！输出: {output_file}")
        return True
    except Exception as e:
        print(f"❌ 处理失败: {e}")
        return False

# 批量处理目录
def batch_process(config):
    """批量处理 input/ 目录中的所有 PDF"""
    base_dir = Path(__file__).parent
    input_dir = base_dir / "input"
    output_dir = base_dir / "output"

    # 创建目录
    input_dir.mkdir(exist_ok=True)
    output_dir.mkdir(exist_ok=True)

    # 查找所有 PDF
    pdf_files = list(input_dir.glob("*.pdf"))

    if not pdf_files:
        print("❌ 没有在 input/ 目录找到 PDF 文件")
        return

    print(f"📂 找到 {len(pdf_files)} 个 PDF 文件")

    # 处理每个文件
    success_count = 0
    for pdf_file in pdf_files:
        output_file = output_dir / f"{pdf_file.stem}_ocr.pdf"
        if process_file(pdf_file, output_file, config):
            success_count += 1

    print(f"\n📊 处理完成: {success_count}/{len(pdf_files)} 成功")

def main():
    config = load_config()

    parser = argparse.ArgumentParser(description="OCR PDF Tool")
    parser.add_argument("--input", help="输入 PDF 文件路径")
    parser.add_argument("--output", help="输出 PDF 文件路径")
    parser.add_argument("--batch", action="store_true", help="批量处理 input/ 目录")
    parser.add_argument("--language", default=config['language'], help="OCR 语言代码 (如 chi_sim, eng)")
    parser.add_argument("--jobs", type=int, default=config['jobs'], help="使用的 CPU 核心数")
    parser.add_argument("--force-ocr", action="store_true", default=config['force_ocr'], help="强制 OCR")

    args = parser.parse_args()

    # 更新配置
    if args.language:
        config['language'] = args.language
    if args.jobs:
        config['jobs'] = args.jobs
    if args.force_ocr:
        config['force_ocr'] = True

    if args.batch:
        batch_process(config)
    elif args.input:
        if not args.output:
            output = Path(args.input).stem + "_ocr.pdf"
        else:
            output = args.output
        process_file(args.input, output, config)
    else:
        # 默认交互模式
        print("🔍 OCR PDF Tool")
        print("=" * 50)
        print("1) 批量处理 input/ 目录")
        print("2) 处理单个文件")
        print("3) 退出")

        choice = input("\n请选择 (1-3): ").strip()

        if choice == "1":
            batch_process(config)
        elif choice == "2":
            input_file = input("输入 PDF 路径: ").strip()
            output_file = input(f"输出 PDF 路径 (留空自动生成): ").strip()
            if not output_file:
                output_file = Path(input_file).stem + "_ocr.pdf"
            process_file(input_file, output_file, config)
        else:
            print("👋 再见！")

if __name__ == "__main__":
    main()
