
"""Creating a GUI application for managing a book catalog by adding removing searching and reporting books.
Displaying book details dynamically in a text area and clearing entry fields automatically after each operation.
"""

require 'tk'

# Defining class for storing book details
class Book
  attr_accessor :title, :author, :genre, :year

  # Initializing book with title author genre year
  def initialize(title, author, genre, year)
    @title = title
    @author = author
    @genre = genre
    @year = year
  end
end

# Defining class to manage book catalog
class BookCatalog
  attr_accessor :books

  # Creating empty list of books
  def initialize
    @books = []
  end

  # Adding book to catalog
  def add_book(book)
    @books << book
  end

  # Removing book from catalog by title
  def remove_book(title)
    @books.delete_if { |b| b.title.downcase == title.downcase }
  end

  # Searching books by title author or genre
  def search_books(attribute, value)
    @books.select do |b|
      case attribute
      when 'title' then b.title.downcase.include?(value.downcase)
      when 'author' then b.author.downcase.include?(value.downcase)
      when 'genre' then b.genre.downcase.include?(value.downcase)
      end
    end
  end

  # Returning all books in catalog
  def all_books
    @books
  end
end

# Creating catalog object
catalog = BookCatalog.new

# Creating main GUI window
root = TkRoot.new { title "Book Cataloging System" }

# Displaying header for application
TkLabel.new(root) do
  text "BOOK CATALOGING SYSTEM"
  font TkFont.new('size' => 16, 'weight' => 'bold')
  pack { padx 10; pady 10 }
end

# Creating label and entry for book title
TkLabel.new(root) { text "Enter Book Title"; pack { padx 5; pady 2 } }
title_entry = TkEntry.new(root) { pack { padx 5; pady 2 } }

# Creating label and entry for author
TkLabel.new(root) { text "Enter Author Name"; pack { padx 5; pady 2 } }
author_entry = TkEntry.new(root) { pack { padx 5; pady 2 } }

# Creating label and entry for genre
TkLabel.new(root) { text "Enter Genre"; pack { padx 5; pady 2 } }
genre_entry = TkEntry.new(root) { pack { padx 5; pady 2 } }

# Creating label and entry for publication year
TkLabel.new(root) { text "Enter Publication Year"; pack { padx 5; pady 2 } }
year_entry = TkEntry.new(root) { pack { padx 5; pady 2 } }

# Creating text area to display output
output_text = TkText.new(root) do
  width 90
  height 15
  pack { padx 10; pady 10 }
end

# Defining method to display books in text area
def display_books(output_text, books, message = nil)
  # Clearing previous text
  output_text.delete('1.0', 'end')
  # Displaying message if provided
  output_text.insert('end', "#{message}\n") if message
  # Displaying each book with details
  books.each do |b|
    output_text.insert('end', "Title: #{b.title} | Author: #{b.author} | Genre: #{b.genre} | Year: #{b.year}\n")
  end
end

# Creating frame for buttons
button_frame = TkFrame.new(root) { pack { padx 10; pady 5 } }

# Creating Add Book button
TkButton.new(button_frame) do
  text "Add Book"
  command proc {
    # Creating new book from entries
    book = Book.new(title_entry.get, author_entry.get, genre_entry.get, year_entry.get)
    # Adding book to catalog
    catalog.add_book(book)
    # Displaying updated book list
    display_books(output_text, catalog.all_books, "BOOK ADDED SUCCESSFULLY")
    # Clearing all entry fields
    title_entry.delete(0,'end')
    author_entry.delete(0,'end')
    genre_entry.delete(0,'end')
    year_entry.delete(0,'end')
  }
  grid('row'=>0,'column'=>0,'padx'=>5,'pady'=>5)
end

# Creating Search by Title button
TkButton.new(button_frame) do
  text "Search by Title"
  command proc {
    # Searching books by title
    results = catalog.search_books('title', title_entry.get)
    # Displaying search results
    display_books(output_text, results, "SEARCH RESULTS")
    # Clearing title entry field
    title_entry.delete(0,'end')
  }
  grid('row'=>0,'column'=>1,'padx'=>5,'pady'=>5)
end

# Creating Search by Author button
TkButton.new(button_frame) do
  text "Search by Author"
  command proc {
    # Searching books by author
    results = catalog.search_books('author', author_entry.get)
    # Displaying search results
    display_books(output_text, results, "SEARCH RESULTS")
    # Clearing author entry field
    author_entry.delete(0,'end')
  }
  grid('row'=>1,'column'=>0,'padx'=>5,'pady'=>5)
end

# Creating Search by Genre button
TkButton.new(button_frame) do
  text "Search by Genre"
  command proc {
    # Searching books by genre
    results = catalog.search_books('genre', genre_entry.get)
    # Displaying search results
    display_books(output_text, results, "SEARCH RESULTS")
    # Clearing genre entry field
    genre_entry.delete(0,'end')
  }
  grid('row'=>1,'column'=>1,'padx'=>5,'pady'=>5)
end

# Creating Report by Author button
TkButton.new(button_frame) do
  text "Report By Author"
  command proc {
    # Generating report by author
    results = catalog.search_books('author', author_entry.get)
    display_books(output_text, results, "REPORT BY AUTHOR")
    # Clearing author entry field
    author_entry.delete(0,'end')
  }
  grid('row'=>2,'column'=>0,'padx'=>5,'pady'=>5)
end

# Creating Report by Genre button
TkButton.new(button_frame) do
  text "Report By Genre"
  command proc {
    # Generating report by genre
    results = catalog.search_books('genre', genre_entry.get)
    display_books(output_text, results, "REPORT BY GENRE")
    # Clearing genre entry field
    genre_entry.delete(0,'end')
  }
  grid('row'=>2,'column'=>1,'padx'=>5,'pady'=>5)
end

# Creating Display All Books button
TkButton.new(button_frame) do
  text "Display All Books"
  command proc {
    # Displaying all books
    display_books(output_text, catalog.all_books)
    # Clearing all entry fields
    title_entry.delete(0,'end')
    author_entry.delete(0,'end')
    genre_entry.delete(0,'end')
    year_entry.delete(0,'end')
  }
  grid('row'=>3,'column'=>0,'padx'=>5,'pady'=>5)
end

# Creating Remove Book button
TkButton.new(button_frame) do
  text "Remove Book"
  command proc {
    # Removing book by title
    catalog.remove_book(title_entry.get)
    # Displaying updated book list
    display_books(output_text, catalog.all_books, "BOOK REMOVED SUCCESSFULLY")
    # Clearing title entry field
    title_entry.delete(0,'end')
  }
  grid('row'=>3,'column'=>1,'padx'=>5,'pady'=>5)
end

# Running the GUI
Tk.mainloop