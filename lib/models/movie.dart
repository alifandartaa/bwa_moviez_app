class Movie {
  final String title;
  final String genre;
  final String imageUrl;
  final int rating;

  Movie({
    required this.title,
    required this.genre,
    required this.imageUrl,
    this.rating = 0,
  });
}
