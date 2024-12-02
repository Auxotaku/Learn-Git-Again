#!/bin/bash
# 开发搜索功能

# 确保dev分支是最新的
git checkout dev
git fetch upstream
git merge upstream/dev
git push origin dev

# 从dev分支创建功能分支
git checkout -b feature/search

# 修改代码添加搜索功能
echo '
    def search_books(self, keyword):
        """搜索图书功能"""
        results = []
        for book in self.books:
            if (keyword.lower() in book.title.lower() or 
                keyword.lower() in book.author.lower()):
                results.append(book)
        
        if not results:
            print(f"未找到包含关键词 {keyword} 的图书")
            return
        
        print(f"\n搜索结果：")
        for i, book in enumerate(results):
            print(f"{i+1}. 《{book.title}》 作者：{book.author} 年份：{book.year}")' >> book_manager.py

# 提交更改
git add book_manager.py
git commit -m "feat: 添加图书搜索功能"

# 推送功能分支
git push -u origin feature/search

echo "功能开发完成！"
echo "请访问 https://github.com/your-username/book-management"
echo "创建从feature/search到dev分支的Pull Request"