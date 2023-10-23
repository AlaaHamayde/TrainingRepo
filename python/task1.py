import csv
found_books = []
def display_books(filename):
    with open(filename, 'r') as file:
        reader = csv.reader(file)
        for row in reader:
            print(row)
    print("\n\n\n")

def search_by_author(filename):
        with open(filename, 'r') as file:
         reader = csv.reader(file)
         author_name = input("Enter the author's name: ")
        
         for row in reader:
            
            if row and row[1] == author_name:
                found_books.append(row)

         for book in found_books:
            print(f"{book[0]}, {book[1]}\n\n\n\n")
while True:
 print("1 for display all books")
 print("2 for search for a book")
 print("3 for close the program")
 csv_filename = "books.csv"
 option  = input("1/2/3\n")
 print(option)
 if option == "1":
    display_books(csv_filename)
 elif option == "2":
    search_by_author(csv_filename)
 elif option == "3":
    break
 else:
     print("invalid option")

