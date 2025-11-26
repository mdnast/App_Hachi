import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../models/article_model.dart';
import '../utils/constants.dart';
import '../utils/helpers.dart';
import '../widgets/custom_app_bar.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({super.key, required this.article});

  final PlantArticle article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Chi tiết bài viết',
        subtitle: '',
        weatherLabel: '',
        weatherDescription: '',
        onSearchTap: () {},
        onNotificationTap: () {},
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppInsets.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Label
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primaryGreen.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                article.category.label,
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.primaryGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: AppInsets.md),

            // Title
            Text(
              article.title,
              style: AppTextStyles.headingMedium.copyWith(
                color: AppColors.darkText,
                height: 1.3,
              ),
            ),
            const SizedBox(height: AppInsets.sm),

            // Date and Source
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  formatFullDate(article.publishedAt),
                  style: AppTextStyles.caption.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(width: 16),
                Icon(Icons.source, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  article.source,
                  style: AppTextStyles.caption.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppInsets.lg),

            // Featured Image (if available and not already in content)
            // Note: WordPress content often includes the featured image, so we might skip it here
            // or show it if we want a consistent header.
            if (article.image != null) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(AppCorners.md),
                child: Image.network(
                  article.image!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox.shrink(),
                ),
              ),
              const SizedBox(height: AppInsets.lg),
            ],

            // HTML Content
            HtmlWidget(
              article.content ?? '',
              textStyle: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.darkText,
                height: 1.6,
                fontSize: 16,
              ),
              customStylesBuilder: (element) {
                if (element.localName == 'img') {
                  return {
                    'border-radius': '12px',
                    'margin': '16px 0',
                    'max-width': '100%',
                    'height': 'auto',
                    'display': 'block',
                  };
                }
                if (element.localName == 'h2') {
                  return {
                    'font-size': '20px',
                    'font-weight': 'bold',
                    'color': '#2D3436',
                    'margin-top': '24px',
                    'margin-bottom': '12px',
                  };
                }
                if (element.localName == 'h3') {
                  return {
                    'font-size': '18px',
                    'font-weight': 'bold',
                    'color': '#2D3436',
                    'margin-top': '20px',
                    'margin-bottom': '10px',
                  };
                }
                if (element.localName == 'a') {
                  return {'color': '#7BBB55', 'text-decoration': 'none'};
                }
                if (element.localName == 'figure') {
                  return {'margin': '0', 'padding': '0', 'width': '100%'};
                }
                return null;
              },
              // Enable caching for images
              enableCaching: true,
              // Handle loading
              onLoadingBuilder: (context, element, loadingProgress) =>
                  const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryGreen,
                    ),
                  ),
              // Handle image errors
              onErrorBuilder: (context, element, error) => Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.broken_image, color: Colors.grey),
              ),
              renderMode: RenderMode.column,
            ),

            const SizedBox(height: AppInsets.xl),
          ],
        ),
      ),
    );
  }
}
