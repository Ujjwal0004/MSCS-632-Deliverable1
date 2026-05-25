# MSCS-632-Deliverable1

# Book Cataloging System in C# and Ruby

## Team Members - Group 7

- Ujjwal Khadka
- Prasanthi Pakalapati

## Course

Advanced Programming Languages (MSCS-632)

## Project Overview

This project provides a GUI-based implementation of Book Cataloging System developed in two different programming languages:

- C#
- Ruby

### Application Overview

The Book Cataloging System is a GUI-based application used to manage a catalog of books. The application allows users to add, remove, search, and report books using different book attributes such as title, author, and genre.

### Core Requirements

The project must include the following requirements:

- Storage for book details
- Book title
- Book author
- Book genre
- Publication year
- Search functionality for finding books by title, author, or genre
- Simple reporting function to display books by genre or author

## Core Features

The following features are implemented in both C# and Ruby versions:

- Add a book to the catalog
- Remove a book from the catalog
- Search books by title
- Search books by author
- Search books by genre
- Display all books
- Generate a report by author
- Generate a report by genre
- Store book details using custom classes

Each book contains:
- Title
- Author
- Genre
- Publication Year

## Project Structure

```text
Book-cataloging-system/
│
├── Csharp-Book-Cataloging-System/
│   ├── BookCatalogingSystem.sln
│   ├── BookCatalogingSystem/
│   │   ├── Book.cs
│   │   ├── Main.cs
│   │   ├── Main.Designer.cs
│   │   ├── Main.resx
│   │   ├── Program.cs
│   │   └── BookCatalogingSystem.csproj
│
├── Ruby-Book-Cataloging-System/
│   └── catalog.rb
│
└── README.md
```

## C# Implementation

### Language-Specific Features Used

#### Classes and Objects

The C# version uses a Book class to store book information such as title, author, genre, and publication year.

#### List Collection

A List<Book> is used to store multiple book records while the application is running.

#### LINQ

LINQ is used to search and filter books by title, author, or genre. LINQ is also used to group books for reports by author or genre.

#### Windows Forms GUI

The C# version uses Windows Forms to create a graphical user interface with text boxes, buttons, and a list box.

### Ruby Implementation

### Language-Specific Features Used

#### Classes and Objects

The Ruby version uses a Book class to store book details and a BookCatalog class to manage the collection of books.

#### Arrays

Ruby arrays are used to store the book catalog. New books are added to the array, and books can be removed or searched from the array.

#### Blocks

Ruby blocks are used with methods such as select and delete_if to search and remove books. This shows Ruby’s functional-style iteration.

#### Tk GUI

The Ruby version uses the Tk library to create a graphical user interface. The GUI includes entry fields, buttons, and a text area for displaying output.

#### Dynamic Typing

Ruby uses dynamic typing, so variables do not need explicit type declarations.

## How to Run the C# Program

### Step 1

Install Visual Studio.

Recommended workload is .NET desktop development

### Step 2

Open the C# project folder.

### Step 3

Double-click the solution file named:
BookCatalogingSystem.sln

### Step 4

Wait for Visual Studio to load the project.

### Step 5

Click the green Start button in Visual Studio to run the program.

## How to Run the Ruby Program

### Step 1

Install Ruby:
You can use the following link to install Ruby:
https://www.ruby-lang.org/en/downloads/

### Step 2

Make sure Tk is available for Ruby because the Ruby application uses the Tk GUI library.

### Step 3

Open terminal inside the Ruby project folder.

### Step 4

Run the Ruby program using the following code:
ruby catalog.rb

## How to Use the Application

The user can enter book details into the input fields:

- Title
- Author
- Genre
- Publication Year

After entering the book information, the user can click:

- **Add Book** to add a book
- **Remove Book** or **Remove Selected** to remove a book
- **Search** to search by title, author, or genre
- **Display All Books** to show all books
- **Report by Author** to display books by author
- **Report by Genre** to display books by genre
