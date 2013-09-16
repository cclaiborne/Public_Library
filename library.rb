
class Library
  def initialize()
    @shelves = Array.new
  end
  def add_shelf_to_library(shelf)
    @shelves.push(shelf)
  end
  def get_shelves
    @shelves
  end
  def report_all_books
    puts "All books contained in library:"
    puts $all_books
  end
  def get_shelf_count
     puts "Number of shelves in library: " + $shelf_count.to_s
  end
end

$shelf_count = 0
class Shelf
##get number of books
  def initialize(shelf_number)
    @num = shelf_number
    @books = Array.new
    $shelf_count += 1
  end
  def get_books
  puts "Books contained on shelf [" + self.get_shelf_number.to_s + "]:"
  @books.each { |a|
      print "[" + a.get_book_name + "] "
    }
    puts ""
  end
  def get_shelf_number
    @num
  end
  def add_book_to_shelf(book)
    @books.push(book)
  end
  def remove_book_from_shelf()
   @books.pop()
  end
end


$all_books = ""
class Book
  def initialize(name)
    @book_name = name
    $all_books += "[" + @book_name + "] "
  end
  def get_book_name
    @book_name
  end
  def enshelf(shelf)
    shelf.add_book_to_shelf(self)
  end
  def unshelf(shelf)
    shelf.remove_book_from_shelf()
  end
end

$lib = Library.new()
s1 = Shelf.new(1)
s2 = Shelf.new(2)
s3 = Shelf.new(3)
$lib.add_shelf_to_library(s1)
$lib.add_shelf_to_library(s2)
$lib.add_shelf_to_library(s3)
b1 = Book.new("Moby Dick")
b2 = Book.new("The Adventures of Huckleberry Finn")
b3 = Book.new("Bartleby the Scrivener")
b1.enshelf(s1)
b2.enshelf(s2)
b3.enshelf(s2)
$lib.get_shelf_count
s1.get_books
s2.get_books
puts "*Unshelving Bartleby the Scrivener*"
b2.unshelf(s2)
s2.get_books
$lib.report_all_books






