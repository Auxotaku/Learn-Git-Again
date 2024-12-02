#!/bin/bash
# 克隆项目并设置开发环境

# Fork提示
echo "请先在GitHub上fork项目仓库"
echo "访问 https://github.com/original-owner/book-management"
echo "点击 Fork 按钮"
read -p "完成fork后按回车继续..."

# 克隆自己fork的仓库
git clone https://github.com/your-username/book-management.git
cd book-management

# 添加上游仓库
git remote add upstream https://github.com/original-owner/book-management.git

# 创建本地dev分支并关联远程dev分支
git checkout -b dev origin/dev

# 创建虚拟环境
python -m venv venv
source venv/bin/activate  # Linux/Mac
# venv\Scripts\activate  # Windows

echo "开发环境设置完成！"