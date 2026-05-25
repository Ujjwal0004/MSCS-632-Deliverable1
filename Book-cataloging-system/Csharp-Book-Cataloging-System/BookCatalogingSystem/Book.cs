namespace BookCatalogingSystem
{
    // This class stores book information
    public class Book
    {
        public string Title { get; set; }
        public string Author { get; set; }
        public string Genre { get; set; }
        public int PublicationYear { get; set; }

        public Book(string title, string author, string genre, int publicationYear)
        {
            Title = title;
            Author = author;
            Genre = genre;
            PublicationYear = publicationYear;
        }

        // Shows the book information in the list box.
        public override string ToString()
        {
            return $"{Title} | {Author} | {Genre} | {PublicationYear}";
        }
    }
}