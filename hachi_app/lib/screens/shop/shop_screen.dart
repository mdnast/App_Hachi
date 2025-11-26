import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../models/product_models.dart';
import '../../models/article_model.dart';
import '../../services/wordpress_service.dart';
import '../../utils/constants.dart';
import '../article_detail_screen.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final WordPressService _wordPressService = WordPressService();

  // Data
  List<ProductCategory> _categories = [];
  List<Product> _products = [];

  // State
  bool _isLoadingCategories = true;
  bool _isLoadingProducts = true;
  int? _selectedCategoryId;
  int _currentPage = 1;
  bool _hasMoreProducts = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchCategories();
    _fetchProducts();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !_isLoadingProducts &&
        _hasMoreProducts) {
      _fetchProducts(loadMore: true);
    }
  }

  Future<void> _fetchCategories() async {
    try {
      final categories = await _wordPressService.fetchProductCategories();
      if (mounted) {
        setState(() {
          _categories = categories;
          _isLoadingCategories = false;
        });
      }
    } catch (e) {
      debugPrint('Error fetching categories: $e');
      if (mounted) {
        setState(() {
          _isLoadingCategories = false;
        });
      }
    }
  }

  Future<void> _fetchProducts({bool loadMore = false}) async {
    if (loadMore) {
      setState(() {
        _isLoadingProducts = true;
      });
    } else {
      setState(() {
        _products = [];
        _isLoadingProducts = true;
        _currentPage = 1;
        _hasMoreProducts = true;
      });
    }

    try {
      final response = await _wordPressService.fetchProducts(
        page: _currentPage,
        perPage: 10,
        categoryId: _selectedCategoryId,
      );

      if (mounted) {
        setState(() {
          if (loadMore) {
            _products.addAll(response.posts);
          } else {
            _products = response.posts;
          }
          _currentPage++;
          _hasMoreProducts =
              response.posts.length >= 10; // Assuming perPage is 10
          _isLoadingProducts = false;
        });
      }
    } catch (e) {
      debugPrint('Error fetching products: $e');
      if (mounted) {
        setState(() {
          _isLoadingProducts = false;
        });
      }
    }
  }

  void _onCategorySelected(int? categoryId) {
    // Allow reloading if user selects the same category, especially for 'All'
    setState(() {
      _selectedCategoryId = categoryId;
      _currentPage = 1; // Reset page
    });
    _fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0, // Hide default toolbar
      ),
      body: Column(
        children: [
          // Header Row (Title + Contact Buttons)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Colors.white,
            child: Row(
              children: [
                const Text(
                  'Giỏ Hàng',
                  style: TextStyle(
                    color: AppColors.primaryGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const Spacer(),
                _buildContactRow(),
              ],
            ),
          ),

          // Categories
          if (_isLoadingCategories)
            const SizedBox(
              height: 60,
              child: Center(child: CircularProgressIndicator()),
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: _buildCategoryDropdown(),
              ),
            ),

          // Product Grid
          Expanded(
            child: _products.isEmpty && !_isLoadingProducts
                ? const Center(child: Text('Không có sản phẩm nào'))
                : GridView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                    itemCount: _products.length + (_isLoadingProducts ? 2 : 0),
                    itemBuilder: (context, index) {
                      if (index >= _products.length) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final product = _products[index];
                      String? categoryLabel;
                      if (product.categories.isNotEmpty) {
                        // Try to find the first matching category in our list
                        for (final catId in product.categories) {
                          final cat = _categories.firstWhere(
                            (c) => c.id == catId,
                            orElse: () =>
                                ProductCategory(id: -1, name: '', count: 0),
                          );
                          if (cat.id != -1) {
                            categoryLabel = cat.name;
                            break;
                          }
                        }
                      }
                      return _ProductCard(
                        product: product,
                        categoryLabel: categoryLabel,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    final selectedCategoryName = _selectedCategoryId == null
        ? 'Tất cả'
        : _categories
              .firstWhere(
                (c) => c.id == _selectedCategoryId,
                orElse: () => ProductCategory(id: -1, name: 'Tất cả', count: 0),
              )
              .name;

    return PopupMenuButton<int?>(
      onSelected: (int? value) {
        _onCategorySelected(value);
      },
      offset: const Offset(0, 45),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      itemBuilder: (BuildContext context) {
        final List<PopupMenuEntry<int?>> items = [];

        // "All" option
        items.add(
          PopupMenuItem<int?>(
            value: null,
            child: Row(
              children: [
                if (_selectedCategoryId == null)
                  const Icon(
                    Icons.check,
                    color: AppColors.primaryGreen,
                    size: 18,
                  ),
                if (_selectedCategoryId == null) const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Tất cả',
                    style: TextStyle(
                      color: _selectedCategoryId == null
                          ? AppColors.primaryGreen
                          : AppColors.darkText,
                      fontWeight: _selectedCategoryId == null
                          ? FontWeight.w600
                          : FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

        // Categories
        for (final category in _categories) {
          final isSelected = category.id == _selectedCategoryId;
          items.add(
            PopupMenuItem<int?>(
              value: category.id,
              child: Row(
                children: [
                  if (isSelected)
                    const Icon(
                      Icons.check,
                      color: AppColors.primaryGreen,
                      size: 18,
                    ),
                  if (isSelected) const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      category.name,
                      style: TextStyle(
                        color: isSelected
                            ? AppColors.primaryGreen
                            : AppColors.darkText,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return items;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              selectedCategoryName,
              style: const TextStyle(
                color: AppColors.darkText,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.arrow_drop_down,
              color: AppColors.darkText,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Zalo Logo
        _ContactButton(
          backgroundColor: Colors.transparent, // Let logo show
          child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Icon_of_Zalo.svg/1024px-Icon_of_Zalo.svg.png',
            width: 28, // Reduced size
            height: 28,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.chat_bubble, color: Colors.blue, size: 18),
          ),
          onTap: () async {
            final url = Uri.parse(
              'https://zalo.me/${AppConstants.contactZalo}',
            );
            if (await canLaunchUrl(url)) {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            }
          },
        ),
        const SizedBox(width: 8), // Reduced spacing
        _ContactButton(
          icon: FontAwesomeIcons.facebookMessenger,
          backgroundColor: const Color(0xFF0084FF), // Messenger Blue
          onTap: () async {
            // Use m.me for direct app opening
            final url = Uri.parse(
              'https://m.me/${AppConstants.contactMessenger}',
            );
            if (await canLaunchUrl(url)) {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            }
          },
        ),
        const SizedBox(width: 8),
        _ContactButton(
          icon: Icons.email_rounded,
          backgroundColor: const Color(0xFFEA4335), // Gmail Red
          onTap: () async {
            final url = Uri.parse('mailto:${AppConstants.contactEmail}');
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            }
          },
        ),
        const SizedBox(width: 8),
        _ContactButton(
          icon: Icons.phone,
          backgroundColor: const Color(0xFF34A853), // Phone Green
          onTap: () async {
            final url = Uri.parse('tel:${AppConstants.contactHotline1}');
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            }
          },
        ),
        const SizedBox(width: 8),
        _ContactButton(
          icon: Icons.phone, // Same icon as first hotline
          backgroundColor: const Color(0xFF34A853), // Phone Green
          onTap: () async {
            final url = Uri.parse('tel:${AppConstants.contactHotline2}');
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            }
          },
        ),
      ],
    );
  }
}

class _ContactButton extends StatelessWidget {
  final IconData? icon;
  final Widget? child;
  final VoidCallback onTap;
  final Color? backgroundColor;

  const _ContactButton({
    super.key,
    this.icon,
    this.child,
    required this.onTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32, // Reduced size
        height: 32,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primaryGreen,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: (backgroundColor ?? AppColors.primaryGreen).withOpacity(
                0.3,
              ),
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Center(
          child:
              child ??
              Icon(icon, color: Colors.white, size: 16), // Reduced icon size
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;
  final String? categoryLabel;

  const _ProductCard({super.key, required this.product, this.categoryLabel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Map Product to PlantArticle to reuse ArticleDetailScreen
        final article = PlantArticle(
          id: product.id.toString(),
          title: product.title,
          summary:
              '', // Products might not have summary, or use truncated content
          source: 'Hachi Shop',
          category:
              ArticleCategory.kinhNghiem, // Dummy category, overridden by label
          customCategoryLabel: categoryLabel ?? 'Sản phẩm',
          url: product.link,
          publishedAt: DateTime.now(),
          image: product.image,
          content: product.content,
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailScreen(article: article),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Expanded(
              child: product.image != null
                  ? Image.network(
                      product.image!,
                      fit: BoxFit.contain, // Show full image
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) =>
                          Container(color: Colors.grey[200]),
                    )
                  : Container(
                      color: Colors.grey[200],
                      child: const Center(
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                        ),
                      ),
                    ),
            ),
            // Details
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
