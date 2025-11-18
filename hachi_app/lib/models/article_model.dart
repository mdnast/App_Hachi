enum ArticleCategory {
  fruit('Fruit'),
  vegetable('Vegetable'),
  herbs('Herbs'),
  sweetPotato('Sweet Potato');

  const ArticleCategory(this.label);

  final String label;
}

class PlantArticle {
  const PlantArticle({
    required this.id,
    required this.title,
    required this.summary,
    required this.source,
    required this.category,
    required this.url,
    required this.publishedAt,
    this.image,
  });

  final String id;
  final String title;
  final String summary;
  final String source;
  final ArticleCategory category;
  final String url;
  final DateTime publishedAt;
  final String? image;
}
