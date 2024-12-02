class Book:
    def __init__(self, title, author, year):
        self.title = title
        self.author = author
        self.year = year

class BookManager:
    def __init__(self):
        self.books = []

    def add_book(self, title, author, year):
        book = Book(title, author, year)
        self.books.append(book)
        print(f"添加图书成功：《{title}》")

    def list_books(self):
        if not self.books:
            print("图书列表为空")
            return
        print("\n当前的图书列表：")
        for i, book in enumerate(self.books):
            print(f"{i+1}. 《{book.title}》 作者：{book.author} 年份：{book.year}")

    def edit_book(self, index, title, author, year):
        if 0 <= index < len(self.books):
            self.books[index].title = title
            self.books[index].author = author
            self.books[index].year = year
            print(f"更新图书成功：《{title}》")
        else:
            print("无效的图书索引")



def main():
    manager = BookManager()
    
    while True:
        print("\n=== 图书管理系统 ===")
        print("1. 添加图书")
        print("2. 查看所有图书")
        print("3. 编辑图书")
        print("4. 删除图书")
        print("5. 退出")
        
        choice = input("\n请选择操作 (1-5): ")
        
        if choice == '1':
            title = input("请输入书名：")
            author = input("请输入作者：")
            year = input("请输入出版年份：")
            manager.add_book(title, author, year)
            
        elif choice == '2':
            manager.list_books()
            
        elif choice == '3':
            manager.list_books()
            index = int(input("请输入要编辑的图书编号（1开始）：")) - 1
            title = input("请输入新书名：")
            author = input("请输入新作者：")
            year = input("请输入新出版年份：")
            manager.edit_book(index, title, author, year)
            
        elif choice == '4':
            manager.list_books()
            index = int(input("请输入要删除的图书编号（1开始）：")) - 1
            manager.delete_book(index)
            
        elif choice == '5':
            print("感谢使用！再见！")
            break
            
        else:
            print("无效的选择，请重试")

if __name__ == "__main__":
    main() 