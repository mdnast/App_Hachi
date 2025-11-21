import 'dart:async';

import 'package:flutter/material.dart';

// Đảm bảo các đường dẫn import này đúng với project của bạn
import '../../models/article_model.dart';
import '../../models/plant_model.dart';
import '../../models/weather_model.dart';
import '../../services/article_service.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';

import '../../widgets/article_card.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/compact_chat_widget.dart';

import '../../widgets/weather_card.dart';
import '../webview_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
    required this.onPlantSelected,
    required this.weather,
    required this.isLoadingWeather,
    required this.locationLabel,
    this.weatherError,
    required this.onRefreshWeather,
  });

  final ValueChanged<PlantSummary> onPlantSelected;
  final WeatherInfo weather;
  final bool isLoadingWeather;
  final String locationLabel;
  final String? weatherError;
  final VoidCallback onRefreshWeather;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late DateTime _now;
  Timer? _clockTimer;
  final ArticleService _articleService = ArticleService();
  late final List<PlantArticle> _articles;
  String _selectedCategory = 'BÁO CHÍ NÓI VỀ HACHI';
  int _currentPage = 0;
  static const int _itemsPerPage = 5;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _startClock();
    _articles = _articleService.fetchArticles();
  }

  @override
  void dispose() {
    _clockTimer?.cancel();
    super.dispose();
  }

  void _startClock() {
    _clockTimer = Timer.periodic(const Duration(seconds: 1), (_) async {
      final now = DateTime.now();
      setState(() {
        _now = now;
      });

      if (!widget.isLoadingWeather) {
        final lastUpdated = widget.weather.lastUpdated;
        if (now.difference(lastUpdated) > const Duration(minutes: 15)) {
          widget.onRefreshWeather();
        }
      }
    });
  }

  String get _greeting {
    final hour = _now.hour;
    if (hour < 12) return 'Chào buổi sáng';
    if (hour < 19) return 'Chào buổi chiều';
    return 'Chào buổi tối';
  }

  void _handleArticleTap(PlantArticle article) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            WebViewScreen(url: article.url, title: article.source),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final subtitle = formatFullDate(_now);
    final weatherLabel =
        widget.isLoadingWeather && widget.weather.temperature == 0
        ? 'Đang cập nhật…'
        : '${widget.weather.temperature.round()}°C';
    final weatherDescription = widget.isLoadingWeather
        ? 'Đang tải dữ liệu thời tiết mới nhất'
        : '${widget.weather.condition} • Thấp ${widget.weather.low.round()}°C • Cao ${widget.weather.high.round()}°C';

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: CustomAppBar(
        title: _greeting,
        subtitle: subtitle,
        weatherLabel: weatherLabel,
        weatherDescription: weatherDescription,
        onSearchTap: widget.onRefreshWeather,
        onNotificationTap: () {},
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: AppInsets.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppInsets.lg,
                vertical: AppInsets.lg,
              ),
              child: WeatherCard(
                weather: widget.weather,
                isLoading: widget.isLoadingWeather,
                onRefresh: widget.onRefreshWeather,
                locationLabel: widget.locationLabel,
                errorMessage: widget.weatherError,
                currentTime: _now,
              ),
            ),
            const SizedBox(height: 4),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppInsets.lg),
              child: Text('Tin tức', style: AppTextStyles.headingMedium),
            ),
            const SizedBox(height: 0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildCategoryChip(
                    'BÁO CHÍ NÓI VỀ HACHI',
                    _selectedCategory == 'BÁO CHÍ NÓI VỀ HACHI',
                  ),
                  const CompactChatWidget(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [const SizedBox(height: 8), _buildCategoryDropdown()],
              ),
            ),
            const SizedBox(height: AppInsets.md),

            // --- Phần ListView ---
            SizedBox(
              height: 380,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(right: AppInsets.lg),
                itemCount: _getPaginatedArticles().length,
                itemBuilder: (context, index) {
                  final article = _getPaginatedArticles()[index];
                  return ArticleCard(
                    article: article,
                    onTap: () => _handleArticleTap(article),
                  );
                },
              ),
            ),

            // --- Phần Pagination ---
            if (_getTotalPages() > 1) ...[
              const SizedBox(height: AppInsets.md),
              _buildPagination(),
            ],

            const SizedBox(height: AppInsets.lg),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppInsets.lg),
              child: Container(
                padding: const EdgeInsets.all(AppInsets.lg),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(AppCorners.lg),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(13),
                      blurRadius: 14,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thời tiết hôm nay',
                      style: AppTextStyles.headingSmall,
                    ),
                    const SizedBox(height: AppInsets.md),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _WeatherPeriod(
                          label: 'Sáng',
                          temperature: '${widget.weather.low.round()}°',
                          icon: Icons.wb_sunny_outlined,
                          isHighlight: _now.hour >= 6 && _now.hour < 12,
                        ),
                        _WeatherPeriod(
                          label: 'Chiều',
                          temperature: '${widget.weather.high.round()}°',
                          icon: Icons.wb_sunny,
                          isHighlight: _now.hour >= 12 && _now.hour < 17,
                        ),
                        _WeatherPeriod(
                          label: 'Tối',
                          temperature: '${widget.weather.temperature.round()}°',
                          icon: Icons.cloud_outlined,
                          isHighlight: _now.hour >= 17 && _now.hour < 21,
                        ),
                        _WeatherPeriod(
                          label: 'Đêm',
                          temperature: '${(widget.weather.low - 2).round()}°',
                          icon: Icons.nights_stay_outlined,
                          isHighlight: _now.hour >= 21 || _now.hour < 6,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppInsets.md),
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColors.paleGreen,
                        borderRadius: BorderRadius.circular(AppCorners.md),
                      ),
                      child: Center(
                        child: Text(
                          'Bình minh ${widget.weather.sunrise}   ·   Hoàng hôn ${widget.weather.sunset}',
                          style: AppTextStyles.bodySmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PlantArticle> _getFilteredArticles() {
    if (_selectedCategory == 'BÁO CHÍ NÓI VỀ HACHI') {
      return _articles.where((article) => article.id.startsWith('h')).toList();
    }
    return _articles
        .where((article) => article.category.label == _selectedCategory)
        .toList();
  }

  List<PlantArticle> _getPaginatedArticles() {
    final filtered = _getFilteredArticles();
    if (_selectedCategory == 'BÁO CHÍ NÓI VỀ HACHI') {
      return filtered;
    }

    final startIndex = _currentPage * _itemsPerPage;
    final endIndex = (startIndex + _itemsPerPage < filtered.length)
        ? startIndex + _itemsPerPage
        : filtered.length;
    if (startIndex >= filtered.length) return [];
    return filtered.sublist(startIndex, endIndex);
  }

  int _getTotalPages() {
    if (_selectedCategory == 'BÁO CHÍ NÓI VỀ HACHI') {
      return 1;
    }
    return (_getFilteredArticles().length / _itemsPerPage).ceil();
  }

  Widget _buildPagination() {
    final totalPages = _getTotalPages();
    int startPage = 0;
    int endPage = totalPages - 1;

    if (totalPages > 5) {
      startPage = (_currentPage - 2).clamp(0, totalPages - 5);
      endPage = startPage + 4;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _currentPage > 0
              ? () {
                  setState(() {
                    _currentPage--;
                  });
                }
              : null,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _currentPage > 0 ? Colors.black45 : Colors.grey[300]!,
                width: 1.5,
              ),
            ),
            child: Icon(
              Icons.chevron_left,
              size: 16,
              color: _currentPage > 0 ? Colors.black54 : Colors.grey[300],
            ),
          ),
        ),
        ...List.generate(endPage - startPage + 1, (i) {
          final pageIndex = startPage + i;
          final isSelected = pageIndex == _currentPage;
          return GestureDetector(
            onTap: () {
              setState(() {
                _currentPage = pageIndex;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryGreen : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primaryGreen : Colors.black45,
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Text(
                  '${pageIndex + 1}',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: isSelected ? Colors.white : Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          );
        }),
        GestureDetector(
          onTap: _currentPage < totalPages - 1
              ? () {
                  setState(() {
                    _currentPage++;
                  });
                }
              : null,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _currentPage < totalPages - 1
                    ? Colors.black45
                    : Colors.grey[300]!,
                width: 1.5,
              ),
            ),
            child: Icon(
              Icons.chevron_right,
              size: 16,
              color: _currentPage < totalPages - 1
                  ? Colors.black54
                  : Colors.grey[300],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryChip(String title, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = title;
          _currentPage = 0;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(right: AppInsets.sm),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF7BBB55), Color(0xFF6AA348)],
                )
              : null,
          color: isSelected ? null : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected
                ? Colors.transparent
                : Colors.grey.withOpacity(0.2),
            width: 1.5,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFF7BBB55).withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Text(
          title,
          style: AppTextStyles.caption.copyWith(
            color: isSelected ? Colors.white : AppColors.darkText,
            fontWeight: FontWeight.w600,
            fontSize: 10,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    final categories = [
      'NHÀ MÀNG NÔNG NGHIỆP',
      'DINH DƯỠNG THỦY CANH',
      'NÔNG NGHIỆP CÔNG NGHỆ CAO',
      'CẨM NANG THỦY CANH',
      'CHIẾU SÁNG NHÂN TẠO',
      'HỆ THỐNG TƯỚI',
      'KINH NGHIỆM TRỒNG RAU',
    ];

    final isAnySelected = categories.contains(_selectedCategory);
    final displayText = isAnySelected
        ? _selectedCategory
        : 'THÔNG TIN NÔNG NGHIỆP';

    return PopupMenuButton<String>(
      onSelected: (String value) {
        setState(() {
          _selectedCategory = value;
          _currentPage = 0;
        });
      },
      offset: const Offset(0, 45),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      itemBuilder: (BuildContext context) {
        return categories.map((String category) {
          final isSelected = category == _selectedCategory;
          return PopupMenuItem<String>(
            value: category,
            child: Row(
              children: [
                if (isSelected)
                  const Icon(Icons.check, color: Color(0xFF7BBB55), size: 18),
                if (isSelected) const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    category,
                    style: AppTextStyles.caption.copyWith(
                      color: isSelected
                          ? const Color(0xFF7BBB55)
                          : AppColors.darkText,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w500,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          gradient: isAnySelected
              ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF7BBB55), Color(0xFF6AA348)],
                )
              : null,
          color: isAnySelected ? null : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isAnySelected
                ? Colors.transparent
                : Colors.grey.withOpacity(0.2),
            width: 1.5,
          ),
          boxShadow: isAnySelected
              ? [
                  BoxShadow(
                    color: const Color(0xFF7BBB55).withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [
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
              displayText,
              style: AppTextStyles.caption.copyWith(
                color: isAnySelected ? Colors.white : AppColors.darkText,
                fontWeight: FontWeight.w600,
                fontSize: 10,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.arrow_drop_down,
              color: isAnySelected ? Colors.white : AppColors.darkText,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
// ĐÃ ĐÓNG Class _DashboardScreenState TẠI ĐÂY

// Class này nằm ngoài cùng, không bị lồng vào trong
class _WeatherPeriod extends StatelessWidget {
  const _WeatherPeriod({
    required this.label,
    required this.temperature,
    required this.icon,
    this.isHighlight = false,
  });

  final String label;
  final String temperature;
  final IconData icon;
  final bool isHighlight;

  @override
  Widget build(BuildContext context) {
    final color = isHighlight ? AppColors.primaryGreen : AppColors.mutedText;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isHighlight
                ? AppColors.paleGreen
                : AppColors.lightBackground,
            borderRadius: BorderRadius.circular(AppCorners.md),
          ),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 8),
        Text(label, style: AppTextStyles.caption.copyWith(color: color)),
        const SizedBox(height: 4),
        Text(
          temperature,
          style: AppTextStyles.bodySmall.copyWith(color: AppColors.darkText),
        ),
      ],
    );
  }
}
