import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> main() async {
  // Try fetching product categories (WooCommerce or Custom Taxonomy)
  final urls = [
    'https://hachi.com.vn/wp-json/wp/v2/product_cat?per_page=100',
    'https://hachi.com.vn/wp-json/wc/v3/products/categories', // Likely needs auth, but worth a try
  ];

  for (final urlString in urls) {
    print('Fetching: $urlString');
    try {
      final response = await http.get(Uri.parse(urlString));
      print('Status: ${response.statusCode}');
      if (response.statusCode == 200) {
        final List<dynamic> categories = json.decode(response.body);
        print('Found ${categories.length} items:');
        for (var category in categories) {
          // Handle both standard WP term structure and WC structure
          final id = category['id'];
          final name = category['name'];
          final count = category['count'];
          print('ID: $id, Name: $name, Count: $count');
        }
        break; // Stop if we found something
      } else {
        print('Failed.');
      }
    } catch (e) {
      print('Error: $e');
    }
    print('---');
  }
}
