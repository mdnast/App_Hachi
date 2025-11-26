import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/wordpress_models.dart';

class WordPressService {
  static const String _baseUrl = 'https://hachi.com.vn/wp-json/wp/v2';

  Future<WordPressResponse> fetchPosts({
    int page = 1,
    int perPage = 10,
    int? categoryId,
  }) async {
    try {
      String url =
          '$_baseUrl/posts?page=$page&per_page=$perPage&_embed&orderby=date&order=desc';
      if (categoryId != null) {
        url += '&categories=$categoryId';
      }

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final posts = data.map((json) => WordPressPost.fromJson(json)).toList();

        final totalPages =
            int.tryParse(response.headers['x-wp-totalpages'] ?? '0') ?? 0;
        final totalPosts =
            int.tryParse(response.headers['x-wp-total'] ?? '0') ?? 0;

        return WordPressResponse(
          posts: posts,
          totalPages: totalPages,
          totalPosts: totalPosts,
        );
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      print('Error fetching posts: $e');
      return WordPressResponse(posts: [], totalPages: 0, totalPosts: 0);
    }
  }

  Future<List<WordPressCategory>> fetchCategories() async {
    try {
      // Fetching 100 categories to ensure we get most of them
      final response = await http.get(
        Uri.parse('$_baseUrl/categories?per_page=100'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => WordPressCategory.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error fetching categories: $e');
      return [];
    }
  }
}
