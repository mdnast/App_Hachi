import 'package:flutter/material.dart';

import '../../models/item_model.dart';
import '../../utils/constants.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppInsets.lg, vertical: AppInsets.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Header(),
              const SizedBox(height: AppInsets.lg),
              const _SearchField(),
              const SizedBox(height: AppInsets.lg),
              const _HighlightCard(),
              const SizedBox(height: AppInsets.xl),
              Row(
                children: const [
                  Text('Best Selling Items', style: AppTextStyles.headingMedium),
                  Spacer(),
                  Text('See All', style: AppTextStyles.bodySmall),
                ],
              ),
              const SizedBox(height: AppInsets.md),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: bestSellingItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: AppInsets.md,
                  crossAxisSpacing: AppInsets.md,
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (_, index) {
                  final item = bestSellingItems[index];
                  return _MarketItemCard(item: item);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Complete Your', style: AppTextStyles.headingLarge),
              SizedBox(height: 4),
              Text('Agricultural Needs Here', style: AppTextStyles.headingLarge),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppCorners.md),
            boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(13),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Icon(Icons.shopping_cart_outlined, color: AppColors.primaryGreen),
        ),
      ],
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppInsets.lg, vertical: AppInsets.sm),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppCorners.lg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(13),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: AppColors.mutedText),
          const SizedBox(width: AppInsets.md),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search Item',
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.paleGreen,
              borderRadius: BorderRadius.circular(AppCorners.sm),
            ),
            child: const Icon(Icons.tune, color: AppColors.primaryGreen),
          ),
        ],
      ),
    );
  }
}

class _HighlightCard extends StatelessWidget {
  const _HighlightCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppInsets.lg),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primaryGreen, AppColors.secondaryGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppCorners.lg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('No. 1', style: AppTextStyles.caption.copyWith(color: Colors.white70)),
                const SizedBox(height: 6),
                Text('Watering Plants', style: AppTextStyles.headingMedium.copyWith(color: Colors.white)),
                const SizedBox(height: 6),
                Text('The material used is anti-rust', style: AppTextStyles.bodySmall.copyWith(color: Colors.white70)),
                const SizedBox(height: AppInsets.sm),
                const _BuyButton(label: 'Buy Now'),
              ],
            ),
          ),
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(51),
              borderRadius: BorderRadius.circular(AppCorners.md),
            ),
            child: const Icon(Icons.waves, color: Colors.white, size: 36),
          ),
        ],
      ),
    );
  }
}

class _MarketItemCard extends StatelessWidget {
  const _MarketItemCard({required this.item});

  final BestSellingItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppInsets.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppCorners.lg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(13),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.favorite_border, color: AppColors.mutedText.withAlpha(153)),
          ),
          const SizedBox(height: AppInsets.sm),
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: AppColors.paleGreen,
              borderRadius: BorderRadius.circular(AppCorners.md),
            ),
            child: const Center(
              child: Icon(Icons.image_outlined, color: AppColors.primaryGreen, size: 32),
            ),
          ),
          const SizedBox(height: AppInsets.md),
          Text(item.name, style: AppTextStyles.headingSmall),
          const SizedBox(height: 4),
          Text(item.description, style: AppTextStyles.bodySmall, maxLines: 2),
          const Spacer(),
          Row(
            children: [
              Text('\$${item.price.toStringAsFixed(0)}', style: AppTextStyles.headingSmall),
              const Spacer(),
              const _BuyButton(label: 'Buy Now'),
            ],
          ),
        ],
      ),
    );
  }
}

class _BuyButton extends StatelessWidget {
  const _BuyButton({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppInsets.md, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppCorners.sm),
      ),
      child: Text(
        label,
        style: AppTextStyles.bodySmall.copyWith(color: AppColors.primaryGreen, fontWeight: FontWeight.w600),
      ),
    );
  }
}
