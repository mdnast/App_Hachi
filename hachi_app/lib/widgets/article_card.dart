import 'package:flutter/material.dart';

import '../models/article_model.dart';
import '../utils/constants.dart';
import '../utils/helpers.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.article,
    required this.onTap,
  });

  final PlantArticle article;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 240,
        margin: const EdgeInsets.only(left: AppInsets.lg, top: AppInsets.md, bottom: AppInsets.md),
        padding: const EdgeInsets.all(AppInsets.md),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppCorners.lg),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1F000000),
              blurRadius: 10,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: AppInsets.sm, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.paleGreen,
                borderRadius: BorderRadius.circular(AppCorners.sm),
              ),
              child: Text(
                article.category.label,
                style: AppTextStyles.caption.copyWith(color: AppColors.primaryGreen, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: AppInsets.sm),
            Text(
              article.title,
              style: AppTextStyles.headingSmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                article.summary,
                style: AppTextStyles.bodySmall,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: AppInsets.md),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${article.source} • ${formatMonthDay(article.publishedAt)}',
                    style: AppTextStyles.caption,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Icon(Icons.open_in_new, size: 16, color: AppColors.primaryGreen),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
