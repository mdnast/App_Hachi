import 'package:html/parser.dart' as html_parser;
import '../models/article_model.dart';
import '../models/wordpress_models.dart';
import 'wordpress_service.dart';

class ArticleService {
  ArticleService();

  final List<PlantArticle> _sampleArticles = [
    // Fallback Articles (Reduced list)
    PlantArticle(
      id: 'h1',
      title: 'Ứng dụng IoT và AI vào trang trại nông nghiệp công nghệ cao',
      summary:
          'Hachi trên báo: Giải pháp nông nghiệp thông minh giúp tối ưu hóa năng suất và giảm thiểu rủi ro.',
      source: 'Hachi News',
      category: ArticleCategory.vegetable,
      url:
          'https://hachi.com.vn/hachi-tren-bao-ung-dung-iot-va-ai-vao-trang-trai-nong-nghiep-cong-nghe-cao/',
      publishedAt: DateTime(2025, 1, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/12/Thumbnail-Rau-tri-tue-nhan-tao.png?v=1751369294',
    ),
    PlantArticle(
      id: 'h2',
      title: 'Hachi tham gia chương trình Sáng tạo và Lãnh đạo toàn cầu',
      summary:
          'Hachi vinh dự được Viện Hàn lâm Kỹ thuật Hoàng gia Anh lựa chọn tham gia chương trình danh giá.',
      source: 'Hachi News',
      category: ArticleCategory.fruit,
      url:
          'https://hachi.com.vn/hachi-tham-gia-chuong-trinh-sang-tao-va-lanh-dao-toan-cau-cua-vien-han-lam-ky-thuat-hoang-gia-anh/',
      publishedAt: DateTime(2025, 1, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/11/462255649_1052124013586125_4273061089838173510_n.jpg?v=1751369417',
    ),
  ];

  List<PlantArticle> fetchArticles() => List.unmodifiable(_sampleArticles);

  List<String> availableCategoryLabels() {
    return ArticleCategory.values.map((category) => category.label).toList();
  }

  final WordPressService _wordPressService = WordPressService();

  Future<PaginatedArticles> fetchArticlesFromApi({
    int page = 1,
    int perPage = 10,
    String? categoryLabel,
  }) async {
    try {
      // 1. Determine category ID if a label is provided
      int? categoryId;
      if (categoryLabel != null) {
        // Map app category labels to WordPress category names if they differ
        String searchLabel = categoryLabel;
        if (categoryLabel == 'BÁO CHÍ NÓI VỀ HACHI') {
          searchLabel = 'Truyền thông nói về Hachi';
        } else if (categoryLabel == 'DINH DƯỠNG THỦY CANH') {
          searchLabel = 'Dinh dưỡng thuỷ canh';
        }

        // We need to fetch categories to find the ID matching the label
        // Optimization: Cache categories? For now, fetch every time or use hardcoded mapping if possible.
        // But to be dynamic, we should fetch.
        final categories = await _wordPressService.fetchCategories();
        final matchingCategory = categories.firstWhere(
          (c) => c.name.toLowerCase() == searchLabel.toLowerCase(),
          orElse: () => WordPressCategory(id: -1, name: '', slug: ''),
        );
        if (matchingCategory.id != -1) {
          categoryId = matchingCategory.id;
        }
      }

      // 2. Fetch posts
      final response = await _wordPressService.fetchPosts(
        page: page,
        perPage: perPage,
        categoryId: categoryId,
      );

      // 3. Map to PlantArticle
      final articles = response.posts
          .map(_mapWordPressPostToPlantArticle)
          .toList();

      return PaginatedArticles(
        articles: articles,
        totalPages: response.totalPages,
      );
    } catch (e) {
      print('Error fetching articles: $e');
      return PaginatedArticles(articles: [], totalPages: 0);
    }
  }

  PlantArticle _mapWordPressPostToPlantArticle(WordPressPost post) {
    // Map WordPress category to ArticleCategory
    // This is tricky because a post can have multiple categories (IDs).
    // We'll just pick the first one or default to 'kinhNghiem'
    ArticleCategory category = ArticleCategory.kinhNghiem;

    // Parse HTML title and excerpt
    String summary = _parseHtmlString(post.excerpt.rendered);
    if (summary.length > 100) {
      summary = '${summary.substring(0, 100)}...';
    }

    return PlantArticle(
      id: post.id.toString(),
      title: _parseHtmlString(post.title.rendered),
      summary: summary,
      source: 'Hachi News',
      category: category,
      url: post.link,
      publishedAt: DateTime.tryParse(post.date) ?? DateTime.now(),
      image: post.jetpackFeaturedMediaUrl,
      content: post.content.rendered,
    );
  }

  String _parseHtmlString(String htmlString) {
    final document = html_parser.parse(htmlString);
    final String parsedString =
        document.body?.text ?? document.documentElement?.text ?? htmlString;
    return parsedString.trim();
  }
}
