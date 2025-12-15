import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> main() async {
  final url = Uri.parse(
    'https://hachi.com.vn/wp-json/wp/v2/product?per_page=1',
  );
  print('Fetching: $url');
  try {
    final response = await http.get(url);
    print('Status: ${response.statusCode}');
    if (response.statusCode == 200) {
      final List<dynamic> products = json.decode(response.body);
      if (products.isNotEmpty) {
        final product = products[0];
        print('ID: ${product['id']}');
        print('Title: ${product['title']['rendered']}');
        print('Link: ${product['link']}');
        print('Featured Media: ${product['featured_media']}');
        // Check for price or other fields
        print('Keys: ${product.keys.toList()}');

        // Check meta or acf if available
        if (product.containsKey('meta')) print('Meta: ${product['meta']}');

        // Check for price in common places
        // WooCommerce REST API usually puts price in top level, but this is WP REST API for CPT
        // It might be in 'meta' or not exposed without auth.
      } else {
        print('No products found.');
      }
    } else {
      print('Failed.');
    }
  } catch (e) {
    print('Error: $e');
  }
}
