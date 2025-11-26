class WordPressPost {
  final int id;
  final String date;
  final String link;
  final RenderedTitle title;
  final RenderedContent content;
  final RenderedContent excerpt;
  final String? jetpackFeaturedMediaUrl;
  final List<int> categories;

  WordPressPost({
    required this.id,
    required this.date,
    required this.link,
    required this.title,
    required this.content,
    required this.excerpt,
    this.jetpackFeaturedMediaUrl,
    required this.categories,
  });

  factory WordPressPost.fromJson(Map<String, dynamic> json) {
    String? imageUrl = json['jetpack_featured_media_url'];
    if (imageUrl == null && json['_embedded'] != null) {
      final embedded = json['_embedded'];
      if (embedded['wp:featuredmedia'] != null &&
          (embedded['wp:featuredmedia'] as List).isNotEmpty) {
        final media = embedded['wp:featuredmedia'][0];
        if (media['source_url'] != null) {
          imageUrl = media['source_url'];
        }
      }
    }

    return WordPressPost(
      id: json['id'],
      date: json['date'],
      link: json['link'],
      title: RenderedTitle.fromJson(json['title']),
      content: RenderedContent.fromJson(json['content']),
      excerpt: RenderedContent.fromJson(json['excerpt']),
      jetpackFeaturedMediaUrl: imageUrl,
      categories: List<int>.from(json['categories'] ?? []),
    );
  }
}

class RenderedTitle {
  final String rendered;

  RenderedTitle({required this.rendered});

  factory RenderedTitle.fromJson(Map<String, dynamic> json) {
    return RenderedTitle(rendered: json['rendered']);
  }
}

class RenderedContent {
  final String rendered;

  RenderedContent({required this.rendered});

  factory RenderedContent.fromJson(Map<String, dynamic> json) {
    return RenderedContent(rendered: json['rendered']);
  }
}

class WordPressCategory {
  final int id;
  final String name;
  final String slug;

  WordPressCategory({required this.id, required this.name, required this.slug});

  factory WordPressCategory.fromJson(Map<String, dynamic> json) {
    return WordPressCategory(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );
  }
}

class WordPressResponse {
  final List<WordPressPost> posts;
  final int totalPages;
  final int totalPosts;

  WordPressResponse({
    required this.posts,
    required this.totalPages,
    required this.totalPosts,
  });
}
