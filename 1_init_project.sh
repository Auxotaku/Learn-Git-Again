#!/bin/bash
# 初始化项目并创建基础分支结构

# 创建项目目录
mkdir book-management
cd book-management

# 初始化git仓库
git init

# 添加远程仓库
git remote add origin https://github.com/username/book-management.git

# 创建并提交主分支(main)
git add .
git commit -m "Initial commit: 基础项目框架"
git branch -M main
git push -u origin main

# 创建开发分支(dev)
git checkout -b dev
git push -u origin dev

echo "仓库初始化完成，已创建main和dev分支" 