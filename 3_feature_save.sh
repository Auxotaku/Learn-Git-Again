#!/bin/bash
# 开发数据持久化功能

# 同步上游仓库的更新
git fetch upstream
git checkout main
git merge upstream/main
git push origin main

# 创建功能分支
git checkout -b feature/save

# 修改代码添加保存功能
echo '
    def save_to_file(self, filename="books.txt"):
        """保存图书到文件"""
        with open(filename, "w", encoding="utf-8") as f:
            for book in self.books:
                f.write(f"{book.title},{book.author},{book.year}\n")
        print(f"图书信息已保存到 {filename}")

    def load_from_file(self, filename="books.txt"):
        """从文件加载图书"""
        try:
            with open(filename, "r", encoding="utf-8") as f:
                self.books = []
                for line in f:
                    title, author, year = line.strip().split(",")
                    self.add_book(title, author, year)
            print(f"已从 {filename} 加载图书信息")
        except FileNotFoundError:
            print("未找到保存的图书数据文件")' >> book_manager.py

# 提交更改
git add book_manager.py
git commit -m "feat: 添加数据持久化功能"

# 推送到自己的仓库
git push -u origin feature/save

echo "功能开发完成！"
echo "请访问 https://github.com/your-username/book-management"
echo "点击 'Compare & pull request' 按钮创建Pull Request"