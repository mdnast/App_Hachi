import '../models/article_model.dart';

class ArticleService {
  ArticleService();

  final List<PlantArticle> _sampleArticles = [
    PlantArticle(
      id: 'h1',
      title: 'Ứng dụng IoT và AI vào trang trại nông nghiệp công nghệ cao',
      summary:
          'Hachi trên báo: Giải pháp nông nghiệp thông minh giúp tối ưu hóa năng suất và giảm thiểu rủi ro.',
      source: 'Hachi News',
      category: ArticleCategory.vegetable,
      url:
          'https://hachi.com.vn/hachi-tren-bao-ung-dung-iot-va-ai-vao-trang-trai-nong-nghiep-cong-nghe-cao/',
      publishedAt: DateTime(2025, 1, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/12/Thumbnail-Rau-tri-tue-nhan-tao.png?v=1751369294',
    ),
    PlantArticle(
      id: 'h2',
      title: 'Hachi tham gia chương trình Sáng tạo và Lãnh đạo toàn cầu',
      summary:
          'Hachi vinh dự được Viện Hàn lâm Kỹ thuật Hoàng gia Anh lựa chọn tham gia chương trình danh giá.',
      source: 'Hachi News',
      category: ArticleCategory.fruit,
      url:
          'https://hachi.com.vn/hachi-tham-gia-chuong-trinh-sang-tao-va-lanh-dao-toan-cau-cua-vien-han-lam-ky-thuat-hoang-gia-anh/',
      publishedAt: DateTime(2025, 1, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/11/462255649_1052124013586125_4273061089838173510_n.jpg?v=1751369417',
    ),
    PlantArticle(
      id: 'h3',
      title: 'Nông nghiệp thông minh thích ứng biến đổi khí hậu',
      summary:
          'Hachi đồng hành cùng bà con nông dân áp dụng công nghệ để ứng phó với biến đổi khí hậu.',
      source: 'Hachi News',
      category: ArticleCategory.herbs,
      url:
          'https://hachi.com.vn/hachi-dong-hanh-cung-nong-nghiep-thong-minh-thich-ung-bien-doi-khi-hau/',
      publishedAt: DateTime(2025, 1, 5),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/11/IMG_5470-scaled.jpg?v=1751369431',
    ),
    PlantArticle(
      id: 'h4',
      title: 'Thuyết minh dự án nông nghiệp công nghệ cao',
      summary:
          'Chi tiết về quy trình và công nghệ được áp dụng trong các dự án nông nghiệp của Hachi.',
      source: 'Hachi News',
      category: ArticleCategory.vegetable,
      url: 'https://hachi.com.vn/thuyet-minh-du-an-nong-nghiep-cong-nghe-cao/',
      publishedAt: DateTime(2024, 12, 28),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/03/DSC00396-scaled-1.jpg?v=1751373845',
    ),
    PlantArticle(
      id: 'h5',
      title: 'Hachi tham dự triển lãm do UNDP tổ chức',
      summary:
          'Giới thiệu các giải pháp nông nghiệp bền vững tại triển lãm của Chương trình Phát triển Liên Hợp Quốc.',
      source: 'Hachi News',
      category: ArticleCategory.fruit,
      url: 'https://hachi.com.vn/hachi-tham-du-trien-lam-do-undp-to-chuc/',
      publishedAt: DateTime(2024, 12, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/03/IMG_1680-scaled-1.jpg?v=1751373850',
    ),
    PlantArticle(
      id: 'h6',
      title: 'Hachi nhận đầu tư từ quỹ VSV Nghệ An',
      summary:
          'Cột mốc quan trọng khẳng định tiềm năng và vị thế của Hachi trong lĩnh vực Agritech.',
      source: 'Hachi News',
      category: ArticleCategory.sweetPotato,
      url: 'https://hachi.com.vn/hachi-vinh-du-nhan-dau-tu-tu-quy-vsv-nghe-an/',
      publishedAt: DateTime(2024, 12, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/12/bna_bna_66987701186_26112021.jpg?v=1751373912',
    ),
  ];

  List<PlantArticle> fetchArticles() => List.unmodifiable(_sampleArticles);

  List<String> availableCategoryLabels() {
    return ArticleCategory.values.map((category) => category.label).toList();
  }
}
