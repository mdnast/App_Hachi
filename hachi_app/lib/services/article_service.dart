import '../models/article_model.dart';

class ArticleService {
  ArticleService();

  final List<PlantArticle> _sampleArticles = [
    PlantArticle(
      id: 'a1',
      title: 'Optimising Herbs Plantation Irrigation',
      summary: 'Sensor-driven irrigation helped reduce water usage by 18% across the Herbs Plantation block.',
      source: 'Green Farming Daily',
      category: ArticleCategory.herbs,
      url: 'https://example.com/articles/herbs-irrigation',
      publishedAt: DateTime(2025, 1, 3, 8, 30),
    ),
    PlantArticle(
      id: 'a2',
      title: 'Tomato Yield Doubles After Smart Lighting Upgrade',
      summary: 'A new LED schedule improved fruit yield for the Tomato Greenhouse by 54% within one season.',
      source: 'AgriTech Journal',
      category: ArticleCategory.fruit,
      url: 'https://example.com/articles/tomato-smart-light',
      publishedAt: DateTime(2025, 1, 4, 10, 5),
    ),
    PlantArticle(
      id: 'a3',
      title: 'Soil Health Checklist for Vegetable Fields',
      summary: 'Weekly checklist to monitor soil pH and micronutrients across vegetable lots with minimal equipment.',
      source: 'Soil & Crop Review',
      category: ArticleCategory.vegetable,
      url: 'https://example.com/articles/soil-health-checklist',
      publishedAt: DateTime(2025, 1, 2, 17, 20),
    ),
    PlantArticle(
      id: 'a4',
      title: 'Sweet Potato Storage Best Practices',
      summary: 'Post-harvest storage improvements can extend shelf life by 21 days while preserving quality.',
      source: 'Root Crop Weekly',
      category: ArticleCategory.sweetPotato,
      url: 'https://example.com/articles/sweet-potato-storage',
      publishedAt: DateTime(2025, 1, 5, 9, 45),
    ),
    PlantArticle(
      id: 'a5',
      title: 'Fruit Pest Forecast for Early January',
      summary: 'Meteorological data suggests a higher probability of fruit fly activity across the region.',
      source: 'Regional Weather Bureau',
      category: ArticleCategory.fruit,
      url: 'https://example.com/articles/fruit-pest-forecast',
      publishedAt: DateTime(2025, 1, 3, 6, 10),
    ),
  ];

  List<PlantArticle> fetchArticles() => List.unmodifiable(_sampleArticles);

  List<String> availableCategoryLabels() {
    return ArticleCategory.values.map((category) => category.label).toList();
  }
}
