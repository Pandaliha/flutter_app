class Book {
  final String title;
  final String author;
  final String description;
  final String stars;
  final String imageUrl;
  final String numPages;

  Book(
      {this.imageUrl,
        this.author,
        this.numPages,
        this.title,
        this.description,
        this.stars});
}