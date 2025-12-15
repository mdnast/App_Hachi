import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/wordpress_models.dart';
import '../models/product_models.dart';

class WordPressService {
  static const String _baseUrl = 'https://hachi.com.vn/wp-json/wp/v2';

  Future<WordPressResponse<WordPressPost>> fetchPosts({
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

        return WordPressResponse<WordPressPost>(
          posts: posts,
          totalPages: totalPages,
          totalPosts: totalPosts,
        );
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      print('Error fetching posts: $e');
      return WordPressResponse<WordPressPost>(
        posts: [],
        totalPages: 0,
        totalPosts: 0,
      );
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

  // --- Product Methods ---

  Future<List<ProductCategory>> fetchProductCategories() async {
    try {
      // Note: 'product_cat' is the standard taxonomy for WooCommerce/Custom Products
      final url = Uri.parse('$_baseUrl/product_cat?per_page=100');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => ProductCategory.fromJson(json)).toList();
      } else {
        print('Failed to load product categories: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error fetching product categories: $e');
      return [];
    }
  }

  Future<WordPressResponse<Product>> fetchProducts({
    int page = 1,
    int perPage = 10,
    int? categoryId,
  }) async {
    try {
      String urlString =
          '$_baseUrl/product?page=$page&per_page=$perPage&_embed';
      if (categoryId != null) {
        urlString += '&product_cat=$categoryId';
      }

      final url = Uri.parse(urlString);
      print('🔍 Fetching products: $urlString'); // Debug log
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final int totalPages =
            int.tryParse(response.headers['x-wp-totalpages'] ?? '1') ?? 1;
        final int totalPosts =
            int.tryParse(response.headers['x-wp-total'] ?? '0') ?? 0;

        print(
          '✅ Loaded ${data.length} products (Total: $totalPosts)',
        ); // Debug log
        return WordPressResponse<Product>(
          posts: data.map((json) => Product.fromJson(json)).toList(),
          totalPages: totalPages,
          totalPosts: totalPosts,
        );
      } else {
        print('❌ Failed to load products: ${response.statusCode}'); // Debug log
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error fetching products: $e');
      return WordPressResponse<Product>(
        posts: [],
        totalPages: 0,
        totalPosts: 0,
      );
    }
  }
}
