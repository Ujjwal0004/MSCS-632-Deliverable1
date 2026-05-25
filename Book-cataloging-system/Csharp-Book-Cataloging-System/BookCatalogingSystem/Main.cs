using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;

namespace BookCatalogingSystem
{
    public partial class Form1 : Form
    {
        // This list stores books while the program is running.
        private List<Book> books = new List<Book>();

        // These text boxes are used to enter book information.
        private TextBox txtTitle = new TextBox();
        private TextBox txtAuthor = new TextBox();
        private TextBox txtGenre = new TextBox();
        private TextBox txtYear = new TextBox();
        private TextBox txtSearch = new TextBox();

        // This list box displays books
        private ListBox lstBooks = new ListBox();

        public Form1()
        {
            InitializeComponent();

            Text = "Book Cataloging System using C#";
            Size = new Size(800, 550);
            StartPosition = FormStartPosition.CenterScreen;

            // These labels and text boxes collect book details.
            AddLabel("Title:", 30, 30);
            AddBox(txtTitle, 150, 30);

            AddLabel("Author:", 30, 70);
            AddBox(txtAuthor, 150, 70);

            AddLabel("Genre:", 30, 110);
            AddBox(txtGenre, 150, 110);

            AddLabel("Year:", 30, 150);
            AddBox(txtYear, 150, 150);

            // Buttons to perform core requirments
            AddButton("Add Book", 420, 30, AddBook);
            AddButton("Remove Selected Book", 420, 70, RemoveBook);
            AddButton("Display All", 420, 110, ShowAllBooks);

            // Search functionality for books
            AddLabel("Search:", 30, 210);
            AddBox(txtSearch, 150, 210);

            AddButton("Search", 420, 210, SearchBooks);
            AddButton("Report by Genre", 30, 260, ReportByGenre);
            AddButton("Report by Author", 200, 260, ReportByAuthor);

            // Main display
            lstBooks.Location = new Point(30, 320);
            lstBooks.Size = new Size(700, 170);
            Controls.Add(lstBooks);
        }

        private void AddLabel(string text, int x, int y)
        {
            Label label = new Label();
            label.Text = text;
            label.Location = new Point(x, y);
            label.AutoSize = true;
            Controls.Add(label);
        }

        private void AddBox(TextBox box, int x, int y)
        {
            box.Location = new Point(x, y);
            box.Width = 220;
            Controls.Add(box);
        }

        private void AddButton(string text, int x, int y, EventHandler action)
        {
            Button button = new Button();
            button.Text = text;
            button.Location = new Point(x, y);
            button.Width = 150;
            button.Click += action;
            Controls.Add(button);
        }

        // Adds a new book to the catalog.
        private void AddBook(object? sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtTitle.Text) ||
                string.IsNullOrWhiteSpace(txtAuthor.Text) ||
                string.IsNullOrWhiteSpace(txtGenre.Text))
            {
                MessageBox.Show("Please enter title, author, and genre.");
                return;
            }

            if (!int.TryParse(txtYear.Text, out int year))
            {
                MessageBox.Show("Please enter a valid year.");
                return;
            }

            Book book = new Book(txtTitle.Text, txtAuthor.Text, txtGenre.Text, year);
            books.Add(book);

            txtTitle.Clear();
            txtAuthor.Clear();
            txtGenre.Clear();
            txtYear.Clear();

            DisplayBooks(books);
            MessageBox.Show("Entered Book added successfully.");
        }

        // Removes the selected book from the catalog.
        private void RemoveBook(object? sender, EventArgs e)
        {
            if (lstBooks.SelectedItem is Book selectedBook)
            {
                books.Remove(selectedBook);
                DisplayBooks(books);
                MessageBox.Show("Book removed successfully.");
            }
            else
            {
                MessageBox.Show("Please select a book to remove.");
            }
        }

        // Using LINQ to search books by title, author, or genre.
        private void SearchBooks(object? sender, EventArgs e)
        {
            string keyword = txtSearch.Text.ToLower();

            var results = books.Where(book =>
                book.Title.ToLower().Contains(keyword) ||
                book.Author.ToLower().Contains(keyword) ||
                book.Genre.ToLower().Contains(keyword)
            ).ToList();

            DisplayBooks(results);
        }

        // Displays all books in the catalog.
        private void ShowAllBooks(object? sender, EventArgs e)
        {
            DisplayBooks(books);
        }

        // Using LINQ to group books by genre.
        private void ReportByGenre(object? sender, EventArgs e)
        {
            lstBooks.Items.Clear();

            var report = books.GroupBy(book => book.Genre);

            foreach (var group in report)
            {
                lstBooks.Items.Add("Genre: " + group.Key);

                foreach (Book book in group)
                {
                    lstBooks.Items.Add("   " + book);
                }
            }
        }

        // Using LINQ to group books by author.
        private void ReportByAuthor(object? sender, EventArgs e)
        {
            lstBooks.Items.Clear();

            var report = books.GroupBy(book => book.Author);

            foreach (var group in report)
            {
                lstBooks.Items.Add("Author: " + group.Key);

                foreach (Book book in group)
                {
                    lstBooks.Items.Add("   " + book);
                }
            }
        }

        // Displays books in the list box.
        private void DisplayBooks(IEnumerable<Book> bookList)
        {
            lstBooks.Items.Clear();

            foreach (Book book in bookList)
            {
                lstBooks.Items.Add(book);
            }
        }
    }
}