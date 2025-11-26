import '../utils/helpers.dart';

class Product {
  final int id;
  final String title;
  final String link;
  final String content;
  final String? image;
  final List<int> categories;
  // Add price if available later, for now just basic info like articles

  Product({
    required this.id,
    required this.title,
    required this.link,
    required this.content,
    this.image,
    required this.categories,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    String? imageUrl;
    // Try to find featured media URL
    // Note: The standard API response might not have the URL directly unless _embed is used or we fetch media separately.
    // However, for the 'post' type we used jetpack_featured_media_url. Let's see if it's here.
    if (json['jetpack_featured_media_url'] != null) {
      imageUrl = json['jetpack_featured_media_url'];
    } else if (json['_embedded'] != null &&
        json['_embedded']['wp:featuredmedia'] != null) {
      final List media = json['_embedded']['wp:featuredmedia'];
      if (media.isNotEmpty && media[0]['source_url'] != null) {
        imageUrl = media[0]['source_url'];
      }
    }

    return Product(
      id: json['id'],
      title: unescapeHtml(json['title']['rendered']),
      link: json['link'],
      content: json['content']['rendered'], // Content usually keeps HTML tags
      image: imageUrl,
      categories: json['product_cat'] != null
          ? List<int>.from(json['product_cat'])
          : [],
    );
  }
}

class ProductCategory {
  final int id;
  final String name;
  final int count;

  ProductCategory({required this.id, required this.name, required this.count});

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      id: json['id'],
      name: json['name'],
      count: json['count'],
    );
  }
}
