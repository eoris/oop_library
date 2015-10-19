require_relative 'book'
require_relative 'author'
require_relative 'reader'
require_relative 'order'
require 'yaml'

# Write program that determines:
# Who often takes the books
# What is the most popular book
# How many people ordered one of the three most popular books

class Library
  attr_accessor :books, :authors, :readers, :orders

  def initialize(books=[], authors=[], readers=[], orders=[])
    @books    = books
    @authors  = authors
    @readers  = readers
    @orders   = orders
  end

  def add_book(book)
    @books << book
  end

  def add_reader(reader)
    @readers << reader
  end

  def add_order(order)
    @orders << order
  end

  def add_author(author)
    @authors << author
  end

  def often_takes_the_books
    names = @orders.map {|i| i.reader.name }
    counts = Hash.new(0)
    names.each {|name| counts[name] += 1 }
    counts.each {|reader, count| puts "One of the most active readers #{reader} ordered #{count} books" if count == counts.values.max }
  end

  def hash_with_books_count
    titles = @orders.map {|b| b.book.title }
    counts = Hash.new(0)
    titles.each {|title| counts[title] += 1 }
    counts
  end

  def most_popular_books
    hash_with_books_count.each {|title, times| puts "One of the most popular books, '#{title}', was ordered #{times} times" if times == hash_with_books_count.values.max }
  end

  def top_three_books
    top = hash_with_books_count.sort_by {|x, y| y }.reverse[0..2]
    top.map{|t| t[0]}
  end

  def people_ordered_one_of_the_three_most_popular_books
    people = Hash.new(0)
    @orders.each{|order| people[order.reader.name] += 1 if top_three_books.include?(order.book.title)}
    people.keys.count
    puts "#{people.keys.count} people ordered one of the three most popular books"
  end

  def save_to_file(file)
    File.open(file, "w"){|f| f.write self.to_yaml }
  end

  def load_from_file(file)
    @load = File.open(file){|f| YAML::load(f) }
    @books   = @load.books
    @authors = @load.authors
    @readers = @load.readers
    @orders  = @load.orders
  end

end

reader1 = Reader.new("Egor", "mail@email.com", "Dnipropetrovsk", "Gagarina str", "13")
reader2 = Reader.new("JS Denton", "bionicman@unatco.com", "NY", "Hell's Kitchen", "8")
reader3 = Reader.new("Vasya", "vasvas@gmail.com", "Kyiv", "Shevchenko str", "9")
reader4 = Reader.new("Anonymous", "anon@blacknet.com", "World", "Wide", "Web")
reader5 = Reader.new("Cooper", "bazinga@gmail.com", "Pasadena", "Paramount Comedy", "1")

hawking = Author.new("Stephen Hawking", "born 8 January 1942")
dawkins = Author.new("Richard Dawkins", "born 26 March 1941")
faynman = Author.new("Richard Feynman", "May 11, 1918 – February 15, 1988")

book1 = Book.new("A Brief History of Time", hawking)
book2 = Book.new("The Universe in a Nutshell", hawking)
book3 = Book.new("The Selfish Gene", dawkins)
book4 = Book.new("The God Delusion", dawkins)
book5 = Book.new("Surely You're Joking, Mr. Feynman!: Adventures of a Curious Character", faynman)

order1 = Order.new(book1, reader1)
order2 = Order.new(book1, reader2)
order3 = Order.new(book1, reader3)
order4 = Order.new(book4, reader2)
order5 = Order.new(book4, reader3)
order6 = Order.new(book4, reader5)
order7 = Order.new(book2, reader2)
order8 = Order.new(book3, reader2)
order9 = Order.new(book5, reader1)
order10 = Order.new(book5, reader2)
order11 = Order.new(book5, reader3)
order12 = Order.new(book5, reader5)
order13 = Order.new(book5, reader4)
order14 = Order.new(book3, reader1)
order15 = Order.new(book3, reader5)
order16 = Order.new(book2, reader5)
order17 = Order.new(book2, reader4)
order18 = Order.new(book2, reader3)
order19 = Order.new(book1, reader1)
order20 = Order.new(book1, reader5)

library = Library.new

library.add_book(book1)
library.add_book(book2)
library.add_book(book3)
library.add_book(book4)
library.add_book(book5)

library.add_reader(reader1)
library.add_reader(reader2)
library.add_reader(reader3)
library.add_reader(reader4)
library.add_reader(reader5)

library.add_author(hawking)
library.add_author(dawkins)
library.add_author(faynman)

library.add_order(order1)
library.add_order(order2)
library.add_order(order3)
library.add_order(order4)
library.add_order(order5)
library.add_order(order6)
library.add_order(order7)
library.add_order(order8)
library.add_order(order9)
library.add_order(order10)
library.add_order(order11)
library.add_order(order12)
library.add_order(order13)
library.add_order(order14)
library.add_order(order15)
library.add_order(order16)
library.add_order(order17)
library.add_order(order18)
library.add_order(order19)
library.add_order(order20)

library.often_takes_the_books
library.most_popular_books
library.people_ordered_one_of_the_three_most_popular_books