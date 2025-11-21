import '../models/article_model.dart';

class ArticleService {
  ArticleService();

  final List<PlantArticle> _sampleArticles = [
    // Original Articles
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

    // New Articles - NHÀ MÀNG NÔNG NGHIỆP
    PlantArticle(
      id: 'nm1',
      title: 'Chi phí làm nhà lưới 100m2',
      summary:
          'Tổng hợp chi phí và dự toán chi tiết cho việc xây dựng nhà lưới 100m2 hiệu quả.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/chi-phi-lam-nha-luoi-100m2/',
      publishedAt: DateTime(2025, 9, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/09/cau-tao-nha-luoi-100m2.jpg?v=1757241061',
    ),
    PlantArticle(
      id: 'nm2',
      title: 'Cách trồng dưa lưới thủy canh',
      summary: 'Hướng dẫn kỹ thuật trồng dưa lưới thủy canh năng suất cao.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/cach-trong-dua-luoi-thuy-canh/',
      publishedAt: DateTime(2025, 6, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/06/cach-trong-dua-luoi-thuy-canh.jpg?v=1751367467',
    ),
    PlantArticle(
      id: 'nm3',
      title: 'Các loại khớp nối khung nhà màng',
      summary:
          'Tìm hiểu về các loại khớp nối quan trọng trong cấu trúc khung nhà màng.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/cac-loai-khop-noi-khung-nha-mang/',
      publishedAt: DateTime(2025, 5, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/05/khop-noi-khung-nha-mang-la-gi.jpg?v=1751367574',
    ),
    PlantArticle(
      id: 'nm4',
      title: 'Vật liệu làm nhà màng',
      summary:
          'Các loại vật liệu phổ biến và tốt nhất để thi công nhà màng nông nghiệp.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/vat-lieu-lam-nha-mang/',
      publishedAt: DateTime(2025, 5, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/05/thanh-nep-ziczac-va-thanh-nep-c-1.jpg?v=1751367595',
    ),
    PlantArticle(
      id: 'nm5',
      title: 'Làm nhà màng trên sân thượng',
      summary:
          'Giải pháp làm nhà màng trồng rau sạch ngay trên sân thượng nhà phố.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/lam-nha-mang-tren-san-thuong/',
      publishedAt: DateTime(2025, 5, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/05/huong-dan-cach-lam-nha-mang-tren-san-thuong.jpg?v=1751367601',
    ),
    PlantArticle(
      id: 'nm6',
      title: 'Kỹ thuật trồng dưa lưới trong nhà màng',
      summary:
          'Quy trình kỹ thuật chi tiết trồng dưa lưới trong môi trường nhà màng.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/ky-thuat-trong-dua-luoi-trong-nha-mang/',
      publishedAt: DateTime(2024, 10, 25),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/10/ky-thuat-trong-dua-luoi-trong-nha-mang-8.jpg?v=1751369549',
    ),
    PlantArticle(
      id: 'nm7',
      title: 'Mô hình trồng dưa leo',
      summary:
          'Mô hình trồng dưa leo hiệu quả sử dụng phân hữu cơ và công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/mo-hinh-trong-dua-leo/',
      publishedAt: DateTime(2024, 7, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/07/mo-hinh-trong-dua-leo-su-dung-phan-huu-co.jpg?v=1751370152',
    ),
    PlantArticle(
      id: 'nm8',
      title: 'Trồng cà chua trong nhà kính nhà màng',
      summary:
          'Kỹ thuật và thời vụ trồng cà chua trong nhà kính để đạt năng suất cao.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/trong-ca-chua-trong-nha-kinh-nha-mang/',
      publishedAt: DateTime(2024, 6, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/06/thoi-vu-trong-ca-chua.jpg?v=1751370185',
    ),
    PlantArticle(
      id: 'nm9',
      title: 'Mô hình trồng cà chua',
      summary: 'Giới thiệu mô hình trồng cà chua công nghệ cao trong nhà màng.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/mo-hinh-trong-ca-chua/',
      publishedAt: DateTime(2024, 6, 18),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/06/mo-hinh-trong-ca-chua-trong-nha-mang.jpg?v=1751370218',
    ),
    PlantArticle(
      id: 'nm10',
      title: 'Cách trồng cà chua',
      summary: 'Hướng dẫn cách trồng cà chua từ A-Z cho người mới bắt đầu.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/cach-trong-ca-chua/',
      publishedAt: DateTime(2024, 6, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/06/hachi-nong-nghiep-thong-minh-9.jpg?v=1751370227',
    ),
    PlantArticle(
      id: 'nm11',
      title: 'Kỹ thuật trồng ớt chuông trong nhà kính',
      summary:
          'Bí quyết trồng và thu hoạch ớt chuông chất lượng cao trong nhà kính.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/ky-thuat-trong-ot-chuong-trong-nha-kinh/',
      publishedAt: DateTime(2024, 6, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/06/thu-hoach-ot-chuong-trong-trong-nha-mang.jpg?v=1751370270',
    ),
    PlantArticle(
      id: 'nm12',
      title: 'Nhà màng giá rẻ',
      summary: 'Giải pháp nhà màng chi phí thấp nhưng vẫn đảm bảo hiệu quả.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/nha-mang-gia-re/',
      publishedAt: DateTime(2024, 5, 25),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/05/gioi-thieu-nha-mang-gia-re.jpg?v=1751370355',
    ),
    PlantArticle(
      id: 'nm13',
      title: 'Nhà màng sấy cafe',
      summary:
          'Ứng dụng nhà màng trong việc sấy cafe, nâng cao chất lượng nông sản.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/nha-mang-say-cafe/',
      publishedAt: DateTime(2024, 1, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/nha-mang-say-cafe-thumb.jpg?v=1751370725',
    ),
    PlantArticle(
      id: 'nm14',
      title: 'Cách nẹp ziczac nhà màng',
      summary:
          'Hướng dẫn kỹ thuật nẹp ziczac để cố định màng nhà kính chắc chắn.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/cach-nep-ziczac-nha-mang/',
      publishedAt: DateTime(2023, 12, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/12/cach-nep-ziczac-nha-mang-2.jpg?v=1751372921',
    ),
    PlantArticle(
      id: 'nm15',
      title: 'Nhà màng trồng nho',
      summary: 'Mô hình nhà màng chuyên dụng cho việc trồng nho.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/nha-mang-trong-nho/',
      publishedAt: DateTime(2023, 12, 18),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/12/mo-hinh-nha-mang-trong-nho.jpg?v=1751372961',
    ),
    PlantArticle(
      id: 'nm16',
      title: 'Nhà màng nuôi tôm',
      summary:
          'Ứng dụng công nghệ nhà màng trong nuôi trồng thủy sản, đặc biệt là tôm.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/nha-mang-nuoi-tom/',
      publishedAt: DateTime(2024, 1, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/nha-mang-nuoi-tom.jpg?v=1751370935',
    ),
    PlantArticle(
      id: 'nm17',
      title: 'Nhà màng mọi thông tin cần biết',
      summary: 'Tổng hợp kiến thức từ A-Z về nhà màng nông nghiệp.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/nha-mang-moi-thong-tin-can-biet/',
      publishedAt: DateTime(2023, 12, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/12/nha-mang-moi-thong-tin-can-biet-thumb.jpg?v=1751372962',
    ),
    PlantArticle(
      id: 'nm18',
      title: 'Báo giá chi phí thi công nhà màng',
      summary: 'Cập nhật bảng báo giá thi công nhà màng mới nhất.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/bao-gia-chi-phi-thi-cong-nha-mang/',
      publishedAt: DateTime(2023, 12, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/12/bao-gia-chi-phi-thi-cong-nha-mang-thumb.jpg?v=1751372961',
    ),
    PlantArticle(
      id: 'nm19',
      title: 'Cách lợp màng nhà kính',
      summary: 'Hướng dẫn kỹ thuật lợp màng nhà kính đúng cách, bền đẹp.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/cach-lop-mang-nha-kinh/',
      publishedAt: DateTime(2023, 12, 5),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/12/Photo-2023-10-11-15.09.28-1.jpg?v=1751372949',
    ),

    // Page 3
    PlantArticle(
      id: 'nm20',
      title: 'Bản vẽ thiết kế nhà màng',
      summary: 'Chi tiết bản vẽ thiết kế nhà màng nông nghiệp hiệu quả.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/ban-ve-thiet-ke-nha-mang/',
      publishedAt: DateTime(2023, 11, 28),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/12/ban-ve-thiet-ke-nha-mang-thumb.png?v=1751372970',
    ),
    PlantArticle(
      id: 'nm21',
      title: 'Top 7 tác dụng của nhà kính trồng rau',
      summary: 'Khám phá 7 lợi ích tuyệt vời khi trồng rau trong nhà kính.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/top-7-tac-dung-cua-nha-kinh-trong-rau/',
      publishedAt: DateTime(2023, 11, 25),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/DSC9865-scaled-1.jpg?v=1751373168',
    ),
    PlantArticle(
      id: 'nm22',
      title: 'Làm nhà kính trồng nấm cần biết những điều này',
      summary: 'Những lưu ý quan trọng khi xây dựng nhà kính để trồng nấm.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/lam-nha-kinh-trong-nam-ban-can-biet-nhung-dieu-nay/',
      publishedAt: DateTime(2023, 11, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/11/S3-2013_DTKHCN_nha-kinh_-BT_H06.jpg?v=1751373026',
    ),
    PlantArticle(
      id: 'nm23',
      title: 'Lưới chống côn trùng nông nghiệp gồm những loại nào?',
      summary: 'Phân loại và địa chỉ mua lưới chống côn trùng uy tín.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/luoi-chong-con-trung-nong-nghiep-gom-nhung-loai-nao-mua-o-dau/',
      publishedAt: DateTime(2023, 11, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/11/luoi-chong-con-trung.jpeg?v=1751373027',
    ),
    PlantArticle(
      id: 'nm24',
      title: 'Những lưu ý khi đầu tư nhà kính trồng hoa',
      summary: 'Kinh nghiệm đầu tư nhà kính trồng hoa để đạt hiệu quả cao.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/nhung-luu-y-khi-dau-tu-nha-kinh-trong-hoa/',
      publishedAt: DateTime(2023, 11, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/09/img2314-1661957336861132211956-16619581455561905292722-16619583501316590940.jpeg?v=1751373049',
    ),
    PlantArticle(
      id: 'nm25',
      title: 'Mô hình nhà lưới trồng hoa có thực sự hiệu quả?',
      summary: 'Đánh giá hiệu quả kinh tế của mô hình nhà lưới trồng hoa.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/mo-hinh-nha-luoi-trong-hoa-co-thuc-su-mang-lai-hieu-qua/',
      publishedAt: DateTime(2023, 11, 5),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/10/modfarm_roses_-3543-16-web.jpg?v=1751373042',
    ),
    PlantArticle(
      id: 'nm26',
      title: 'Lưu ý khi trồng dưa leo trong nhà kính',
      summary: 'Kỹ thuật và lưu ý chăm sóc dưa leo trong môi trường nhà kính.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/luu-y-khi-trong-dua-leo-trong-nha-kinh/',
      publishedAt: DateTime(2023, 10, 30),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/04/dua-leo-shizaz.jpg?v=1751373102',
    ),
    PlantArticle(
      id: 'nm27',
      title: 'Các mô hình trồng dưa lưới phổ biến nhất hiện nay',
      summary: 'Tổng hợp các mô hình trồng dưa lưới đang được ưa chuộng.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/cac-mo-hinh-trong-dua-luoi-pho-bien-nhat-hien-nay/',
      publishedAt: DateTime(2023, 10, 25),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/03/Trong-dua-luoi-trong-nha-mang-cong-nghe-cao.jpg?v=1751373845',
    ),
    PlantArticle(
      id: 'nm28',
      title: 'Kỹ thuật trồng dưa lưới trong nhà màng cho người mới',
      summary:
          'Hướng dẫn chi tiết quy trình trồng dưa lưới cho người mới bắt đầu.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/ky-thuat-trong-dua-luoi-trong-nha-mang-chi-tiet-cho-nguoi-moi-bat-dau/',
      publishedAt: DateTime(2023, 10, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/03/dua-luoi.jpg?v=1751373117',
    ),
    PlantArticle(
      id: 'nm29',
      title: 'Trồng dâu tây trong nhà kính đơn giản hiệu quả cao',
      summary: 'Bí quyết trồng dâu tây trong nhà kính sai quả, chất lượng.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/trong-dau-tay-trong-nha-kinh-don-gian-voi-hieu-qua-cao/',
      publishedAt: DateTime(2023, 10, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/08/1522643853831.jpg?v=1741149738',
    ),

    // Page 4
    PlantArticle(
      id: 'nm30',
      title: 'Phân loại các mô hình nhà lưới hiện nay',
      summary: 'Tìm hiểu về các loại hình nhà lưới phổ biến trong nông nghiệp.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/phan-loai-cac-mo-hinh-nha-luoi-hien-nay/',
      publishedAt: DateTime(2023, 10, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2020/07/IMG_4065.jpg?v=1751374058',
    ),
    PlantArticle(
      id: 'nm31',
      title: 'Một số thiết kế nhà lưới trồng rau sạch phổ biến',
      summary:
          'Các mẫu thiết kế nhà lưới trồng rau sạch được áp dụng rộng rãi.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/mot-so-thiet-ke-nha-luoi-trong-rau-sach-pho-bien/',
      publishedAt: DateTime(2023, 10, 5),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/06/Screen-Shot-2022-06-21-at-11.31.41.png?v=1751373840',
    ),
    PlantArticle(
      id: 'nm32',
      title: 'Cách làm nhà lưới trồng rau sạch hiệu quả',
      summary: 'Hướng dẫn thi công nhà lưới trồng rau sạch đạt chuẩn.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/cach-lam-nha-luoi-trong-rau-sach-hieu-qua/',
      publishedAt: DateTime(2023, 9, 30),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/thi-cong-nha-mang-300m2-03.jpg?v=1751373174',
    ),
    PlantArticle(
      id: 'nm33',
      title: 'Tự làm nhà lưới mini cho vườn diện tích nhỏ',
      summary: 'Giải pháp nhà lưới mini tiết kiệm cho không gian nhỏ hẹp.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/tu-lam-nha-luoi-mini-cho-vuon-dien-tich-nho/',
      publishedAt: DateTime(2023, 9, 25),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/10/4660090983_2ba7db6be9_b.jpg?v=1751373041',
    ),
    PlantArticle(
      id: 'nm34',
      title: 'Cẩm nang xây dựng nhà lưới trồng rau từ A-Z',
      summary: 'Trọn bộ kiến thức xây dựng nhà lưới trồng rau cho người mới.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/cam-nang-xay-dung-nha-luoi-trong-rau-tu-a-z/',
      publishedAt: DateTime(2023, 9, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/02/DSC07320-scaled-1.jpg?v=1751373124',
    ),
    PlantArticle(
      id: 'nm35',
      title: 'Chi phí làm nhà lưới từ 100m2 - 1000m2 là bao nhiêu?',
      summary: 'Bảng dự toán chi phí làm nhà lưới theo từng diện tích.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/chi-phi-lam-nha-luoi-tu-100m2-1000m2-la-bao-nhieu/',
      publishedAt: DateTime(2023, 9, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/thi-cong-nha-mang-300m2-04.jpg?v=1751373173',
    ),
    PlantArticle(
      id: 'nm36',
      title: 'Tất tần tật những điều cần biết khi đầu tư nhà lưới',
      summary:
          'Những thông tin quan trọng trước khi quyết định đầu tư nhà lưới.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/tat-tan-tat-nhung-dieu-ban-phai-biet-khi-dau-tu-nha-luoi/',
      publishedAt: DateTime(2023, 9, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/08/nha-luoi-la-gi.jpg?v=1751373920',
    ),
    PlantArticle(
      id: 'nm37',
      title: 'Những lưu ý khi làm nhà màng trồng rau sạch',
      summary: 'Các điểm cần lưu ý để có một nhà màng trồng rau hiệu quả.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/nhung-luu-y-khi-lam-nha-mang-trong-rau-sach-ma-ban-can-phai-biet/',
      publishedAt: DateTime(2023, 9, 5),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/05/he-thong-ong-tuoi-nho-giot-e1684377674761.jpg?v=1751373053',
    ),
    PlantArticle(
      id: 'nm38',
      title: 'Hướng dẫn trồng hoa hồng trong nhà màng',
      summary: 'Kỹ thuật trồng và chăm sóc hoa hồng trong nhà màng.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/huong-dan-trong-hoa-hong-trong-nha-mang-cho-nguoi-moi-bat-dau/',
      publishedAt: DateTime(2023, 8, 30),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/10/modfarm_roses_-3543-16-web.jpg?v=1751373042',
    ),
    PlantArticle(
      id: 'nm39',
      title: 'Thi công nhà màng trồng ớt chuông hết bao nhiêu tiền?',
      summary: 'Dự toán chi phí đầu tư nhà màng trồng ớt chuông.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/thi-cong-nha-mang-trong-ot-chuong-het-bao-nhieu-tien/',
      publishedAt: DateTime(2023, 8, 25),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/04/ot-chuong.jpg?v=1751373093',
    ),

    // Page 5
    PlantArticle(
      id: 'nm40',
      title: 'Có nên mua màng nhà kính Pro?',
      summary: 'Đánh giá chất lượng và hiệu quả của màng nhà kính Pro.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/co-nen-mua-mang-nha-kinh-pro/',
      publishedAt: DateTime(2023, 8, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/10/gia-thi-cong-nha-luoi-2019-1.gif?v=1751373043',
    ),
    PlantArticle(
      id: 'nm41',
      title: 'Kỹ thuật trồng hoa lan trong nhà màng',
      summary: 'Hướng dẫn trồng hoa lan trong nhà màng cho người mới chơi.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/ky-thuat-trong-hoa-lan-trong-nha-mang-cho-nguoi-moi-bat-dau/',
      publishedAt: DateTime(2023, 8, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/10/trong-hoa-lan-trong-nha-mang.jpg?v=1751373044',
    ),
    PlantArticle(
      id: 'nm42',
      title: 'Làm nhà màng trồng sen đá cần biết những điều này',
      summary: 'Kinh nghiệm xây dựng nhà màng chuyên dụng cho sen đá.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/lam-nha-mang-trong-sen-da-ban-can-biet-nhung-dieu-nay/',
      publishedAt: DateTime(2023, 8, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/10/Meo-cham-soc-sen-da-Thai-khong-he-kho-e1642884806746.jpg?v=1751373045',
    ),
    PlantArticle(
      id: 'nm43',
      title: 'Màng nhà kính Politiv: Thông tin và địa chỉ mua',
      summary: 'Giới thiệu về màng nhà kính Politiv và nơi cung cấp uy tín.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/mang-nha-kinh-politiv-thong-tin-ky-thuat-dia-chi-mua/',
      publishedAt: DateTime(2023, 8, 5),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/10/mang-nha-kinh-nong-nghiep-israel-politiv-gia-mang-nha-kinh-politiv-israel-bao-gia-mang-phu-nha-kinh-chi-phi-lam-nha-mang-0nOmYypERk.jpg?v=1751373047',
    ),
    PlantArticle(
      id: 'nm44',
      title: 'Làm nhà màng 300-1000m2 hết bao nhiêu tiền?',
      summary: 'Báo giá chi phí thi công nhà màng các diện tích phổ biến.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/lam-nha-mang-300-500-1000m2-het-bao-nhieu-tien/',
      publishedAt: DateTime(2023, 7, 30),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/12/256655552_1722794478058395_2379713961585753539_n.jpg?v=1751373902',
    ),
    PlantArticle(
      id: 'nm45',
      title: 'Nhà màng trồng hoa hồng: Nâng cao chất lượng, giảm rủi ro',
      summary: 'Lợi ích của việc ứng dụng nhà màng trong trồng hoa hồng.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/nha-mang-trong-hoa-hong-nang-cao-chat-luong-giam-thieu-rui-ro-cho-cac-chu-dau-tu/',
      publishedAt: DateTime(2023, 7, 25),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/09/LR_PHILIPS-LIGHTING-PORTANOVA-26569.jpg?v=1751373048',
    ),
    PlantArticle(
      id: 'nm46',
      title: 'Hiệu quả bất ngờ từ nhà màng trồng hoa cúc',
      summary: 'Năng suất và chất lượng hoa cúc tăng cao nhờ nhà màng.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/hieu-qua-bat-ngo-tu-viec-ung-dung-nha-mang-trong-hoa-cuc/',
      publishedAt: DateTime(2023, 7, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/09/img2314-1661957336861132211956-16619581455561905292722-16619583501316590940.jpeg?v=1751373049',
    ),
    PlantArticle(
      id: 'nm47',
      title: 'Tự làm nhà màng đơn giản tại nhà',
      summary: 'Hướng dẫn tự chế tạo nhà màng đơn giản, tiết kiệm chi phí.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/tu-lam-nha-mang-don-gian-tai-nha/',
      publishedAt: DateTime(2023, 7, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/08/nha-luoi-la-gi.jpg?v=1751373920',
    ),
    PlantArticle(
      id: 'nm48',
      title: 'Thi công nhà màng trồng rau thủy canh từ A-Z',
      summary: 'Quy trình thi công trọn gói nhà màng cho rau thủy canh.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/thi-cong-nha-mang-trong-rau-thuy-canh-tu-a-z/',
      publishedAt: DateTime(2023, 7, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/DSC9865-scaled-1.jpg?v=1751373168',
    ),

    // Page 6
    PlantArticle(
      id: 'nm49',
      title: 'Màng nông nghiệp có những loại nào? Mua ở đâu?',
      summary: 'Tổng hợp các loại màng nông nghiệp và địa chỉ bán hàng.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/mang-nong-nghiep-co-nhung-loai-nao-mua-o-dau/',
      publishedAt: DateTime(2023, 7, 5),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/mang-nha-kinh-polotiv.jpg?v=1751373176',
    ),
    PlantArticle(
      id: 'nm50',
      title: 'Danh sách và báo giá vật tư nhà kính tiêu biểu',
      summary: 'Cập nhật giá các loại vật tư nhà kính thông dụng.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/danh-sach-vat-tu-nha-kinh-va-bao-gia-cac-loai-vat-tu-nha-kinh-tieu-bieu/',
      publishedAt: DateTime(2023, 6, 30),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/04/IMG_5363-scaled-1.jpg?v=1751373070',
    ),
    PlantArticle(
      id: 'nm51',
      title: 'Báo giá các loại nhà màng nông nghiệp phổ biến',
      summary: 'Bảng giá thi công các mẫu nhà màng nông nghiệp hiện nay.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/bao-gia-cac-loai-nha-mang-nong-nghiep-pho-bien-nhat-hien-nay/',
      publishedAt: DateTime(2023, 6, 25),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/04/IMG_5372.jpg?v=1751373068',
    ),
    PlantArticle(
      id: 'nm52',
      title: 'Kỹ thuật trồng dưa leo trong nhà màng',
      summary: 'Quy trình kỹ thuật trồng dưa leo năng suất cao trong nhà màng.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/ky-thuat-trong-dua-leo-trong-nha-mang/',
      publishedAt: DateTime(2023, 6, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/IMG_5857.jpg?v=1751373161',
    ),
    PlantArticle(
      id: 'nm53',
      title: 'Trồng dưa lưới trong nhà màng cần lưu ý gì?',
      summary: 'Những điều cần tránh khi canh tác dưa lưới trong nhà màng.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/trong-dua-luoi-trong-nha-mang-can-luu-y-nhung-gi/',
      publishedAt: DateTime(2023, 6, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/03/dua-luoi-2.jpg?v=1751373116',
    ),
    PlantArticle(
      id: 'nm54',
      title: 'Kỹ thuật trồng dưa lưới trong nhà màng từ A-Z',
      summary: 'Hướng dẫn toàn tập về kỹ thuật trồng dưa lưới nhà màng.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/ky-thuat-trong-dua-luoi-trong-nha-mang-tu-a-z/',
      publishedAt: DateTime(2023, 6, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/03/Trong-dua-luoi-trong-nha-mang-cong-nghe-cao.jpg?v=1751373845',
    ),
    PlantArticle(
      id: 'nm55',
      title: 'Màng nilon nhà kính là gì? Loại nào tốt?',
      summary: 'Tư vấn lựa chọn màng nilon nhà kính phù hợp và bền bỉ.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/mang-nilon-nha-kinh-la-gi-nen-chon-loai-nao-tot/',
      publishedAt: DateTime(2023, 6, 5),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/08/mang-nilon-nha-kinh.jpg?v=1751373160',
    ),
    PlantArticle(
      id: 'nm56',
      title: 'Tổng hợp chi phí nhà màng trồng dưa leo 500m2',
      summary: 'Dự toán chi tiết cho mô hình trồng dưa leo 500m2.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/tong-hop-chi-phi-nha-mang-trong-dua-leo-500m2/',
      publishedAt: DateTime(2023, 5, 30),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/nha-mang-trong-dua-leo.jpg?v=1751373161',
    ),
    PlantArticle(
      id: 'nm57',
      title: 'Kỹ thuật trồng cà chua trong nhà màng',
      summary:
          'Phương pháp trồng cà chua trong nhà màng cho năng suất vượt trội.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/ky-thuat-trong-ca-chua-trong-nha-mang/',
      publishedAt: DateTime(2023, 5, 25),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/ky-thuat-trong-ca-chua-trong-nha-mang.jpg?v=1751373164',
    ),
    PlantArticle(
      id: 'nm58',
      title: 'Trồng rau trong nhà màng: Có nên hay không?',
      summary: 'Phân tích ưu nhược điểm của việc trồng rau trong nhà màng.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/trong-rau-trong-nha-mang-co-nen-hay-khong/',
      publishedAt: DateTime(2023, 5, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/08/batch_73215693_957925661224095_8391013555347914752_n.jpg?v=1751373146',
    ),

    // Page 7
    PlantArticle(
      id: 'nm59',
      title: 'Trồng cây gì trong nhà màng hiệu quả kinh tế cao?',
      summary:
          'Gợi ý các loại cây trồng mang lại lợi nhuận lớn trong nhà màng.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/trong-cay-gi-trong-nha-mang-mang-lai-hieu-qua-kinh-te-cao/',
      publishedAt: DateTime(2023, 5, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/02/255384032_1719367315067778_829217335307900554_n.jpg?v=1751373863',
    ),
    PlantArticle(
      id: 'nm60',
      title: '3 lưu ý khi lựa chọn vật tư nhà màng',
      summary: 'Kinh nghiệm chọn mua vật tư nhà màng chất lượng, giá tốt.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/3-luu-y-khi-lua-chon-vat-tu-nha-mang/',
      publishedAt: DateTime(2023, 5, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/vat-tu-nha-mang.jpg?v=1751373165',
    ),
    PlantArticle(
      id: 'nm61',
      title: 'Thi công nhà màng trồng rau uy tín nhất',
      summary: 'Dịch vụ thi công nhà màng trồng rau chuyên nghiệp, tin cậy.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/thi-cong-nha-mang-trong-rau-300-500-1000m2-uy-tin-nhat/',
      publishedAt: DateTime(2023, 5, 5),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/thi-cong-nha-mang-300m2-03.jpg?v=1751373174',
    ),
    PlantArticle(
      id: 'nm62',
      title: '7 bước làm nhà màng trên sân thượng',
      summary: 'Hướng dẫn từng bước tự làm nhà màng trên sân thượng.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/7-buoc-lam-nha-mang-tren-san-thuong/',
      publishedAt: DateTime(2023, 4, 30),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/lam-nha-mang-san-thuong.jpg?v=1751373169',
    ),
    PlantArticle(
      id: 'nm63',
      title: 'Chi phí xây dựng nhà màng cà chua 1000m2',
      summary: 'Tính toán chi phí đầu tư cho 1000m2 nhà màng trồng cà chua.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/chi-phi-xay-dung-nha-mang-ca-chua-cong-nghe-cao-1000m2/',
      publishedAt: DateTime(2023, 4, 25),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/nha-mang-trong-ca-chua.jpg?v=1751373175',
    ),
    PlantArticle(
      id: 'nm64',
      title: 'Màng nhà kính Politiv: Ưu và nhược điểm',
      summary: 'Đánh giá chi tiết về dòng màng nhà kính Politiv.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/mang-nha-kinh-politiv-la-gi-uu-nhuoc-diem-cua-mang-nha-kinh-politiv/',
      publishedAt: DateTime(2023, 4, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/mang-nha-kinh-polotiv-1.jpg?v=1751373176',
    ),
    PlantArticle(
      id: 'nm65',
      title: 'Các mẫu nhà màng mini cho diện tích nhỏ',
      summary: 'Bộ sưu tập các mẫu nhà màng mini đẹp và tiện dụng.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/cac-mau-nha-mang-mini-phu-hop-voi-dien-tich-nho/',
      publishedAt: DateTime(2023, 4, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/nha-mang-mini.jpg?v=1751373178',
    ),
    PlantArticle(
      id: 'nm66',
      title: 'Tất tần tật về chi phí làm nhà màng các loại',
      summary: 'Tổng hợp chi phí thi công các loại hình nhà màng khác nhau.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/tat-tan-tat-ve-chi-phi-lam-nha-mang-cac-loai/',
      publishedAt: DateTime(2023, 4, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/CHi-phi-lam-nha-mang-trong-rau.jpg?v=1751373816',
    ),
    PlantArticle(
      id: 'nm67',
      title: 'Vật liệu làm nhà kính trồng rau mua ở đâu giá tốt?',
      summary: 'Địa chỉ cung cấp vật liệu nhà kính giá rẻ, chất lượng.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/vat-lieu-lam-nha-kinh-trong-rau-mua-o-dau-gia-tot/',
      publishedAt: DateTime(2023, 4, 5),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/Vat-lieu-lam-nha-kinh.jpg?v=1751373817',
    ),
    PlantArticle(
      id: 'nm68',
      title: 'Top 5 nhà cung cấp màng che nhà kính uy tín',
      summary: 'Danh sách các đơn vị phân phối màng nhà kính hàng đầu.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/top-05-nha-cung-cap-mang-che-nha-kinh-uy-tin/',
      publishedAt: DateTime(2023, 3, 30),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/5-don-vi-cung-cap-vat-tu-nha-kinh.jpg?v=1751373817',
    ),

    // Page 8
    PlantArticle(
      id: 'nm69',
      title: 'Màng nhà kính là gì? Cách chọn loại phù hợp',
      summary: 'Kiến thức cơ bản và cách lựa chọn màng nhà kính.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/mang-nha-kinh-la-gi-cach-lua-chon-loai-mang-nha-kinh-phu-hop/',
      publishedAt: DateTime(2023, 3, 25),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/mang-nha-kinh-la-gi.jpg?v=1751373819',
    ),
    PlantArticle(
      id: 'nm70',
      title: 'Màng PE nhà kính là gì? Mua ở đâu?',
      summary: 'Tìm hiểu về màng PE và nơi bán uy tín.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/mang-pe-nha-kinh-la-gi-mua-o-dau/',
      publishedAt: DateTime(2023, 3, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/1.-nha-mang-hay-nha-kinh-1.jpg?v=1751373820',
    ),
    PlantArticle(
      id: 'nm71',
      title: 'Chi phí làm nhà màng trồng dưa lưới 1000m2',
      summary: 'Dự toán đầu tư cho 1000m2 nhà màng dưa lưới.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/chi-phi-lam-nha-mang-trong-dua-luoi-1000m2/',
      publishedAt: DateTime(2023, 3, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/Chi-phi-lam-nha-mang-trong-dua-luoi.jpg?v=1751373823',
    ),
    PlantArticle(
      id: 'nm72',
      title: 'Có nên đầu tư nhà màng trồng dưa lưới không?',
      summary: 'Phân tích tiềm năng và rủi ro khi đầu tư nhà màng dưa lưới.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/co-nen-dau-tu-nha-mang-trong-dua-luoi-khong/',
      publishedAt: DateTime(2023, 3, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/nha-mang-trong-dua-luoi.jpg?v=1751373824',
    ),
    PlantArticle(
      id: 'nm73',
      title: '5 lưu ý quan trọng khi lắp đặt nhà màng tại miền Bắc',
      summary: 'Kinh nghiệm thi công nhà màng phù hợp khí hậu miền Bắc.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/5-luu-y-quan-trong-khi-lap-dat-nha-mang-tai-mien-bac/',
      publishedAt: DateTime(2023, 3, 5),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/Luu-y-khi-lap-dat-nha-mang-tai-mien-bac.jpg?v=1751373827',
    ),
    PlantArticle(
      id: 'nm74',
      title: 'Các thiết kế nhà màng trồng rau phổ biến',
      summary: 'Giới thiệu các kiểu thiết kế nhà màng trồng rau thông dụng.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/cac-thiet-ke-nha-mang-trong-rau-pho-bien/',
      publishedAt: DateTime(2023, 2, 28),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/thiet-ke-nha-mang-trong-rau-pho-bien.jpg?v=1751373829',
    ),
    PlantArticle(
      id: 'nm75',
      title: 'Ưu điểm vượt trội của nhà màng trồng rau thủy canh',
      summary: 'Tại sao nên kết hợp nhà màng với mô hình thủy canh?',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/nhung-uu-diem-vuot-troi-cua-nha-mang-trong-rau-thuy-canh/',
      publishedAt: DateTime(2023, 2, 25),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/Uu-diem-vuot-troi-cua-nha-mang-thuy-canh.jpg?v=1751373826',
    ),
    PlantArticle(
      id: 'nm76',
      title: 'Nên chọn nhà màng hay nhà kính để trồng rau?',
      summary: 'So sánh ưu nhược điểm của nhà màng và nhà kính.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/nen-lua-chon-nha-mang-hay-nha-kinh-de-trong-rau/',
      publishedAt: DateTime(2023, 2, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/1.-nha-mang-hay-nha-kinh.jpg?v=1751373830',
    ),
    PlantArticle(
      id: 'nm77',
      title: 'Chi phí xây dựng nhà màng trồng rau công nghệ cao',
      summary: 'Đầu tư bao nhiêu cho mô hình nhà màng công nghệ cao?',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/chi-phi-xay-dung-nha-mang-trong-rau-cong-nghe-cao/',
      publishedAt: DateTime(2023, 2, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/2.-Chi-phi-xay-dung-nha-mang-cong-nghe-cao.jpg?v=1751373826',
    ),
    PlantArticle(
      id: 'nm78',
      title: '7 lưu ý trước khi thi công nhà màng Hachi',
      summary: 'Những điều cần chuẩn bị trước khi bắt tay vào làm nhà màng.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/7-luu-y-truoc-khi-thi-cong-nha-mang-hachi/',
      publishedAt: DateTime(2023, 2, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/06/DSC00477-scaled-1.jpg?v=1751373836',
    ),

    // Page 9
    PlantArticle(
      id: 'nm79',
      title: 'Lưu ý khi xây dựng nhà màng trồng cà chua',
      summary: 'Yêu cầu kỹ thuật khi làm nhà màng cho cây cà chua.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/nhung-luu-y-khi-xay-dung-nha-mang-trong-ca-chua/',
      publishedAt: DateTime(2023, 2, 5),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/05/3.-Luu-y-khi-xay-dung-nha-mang-trong-ca-chua.jpg?v=1751373829',
    ),
    PlantArticle(
      id: 'nm80',
      title: 'Thiết kế nhà màng trồng dưa lưới hiệu quả',
      summary: 'Mẫu thiết kế tối ưu cho việc trồng dưa lưới.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/thiet-ke-nha-mang-trong-dua-luoi-hieu-qua/',
      publishedAt: DateTime(2023, 1, 30),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/05/thiet-ke-nha-mang-trong-dua-luoi-hieu-qua.jpg?v=1751373829',
    ),
    PlantArticle(
      id: 'nm81',
      title: 'Các bước xây dựng nhà màng trồng dưa leo',
      summary: 'Quy trình thi công nhà màng chuyên canh dưa leo.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/cac-buoc-xay-dung-nha-mang-trong-dua-leo/',
      publishedAt: DateTime(2023, 1, 25),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/04/cac-buoc-xay-dung-nha-mang-trong-dua-leo.jpg?v=1751373825',
    ),
    PlantArticle(
      id: 'nm82',
      title: 'Những điểm đột phá của nhà màng công nghệ cao',
      summary: 'Công nghệ mới mang lại hiệu quả gì cho nhà màng?',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url:
          'https://hachi.com.vn/nhung-diem-dot-pha-cua-nha-mang-cong-nghe-cao/',
      publishedAt: DateTime(2023, 1, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2020/07/IMG_4065.jpg?v=1751374058',
    ),
    PlantArticle(
      id: 'nm83',
      title: 'Quy trình xây dựng nhà màng từ A-Z',
      summary: 'Các bước thực hiện dự án nhà màng hoàn chỉnh.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/quy-trinh-xay-dung-nha-mang-tu-a-z/',
      publishedAt: DateTime(2023, 1, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/02/DSC07318-scaled-1.jpg?v=1751373128',
    ),
    PlantArticle(
      id: 'nm84',
      title: 'Cấu tạo của nhà màng trồng rau',
      summary: 'Tìm hiểu chi tiết về kết cấu và thành phần của nhà màng.',
      source: 'Hachi News',
      category: ArticleCategory.nhaMang,
      url: 'https://hachi.com.vn/cau-tao-cua-nha-mang-trong-rau/',
      publishedAt: DateTime(2023, 1, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/70494024_414041742648303_5398669489006968832_n.jpg?v=1751373166',
    ),

    // DINH DƯỠNG THỦY CANH - Page 1 (10 articles)
    PlantArticle(
      id: 'dd1',
      title: 'Vườn dâu thủy canh Đà Lạt',
      summary:
          'Khám phá vườn dâu thủy canh đẹp nhất Đà Lạt với công nghệ hiện đại.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url: 'https://hachi.com.vn/vuon-dau-thuy-canh-da-lat/',
      publishedAt: DateTime(2024, 11, 1),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/11/vuon-dau-thuy-canh-da-lat-dep-nhat.jpg?v=1751369471',
    ),
    PlantArticle(
      id: 'dd2',
      title: 'Dung dịch thủy canh - Dinh dưỡng thủy canh',
      summary:
          'Hướng dẫn chi tiết về dung dịch và dinh dưỡng thủy canh cho cây trồng.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url: 'https://hachi.com.vn/dung-dich-thuy-canh-dinh-duong-thuy-canh/',
      publishedAt: DateTime(2024, 1, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/dung-dich-thuy-canh-dinh-duong-thuy-canh.jpg?v=1751370948',
    ),
    PlantArticle(
      id: 'dd3',
      title: 'Cách trồng dâu tây thủy canh',
      summary: 'Hướng dẫn chi tiết cách trồng dâu tây thủy canh tại nhà.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url: 'https://hachi.com.vn/cach-trong-trau-ba-thuy-canh/',
      publishedAt: DateTime(2024, 2, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/02/cach-trong-trau-ba-thuy-canh.png?v=1751370513',
    ),
    PlantArticle(
      id: 'dd4',
      title: 'Trồng rau thủy canh kết hợp nuôi cá',
      summary:
          'Mô hình Aquaponics - Kết hợp trồng rau thủy canh và nuôi cá hiệu quả.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url: 'https://hachi.com.vn/trong-rau-thuy-canh-ket-hop-nuoi-ca/',
      publishedAt: DateTime(2024, 2, 5),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/02/mo-hinh-aquaponics-trong-rau-thuy-canh-nuoi-ca-1-1.jpg?v=1751370537',
    ),
    PlantArticle(
      id: 'dd5',
      title: 'Trồng cây hương thảo thủy canh',
      summary:
          'Hướng dẫn trồng và chăm sóc cây hương thảo bằng phương pháp thủy canh.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url: 'https://hachi.com.vn/trong-cay-huong-thao-thuy-canh/',
      publishedAt: DateTime(2024, 1, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/trong-cay-huong-thao-thuy-canh-scaled.jpg?v=1751370636',
    ),
    PlantArticle(
      id: 'dd6',
      title: 'Trồng diếp cá thủy canh',
      summary: 'Kỹ thuật trồng rau diếp cá thủy canh đơn giản tại nhà.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url: 'https://hachi.com.vn/trong-diep-ca-thuy-canh/',
      publishedAt: DateTime(2024, 1, 18),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/trong-rau-riep-ca-thuy-canh-1-1.jpg?v=17513706564',
    ),
    PlantArticle(
      id: 'dd7',
      title: 'Trồng xà lách thủy canh',
      summary: 'Hướng dẫn trồng xà lách thủy canh cho năng suất cao.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url: 'https://hachi.com.vn/trong-sa-thuy-canh/',
      publishedAt: DateTime(2024, 1, 12),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/trong-sa-thuy-canh-1-1.jpg?v=1751370774',
    ),
    PlantArticle(
      id: 'dd8',
      title: 'Cách trồng hoa tulip thủy canh',
      summary: 'Trồng hoa tulip thủy canh - Phương pháp mới lạ và hiệu quả.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url: 'https://hachi.com.vn/cach-trong-hoa-tulip-thuy-canh/',
      publishedAt: DateTime(2024, 1, 8),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/trong-hoa-tulip-thuy-canh.jpg?v=1751370828',
    ),
    PlantArticle(
      id: 'dd9',
      title: 'Trồng hoa ly thủy canh',
      summary: 'Kỹ thuật trồng hoa ly thủy canh đẹp và dễ dàng.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url: 'https://hachi.com.vn/trong-hoa-ly-thuy-canh/',
      publishedAt: DateTime(2024, 1, 5),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/trong-hoa-ly-thuy-canh.jpg?v=1751370806',
    ),
    PlantArticle(
      id: 'dd10',
      title: 'Cách tự pha chế dung dịch thủy canh',
      summary: 'Hướng dẫn tự pha chế dung dịch dinh dưỡng thủy canh tại nhà.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url: 'https://hachi.com.vn/cach-tu-pha-che-dung-dich-thuy-canh/',
      publishedAt: DateTime(2024, 1, 3),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/cach-tu-pha-che-dung-dich-thuy-canh-1.jpg?v=1751370860',
    ),

    // DINH DƯỠNG THỦY CANH - Page 2 (19 articles)
    PlantArticle(
      id: 'dd11',
      title: 'Dung dịch thủy canh có làm chết cá không?',
      summary:
          'Giải đáp thắc mắc về tác động của dung dịch thủy canh đối với cá.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url: 'https://hachi.com.vn/dung-dich-thuy-canh-co-lam-chet-ca-khong/',
      publishedAt: DateTime(2023, 12, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/12/dung-dich-thuy-canh-co-lam-chet-ca-khong-thumb.jpg?v=1751370935',
    ),
    PlantArticle(
      id: 'dd12',
      title: 'Mua dung dịch thủy canh tại miền Bắc chất lượng cao',
      summary: 'Địa chỉ mua dung dịch thủy canh uy tín tại Hà Nội và miền Bắc.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url:
          'https://hachi.com.vn/mua-dung-dich-thuy-canh-tai-mien-bac-chat-luong-cao/',
      publishedAt: DateTime(2019, 9, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2019/09/batch_DSC00321.jpg?v=1751374086',
    ),
    PlantArticle(
      id: 'dd13',
      title: 'Xử lý dung dịch thủy canh sau khi sử dụng',
      summary: 'Cách xử lý và tái sử dụng dung dịch thủy canh hiệu quả.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url: 'https://hachi.com.vn/xu-ly-dung-dich-thuy-canh-sau-khi-su-dung/',
      publishedAt: DateTime(2021, 10, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/10/2010_be-loc-nuoc-gieng-khoan.jpg?v=1751373915',
    ),
    PlantArticle(
      id: 'dd14',
      title: 'Dung dịch thủy canh có an toàn không?',
      summary: 'Đánh giá độ an toàn của dung dịch thủy canh cho sức khỏe.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url: 'https://hachi.com.vn/dung-dich-thuy-canh-co-an-toan-khong/',
      publishedAt: DateTime(2023, 2, 5),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/02/DSC07318-scaled-1.jpg?v=1751373128',
    ),
    PlantArticle(
      id: 'dd15',
      title: 'Ảnh hưởng của nhiệt độ đến việc sử dụng dung dịch thủy canh',
      summary:
          'Tác động của nhiệt độ đến hiệu quả sử dụng dung dịch thủy canh.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url:
          'https://hachi.com.vn/anh-huong-cua-nhiet-do-den-viec-su-dung-dung-dich-thuy-canh/',
      publishedAt: DateTime(2021, 6, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/06/TNN04753-scaled-1.jpg?v=1751373998',
    ),
    PlantArticle(
      id: 'dd16',
      title: 'Lưu ý khi chọn mua và pha chế dung dịch thủy canh cho rau ăn lá',
      summary: 'Những điều cần biết khi mua và pha dung dịch cho rau ăn lá.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url:
          'https://hachi.com.vn/luu-y-khi-chon-mua-va-pha-che-dung-dich-thuy-canh-cho-rau-an-la/',
      publishedAt: DateTime(2021, 6, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/06/Banner-Hachi-02.jpg?v=1751373996',
    ),
    PlantArticle(
      id: 'dd17',
      title: 'Một số hiểu lầm thường gặp khi sử dụng dung dịch thủy canh',
      summary: 'Làm rõ những quan niệm sai lầm về dung dịch thủy canh.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url:
          'https://hachi.com.vn/mot-so-hieu-lam-thuong-gap-khi-su-dung-dung-dich-thuy-canh/',
      publishedAt: DateTime(2018, 11, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/11/42686551_319515395521698_4155300182214311936_n-1.png?v=1741149689',
    ),
    PlantArticle(
      id: 'dd18',
      title:
          'Ưu nhược điểm của dinh dưỡng thủy canh dạng bột và dạng dung dịch',
      summary: 'So sánh hai dạng dinh dưỡng thủy canh phổ biến.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url:
          'https://hachi.com.vn/uu-nhuoc-diem-cua-dinh-duong-thuy-canh-dang-bot-va-dinh-duong-thuy-canh-dang-dung-dich/',
      publishedAt: DateTime(2022, 2, 8),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/02/cong-thuc-dinh-duong-Hachi.jpg?v=1751373876',
    ),
    PlantArticle(
      id: 'dd19',
      title: 'Hướng dẫn pha dung dịch thủy canh hữu cơ tại nhà',
      summary: 'Cách pha chế dung dịch thủy canh hữu cơ an toàn.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url:
          'https://hachi.com.vn/huong-dan-pha-dung-dich-thuy-canh-huu-co-tai-nha/',
      publishedAt: DateTime(2021, 10, 5),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/10/Organic-Hydroponics.jpg?v=1751373913',
    ),
    PlantArticle(
      id: 'dd20',
      title: 'Lưu ý khi tự pha dung dịch thủy canh theo công thức có sẵn',
      summary: 'Những điều cần chú ý khi tự pha dung dịch thủy canh.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url:
          'https://hachi.com.vn/luu-y-khi-tu-pha-dung-dich-thuy-canh-theo-cong-thuc-co-san/',
      publishedAt: DateTime(2021, 8, 12),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/08/65765277_1040273909643792_2370962311218200576_o.jpg',
    ),
    PlantArticle(
      id: 'dd21',
      title: 'Những lưu ý về nguồn nước pha dung dịch thủy canh',
      summary: 'Chất lượng nguồn nước ảnh hưởng đến hiệu quả thủy canh.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url:
          'https://hachi.com.vn/nhung-luu-y-ve-nguon-nuoc-pha-dung-dich-thuy-canh/',
      publishedAt: DateTime(2021, 10, 8),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/10/2010_be-loc-nuoc-gieng-khoan-1.jpg?v=1751373914',
    ),
    PlantArticle(
      id: 'dd22',
      title: 'Dung dịch thủy canh cho rau ăn quả',
      summary: 'Công thức dung dịch thủy canh chuyên dụng cho rau ăn quả.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url: 'https://hachi.com.vn/dung-dich-thuy-canh-cho-rau-an-qua/',
      publishedAt: DateTime(2021, 9, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/09/31172289_1219937634809121_3529455466444750848_n.jpg?v=1751373916',
    ),
    PlantArticle(
      id: 'dd23',
      title: 'Hướng dẫn sử dụng dinh dưỡng thủy canh từ A-Z',
      summary: 'Hướng dẫn toàn diện về cách sử dụng dinh dưỡng thủy canh.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url:
          'https://hachi.com.vn/huong-dan-su-dung-dinh-duong-thuy-canh-tu-a-z/',
      publishedAt: DateTime(2019, 9, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2019/09/batch_DSC00449.jpg?v=1751374083',
    ),
    PlantArticle(
      id: 'dd24',
      title: 'Địa chỉ mua dinh dưỡng thủy canh ở Hà Nội uy tín nhất',
      summary: 'Top địa chỉ bán dinh dưỡng thủy canh chất lượng tại Hà Nội.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url:
          'https://hachi.com.vn/dia-chi-mua-dinh-duong-thuy-canh-o-ha-noi-uy-tin-nhat/',
      publishedAt: DateTime(2019, 5, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2019/05/batch_72696241_443028499663582_7185616707254222848_n.jpg?v=1751374075',
    ),
    PlantArticle(
      id: 'dd25',
      title: 'Mua dinh dưỡng thủy canh giá tốt nhất năm 2023',
      summary: 'Bảng giá và khuyến mãi dinh dưỡng thủy canh năm 2023.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url:
          'https://hachi.com.vn/mua-dinh-duong-thuy-canh-gia-tot-nhat-nam-2023/',
      publishedAt: DateTime(2021, 8, 5),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/08/IMG_0550-scaled-1.jpg',
    ),
    PlantArticle(
      id: 'dd26',
      title: 'Phân bón thủy canh có an toàn không?',
      summary: 'Đánh giá độ an toàn của phân bón thủy canh.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url: 'https://hachi.com.vn/phan-bon-thuy-canh-co-an-toan-khong/',
      publishedAt: DateTime(2019, 10, 12),
      image:
          'https://hachi.com.vn/wp-content/uploads/2019/10/Vietgap-HACHI-.jpg?v=1751374077',
    ),
    PlantArticle(
      id: 'dd27',
      title: 'Phân biệt các loại dung dịch dinh dưỡng thủy canh',
      summary: 'Cách nhận biết và lựa chọn dung dịch thủy canh phù hợp.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url:
          'https://hachi.com.vn/phan-biet-cac-loai-dung-dich-dinh-duong-thuy-canh/',
      publishedAt: DateTime(2021, 6, 18),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/06/TNN04753-scaled-1.jpg?v=1751373998',
    ),
    PlantArticle(
      id: 'dd28',
      title: 'Hydro Land V - Dung dịch thủy canh cao cấp',
      summary: 'Giới thiệu sản phẩm dung dịch thủy canh Hydro Land V.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url: 'https://hachi.com.vn/dung-dich-thuy-canh-dinh-duong-thuy-canh/',
      publishedAt: DateTime(2024, 1, 2),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/hydro-land-v.jpg?v=1751370939',
    ),
    PlantArticle(
      id: 'dd29',
      title: 'Điều cần lưu ý về dinh dưỡng thủy canh quy mô công nghiệp',
      summary:
          'Hướng dẫn sử dụng dinh dưỡng thủy canh cho sản xuất quy mô lớn.',
      source: 'Hachi',
      category: ArticleCategory.dinhDuong,
      url:
          'https://hachi.com.vn/dieu-can-luu-y-ve-dinh-duong-thuy-canh-quy-mo-cong-nghiep/',
      publishedAt: DateTime(2018, 2, 15),
      image: 'https://hachi.com.vn/wp-content/uploads/2018/02/ductd.jpg',
    ),
    PlantArticle(
      id: 'cnc5',
      title: 'Nhà kính trồng rau sạch: 10+ thông tin quan trọng bạn cần biết',
      summary:
          'Thông tin chi tiết về nhà kính trồng rau sạch: 10+ thông tin quan trọng bạn cần biết và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/nha-kinh-trong-rau-sach/',
      publishedAt: DateTime(2025, 04, 19),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/05/chi-phi-lm-nha-kinh-trong-rau-1-1.jpg?v=1751370328',
    ),
    PlantArticle(
      id: 'cnc6',
      title: 'Hệ thống tưới tự động: 10 +thông tin quan trọng nhất cần biết',
      summary:
          'Thông tin chi tiết về hệ thống tưới tự động: 10 +thông tin quan trọng nhất cần biết và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/he-thong-tuoi-tu-dong/',
      publishedAt: DateTime(2025, 04, 16),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/05/loi-ich-cua-he-thong-tuoi-tu-dong.jpg?v=1751370337',
    ),
    PlantArticle(
      id: 'cnc7',
      title: 'Kỹ thuật trồng dưa lê trong nhà màng hiệu quả gấp 2 lần',
      summary:
          'Thông tin chi tiết về kỹ thuật trồng dưa lê trong nhà màng hiệu quả gấp 2 lần và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/ky-thuat-trong-dua-le-trong-nha-mang/',
      publishedAt: DateTime(2025, 04, 13),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/05/cham-soc-dua-le-trong-trong-nha-mang.jpg?v=1751370342',
    ),
    PlantArticle(
      id: 'cnc8',
      title: 'Chi phí làm nhà màng giá rẻ? Ưu và nhược điểm',
      summary:
          'Thông tin chi tiết về chi phí làm nhà màng giá rẻ? ưu và nhược điểm và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/nha-mang-gia-re/',
      publishedAt: DateTime(2025, 04, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/05/gioi-thieu-nha-mang-gia-re.jpg?v=1751370355',
    ),
    PlantArticle(
      id: 'cnc9',
      title: 'Mô hình nông nghiệp bền vững: Mọi thông tin cần biết',
      summary:
          'Thông tin chi tiết về mô hình nông nghiệp bền vững: mọi thông tin cần biết và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/nong-nghiep-ben-vung/',
      publishedAt: DateTime(2025, 04, 07),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/05/Co-hoi-thach-thuc-khi-phat-trien-nen-nong-nghiep-ben-vung.jpg?v=1751370358',
    ),
    PlantArticle(
      id: 'cnc10',
      title: 'Mô hình nông nghiệp sinh thái: Mọi thông tin bạn cần biết',
      summary:
          'Thông tin chi tiết về mô hình nông nghiệp sinh thái: mọi thông tin bạn cần biết và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/nong-nghiep-sinh-thai/',
      publishedAt: DateTime(2025, 04, 04),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/05/nguyen-tac-tim-hieu-he-sinh-thai-nong-nghiep.jpg?v=1751370374',
    ),
    PlantArticle(
      id: 'cnc11',
      title:
          'Khái niệm nông nghiệp sạch? Mọi thông tin cần biết về mô hình này',
      summary:
          'Thông tin chi tiết về khái niệm nông nghiệp sạch? mọi thông tin cần biết về mô hình này và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/nong-nghiep-sach-moi-dieu-can-biet/',
      publishedAt: DateTime(2025, 04, 01),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/05/tieu-chi-danh-gia.jpg?v=1751370383',
    ),
    PlantArticle(
      id: 'cnc12',
      title:
          'Mọi thông tin cần biết về mô hình sản xuất nông nghiệp hữu cơ ở Việt Nam',
      summary:
          'Thông tin chi tiết về mọi thông tin cần biết về mô hình sản xuất nông nghiệp hữu cơ ở việt nam và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/nong-nghiep-huu-co-moi-dieu-can-biet/',
      publishedAt: DateTime(2025, 03, 29),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/05/loi-ich-cua-nong-nghiep-huu-co.jpg?v=1751370388',
    ),
    PlantArticle(
      id: 'cnc13',
      title:
          'Tìm hiểu về mô hình nông nghiệp thông minh ở Việt Nam và thế giới',
      summary:
          'Thông tin chi tiết về tìm hiểu về mô hình nông nghiệp thông minh ở việt nam và thế giới và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/mo-hinh-nong-nghiep-thong-minh/',
      publishedAt: DateTime(2025, 03, 26),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/05/ung-dung-robot-trong-nong-nghiep-thong-minh.jpg?v=1751370396',
    ),
    PlantArticle(
      id: 'cnc14',
      title:
          'Mô hình nông nghiệp tuần hoàn phát triển bền vững mang lại hiệu quả kinh tế cao',
      summary:
          'Thông tin chi tiết về mô hình nông nghiệp tuần hoàn phát triển bền vững mang lại hiệu quả kinh tế cao và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/mo-hinh-nong-nghiep-tuan-hoan/',
      publishedAt: DateTime(2025, 03, 23),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/05/dieu-kien-thuan-loi-cua-mo-hinh-nong-nghiep-tuan-hoan.jpg?v=1751370402',
    ),
    PlantArticle(
      id: 'cnc15',
      title: '5 Mô hình nông nghiệp hiệu quả phát triển bền vững nhất',
      summary:
          'Thông tin chi tiết về 5 mô hình nông nghiệp hiệu quả phát triển bền vững nhất và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/mo-hinh-nong-nghiep-hieu-qua/',
      publishedAt: DateTime(2025, 03, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/05/mo-hinh-ung-dung-cong-nghe-cao.jpg?v=1751370408',
    ),
    PlantArticle(
      id: 'cnc16',
      title: 'Nông nghiệp xanh là gì? 4 mô hình nông nghiệp xanh phổ biến',
      summary:
          'Thông tin chi tiết về nông nghiệp xanh là gì? 4 mô hình nông nghiệp xanh phổ biến và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/mo-hinh-nong-nghiep-xanh/',
      publishedAt: DateTime(2025, 03, 17),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/05/mo-hinh-nong-nghiep-xanh-la-gi.jpg?v=1751370431',
    ),
    PlantArticle(
      id: 'cnc17',
      title: '2 Cách trồng hoa Ly thủy canh chi tiết từ A - Z cho bà con',
      summary:
          'Thông tin chi tiết về 2 cách trồng hoa ly thủy canh chi tiết từ a - z cho bà con và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/trong-hoa-ly-thuy-canh/',
      publishedAt: DateTime(2025, 03, 14),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/trong-hoa-ly-thuy-canh.jpg?v=1751370806',
    ),
    PlantArticle(
      id: 'cnc18',
      title: '2 Cách tự pha chế dung dịch thủy canh đơn giản hiệu quả nhất',
      summary:
          'Thông tin chi tiết về 2 cách tự pha chế dung dịch thủy canh đơn giản hiệu quả nhất và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/cach-tu-pha-che-dung-dich-thuy-canh/',
      publishedAt: DateTime(2025, 03, 11),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/cach-tu-pha-che-dung-dich-thuy-canh-1.jpg?v=1751370860',
    ),
    PlantArticle(
      id: 'cnc19',
      title: 'Nẹp Ziczac là gì? Cách nẹp Ziczac nhà màng chuẩn nhất 2024',
      summary:
          'Thông tin chi tiết về nẹp ziczac là gì? cách nẹp ziczac nhà màng chuẩn nhất 2024 và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/cach-nep-ziczac-nha-mang/',
      publishedAt: DateTime(2025, 03, 08),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/12/cach-nep-ziczac-nha-mang-2.jpg?v=1751372921',
    ),
    PlantArticle(
      id: 'cnc20',
      title: 'Nha mang trong nho',
      summary:
          'Thông tin chi tiết về nha mang trong nho và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/nha-mang-trong-nho/',
      publishedAt: DateTime(2025, 03, 05),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/12/mo-hinh-nha-mang-trong-nho.jpg?v=1751372961',
    ),
    PlantArticle(
      id: 'cnc21',
      title: '2 Cách trồng tía tô thủy canh đơn giản tại nhà thành công 100%',
      summary:
          'Thông tin chi tiết về 2 cách trồng tía tô thủy canh đơn giản tại nhà thành công 100% và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/cach-trong-tia-to-thuy-canh/',
      publishedAt: DateTime(2025, 03, 02),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/12/cach-trong-tia-to-thuy-canh-don-gian.png?v=1751373001',
    ),
    PlantArticle(
      id: 'cnc22',
      title: 'Cách trồng rau thủy canh bằng ống nhựa PVC đúng cách (2023)',
      summary:
          'Thông tin chi tiết về cách trồng rau thủy canh bằng ống nhựa pvc đúng cách (2023) và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/cach-trong-rau-thuy-canh-bang-ong-nhua-pvc/',
      publishedAt: DateTime(2025, 02, 27),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/12/1-trong-rau-thuy-canh-bang-ong-nhua-pvc.png?v=1751372918',
    ),
    PlantArticle(
      id: 'cnc23',
      title: 'Top 7 tac dung cua nha kinh trong rau',
      summary:
          'Thông tin chi tiết về top 7 tac dung cua nha kinh trong rau và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/top-7-tac-dung-cua-nha-kinh-trong-rau/',
      publishedAt: DateTime(2025, 02, 24),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/DSC9865-scaled-1.jpg?v=1751373168',
    ),
    PlantArticle(
      id: 'cnc24',
      title: 'Làm nhà kính trồng nấm - bạn cần biết những điều này',
      summary:
          'Thông tin chi tiết về làm nhà kính trồng nấm - bạn cần biết những điều này và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/lam-nha-kinh-trong-nam-ban-can-biet-nhung-dieu-nay/',
      publishedAt: DateTime(2025, 02, 21),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/11/S3-2013_DTKHCN_nha-kinh_-BT_H06.jpg?v=1751373026',
    ),
    PlantArticle(
      id: 'cnc25',
      title: 'Lưới chống côn trùng nông nghiệp gồm những loại nào? Mua ở đâu?',
      summary:
          'Thông tin chi tiết về lưới chống côn trùng nông nghiệp gồm những loại nào? mua ở đâu? và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/luoi-chong-con-trung-nong-nghiep-gom-nhung-loai-nao-mua-o-dau/',
      publishedAt: DateTime(2025, 02, 18),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/11/luoi-chong-con-trung.jpeg?v=1751373027',
    ),
    PlantArticle(
      id: 'cnc26',
      title: 'Cách bố trí vườn rau đẹp tại nhà ấn tượng',
      summary:
          'Thông tin chi tiết về cách bố trí vườn rau đẹp tại nhà ấn tượng và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/cach-bo-tri-vuon-rau-dep-tai-nha-an-tuong/',
      publishedAt: DateTime(2025, 02, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/11/a12cb1594806060fdf38404bc4ad377e.jpg?v=1751373028',
    ),
    PlantArticle(
      id: 'cnc27',
      title: 'Những lưu ý khi đầu tư nhà kính trồng hoa',
      summary:
          'Thông tin chi tiết về những lưu ý khi đầu tư nhà kính trồng hoa và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/nhung-luu-y-khi-dau-tu-nha-kinh-trong-hoa/',
      publishedAt: DateTime(2025, 02, 12),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/09/img2314-1661957336861132211956-16619581455561905292722-16619583501316590940.jpeg?v=1751373049',
    ),
    PlantArticle(
      id: 'cnc28',
      title: 'Mô hình nhà lưới trồng hoa có thực sự mang lại hiệu quả',
      summary:
          'Thông tin chi tiết về mô hình nhà lưới trồng hoa có thực sự mang lại hiệu quả và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/mo-hinh-nha-luoi-trong-hoa-co-thuc-su-mang-lai-hieu-qua/',
      publishedAt: DateTime(2025, 02, 09),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/10/modfarm_roses_-3543-16-web.jpg?v=1751373042',
    ),
    PlantArticle(
      id: 'cnc29',
      title: 'Lưu ý khi trồng dưa leo trong nhà kính',
      summary:
          'Thông tin chi tiết về lưu ý khi trồng dưa leo trong nhà kính và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/luu-y-khi-trong-dua-leo-trong-nha-kinh/',
      publishedAt: DateTime(2025, 02, 06),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/04/dua-leo-shizaz.jpg?v=1751373102',
    ),
    PlantArticle(
      id: 'cnc30',
      title: 'Các mô hình trồng dưa lưới phổ biến nhất hiện nay',
      summary:
          'Thông tin chi tiết về các mô hình trồng dưa lưới phổ biến nhất hiện nay và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/cac-mo-hinh-trong-dua-luoi-pho-bien-nhat-hien-nay/',
      publishedAt: DateTime(2025, 02, 03),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/03/Trong-dua-luoi-trong-nha-mang-cong-nghe-cao.jpg?v=1751373845',
    ),
    PlantArticle(
      id: 'cnc31',
      title:
          'Kỹ thuật trồng dưa lưới trong nhà màng chi tiết cho người mới bắt đầu',
      summary:
          'Thông tin chi tiết về kỹ thuật trồng dưa lưới trong nhà màng chi tiết cho người mới bắt đầu và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/ky-thuat-trong-dua-luoi-trong-nha-mang-chi-tiet-cho-nguoi-moi-bat-dau/',
      publishedAt: DateTime(2025, 01, 31),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/03/dua-luoi.jpg?v=1751373117',
    ),
    PlantArticle(
      id: 'cnc32',
      title: 'Trong dau tay trong nha kinh don gian voi hieu qua cao',
      summary:
          'Thông tin chi tiết về trong dau tay trong nha kinh don gian voi hieu qua cao và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/trong-dau-tay-trong-nha-kinh-don-gian-voi-hieu-qua-cao/',
      publishedAt: DateTime(2025, 01, 28),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/08/1522643853831.jpg?v=1741149738',
    ),
    PlantArticle(
      id: 'cnc33',
      title: 'Báo giá chi phí thi công nhà màng chi tiết A-Z mới nhất 2025',
      summary:
          'Thông tin chi tiết về báo giá chi phí thi công nhà màng chi tiết a-z mới nhất 2025 và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/phan-loai-cac-mo-hinh-nha-luoi-hien-nay/',
      publishedAt: DateTime(2025, 01, 25),
      image:
          'https://hachi.com.vn/wp-content/uploads/2020/07/IMG_4065.jpg?v=1751374058',
    ),
    PlantArticle(
      id: 'cnc34',
      title: 'Một số thiết kế nhà lưới trồng rau sạch phổ biến',
      summary:
          'Thông tin chi tiết về một số thiết kế nhà lưới trồng rau sạch phổ biến và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/mot-so-thiet-ke-nha-luoi-trong-rau-sach-pho-bien/',
      publishedAt: DateTime(2025, 01, 22),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/06/Screen-Shot-2022-06-21-at-11.31.41.png?v=1751373840',
    ),
    PlantArticle(
      id: 'cnc35',
      title: 'Cách làm nhà lưới trồng rau sạch hiệu quả',
      summary:
          'Thông tin chi tiết về cách làm nhà lưới trồng rau sạch hiệu quả và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/cach-lam-nha-luoi-trong-rau-sach-hieu-qua/',
      publishedAt: DateTime(2025, 01, 19),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/thi-cong-nha-mang-300m2-03.jpg?v=1751373174',
    ),
    PlantArticle(
      id: 'cnc36',
      title: 'Tự làm nhà lưới mini cho vườn diện tích nhỏ',
      summary:
          'Thông tin chi tiết về tự làm nhà lưới mini cho vườn diện tích nhỏ và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/tu-lam-nha-luoi-mini-cho-vuon-dien-tich-nho/',
      publishedAt: DateTime(2025, 01, 16),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/10/4660090983_2ba7db6be9_b.jpg?v=1751373041',
    ),
    PlantArticle(
      id: 'cnc37',
      title: 'Cẩm nang xây dựng nhà lưới trồng rau từ A - Z',
      summary:
          'Thông tin chi tiết về cẩm nang xây dựng nhà lưới trồng rau từ a - z và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/cam-nang-xay-dung-nha-luoi-trong-rau-tu-a-z/',
      publishedAt: DateTime(2025, 01, 13),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/02/DSC07320-scaled-1.jpg?v=1751373124',
    ),
    PlantArticle(
      id: 'cnc38',
      title: 'Chi phí làm nhà lưới từ 100m2 - 1000m2 là bao nhiêu?',
      summary:
          'Thông tin chi tiết về chi phí làm nhà lưới từ 100m2 - 1000m2 là bao nhiêu? và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/chi-phi-lam-nha-luoi-tu-100m2-1000m2-la-bao-nhieu/',
      publishedAt: DateTime(2025, 01, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/thi-cong-nha-mang-300m2-04.jpg?v=1751373173',
    ),
    PlantArticle(
      id: 'cnc39',
      title: '3 loại nhà màng trồng rau nông nghiệp công nghệ cao, giá tốt',
      summary:
          'Thông tin chi tiết về 3 loại nhà màng trồng rau nông nghiệp công nghệ cao, giá tốt và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/tat-tan-tat-nhung-dieu-ban-phai-biet-khi-dau-tu-nha-luoi/',
      publishedAt: DateTime(2025, 01, 07),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/08/nha-luoi-la-gi.jpg?v=1751373920',
    ),
    PlantArticle(
      id: 'cnc40',
      title: 'Các kiểu giàn cà chua phổ biến và cách làm',
      summary:
          'Thông tin chi tiết về các kiểu giàn cà chua phổ biến và cách làm và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/cac-kieu-gian-ca-chua-pho-bien-va-cach-lam/',
      publishedAt: DateTime(2025, 01, 04),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/10/333066019-873680367051106-9066703055999636361-n-1681523604.jpg?v=1751373041',
    ),
    PlantArticle(
      id: 'cnc41',
      title: 'Trồng cà chua tháng mấy cho năng suất cao',
      summary:
          'Thông tin chi tiết về trồng cà chua tháng mấy cho năng suất cao và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/trong-ca-chua-thang-may-cho-nang-suat-cao/',
      publishedAt: DateTime(2025, 01, 01),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/02/Trang-trai-tuoi-nho-giot-ca-chua-Banner-03.jpg',
    ),
    PlantArticle(
      id: 'cnc42',
      title: 'Những lưu ý khi làm nhà màng trồng rau sạch mà bạn cần phải biết',
      summary:
          'Thông tin chi tiết về những lưu ý khi làm nhà màng trồng rau sạch mà bạn cần phải biết và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/nhung-luu-y-khi-lam-nha-mang-trong-rau-sach-ma-ban-can-phai-biet/',
      publishedAt: DateTime(2024, 12, 29),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/05/he-thong-ong-tuoi-nho-giot-e1684377674761.jpg?v=1751373053',
    ),
    PlantArticle(
      id: 'cnc43',
      title: 'Hướng dẫn trồng hoa hồng trong nhà màng cho người mới bắt đầu',
      summary:
          'Thông tin chi tiết về hướng dẫn trồng hoa hồng trong nhà màng cho người mới bắt đầu và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/huong-dan-trong-hoa-hong-trong-nha-mang-cho-nguoi-moi-bat-dau/',
      publishedAt: DateTime(2024, 12, 26),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/10/modfarm_roses_-3543-16-web.jpg?v=1751373042',
    ),
    PlantArticle(
      id: 'cnc44',
      title: 'Cách sử dụng đèn LED trồng cây đúng cho năng suất cao',
      summary:
          'Thông tin chi tiết về cách sử dụng đèn led trồng cây đúng cho năng suất cao và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/cach-su-dung-den-led-trong-cay-dung-cho-nang-suat-cao/',
      publishedAt: DateTime(2024, 12, 23),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/07/IMG_8808-2-scaled-1.jpg?v=1751373964',
    ),
    PlantArticle(
      id: 'cnc45',
      title: 'Có nên mua màng nhà kính pro?',
      summary:
          'Thông tin chi tiết về có nên mua màng nhà kính pro? và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/co-nen-mua-mang-nha-kinh-pro/',
      publishedAt: DateTime(2024, 12, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/10/gia-thi-cong-nha-luoi-2019-1.gif?v=1751373043',
    ),
    PlantArticle(
      id: 'cnc46',
      title: 'Kỹ thuật trồng hoa lan trong nhà màng cho người mới bắt đầu',
      summary:
          'Thông tin chi tiết về kỹ thuật trồng hoa lan trong nhà màng cho người mới bắt đầu và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/ky-thuat-trong-hoa-lan-trong-nha-mang-cho-nguoi-moi-bat-dau/',
      publishedAt: DateTime(2024, 12, 17),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/10/trong-hoa-lan-trong-nha-mang.jpg?v=1751373044',
    ),
    PlantArticle(
      id: 'cnc47',
      title: 'Làm nhà màng trồng sen đá - Bạn cần biết những điều này',
      summary:
          'Thông tin chi tiết về làm nhà màng trồng sen đá - bạn cần biết những điều này và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/lam-nha-mang-trong-sen-da-ban-can-biet-nhung-dieu-nay/',
      publishedAt: DateTime(2024, 12, 14),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/10/Meo-cham-soc-sen-da-Thai-khong-he-kho-e1642884806746.jpg?v=1751373045',
    ),
    PlantArticle(
      id: 'cnc48',
      title: 'Màng nhà kính Politiv - Thông tin kỹ thuật, địa chỉ mua?',
      summary:
          'Thông tin chi tiết về màng nhà kính politiv - thông tin kỹ thuật, địa chỉ mua? và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/mang-nha-kinh-politiv-thong-tin-ky-thuat-dia-chi-mua/',
      publishedAt: DateTime(2024, 12, 11),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/10/mang-nha-kinh-nong-nghiep-israel-politiv-gia-mang-nha-kinh-politiv-israel-bao-gia-mang-phu-nha-kinh-chi-phi-lam-nha-mang-0nOmYypERk.jpg?v=1751373047',
    ),
    PlantArticle(
      id: 'cnc49',
      title: 'Nhà màng trồng hoa lan và những điều bạn cần biết',
      summary:
          'Thông tin chi tiết về nhà màng trồng hoa lan và những điều bạn cần biết và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/nha-mang-trong-hoa-lan-va-nhung-dieu-ban-can-biet/',
      publishedAt: DateTime(2024, 12, 08),
      image:
          'https://hachi.com.vn/wp-content/uploads/2020/07/nhakinhtronglan.jpg?v=1751374056',
    ),
    PlantArticle(
      id: 'cnc50',
      title: 'Làm nhà màng 300, 500, 1000m2 hết bao nhiêu tiền',
      summary:
          'Thông tin chi tiết về làm nhà màng 300, 500, 1000m2 hết bao nhiêu tiền và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/lam-nha-mang-300-500-1000m2-het-bao-nhieu-tien/',
      publishedAt: DateTime(2024, 12, 05),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/12/256655552_1722794478058395_2379713961585753539_n.jpg?v=1751373902',
    ),
    PlantArticle(
      id: 'cnc51',
      title:
          'Nhà màng trồng hoa hồng - nâng cao chất lượng, giảm thiểu rủi ro cho các chủ đầu tư',
      summary:
          'Thông tin chi tiết về nhà màng trồng hoa hồng - nâng cao chất lượng, giảm thiểu rủi ro cho các chủ đầu tư và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/nha-mang-trong-hoa-hong-nang-cao-chat-luong-giam-thieu-rui-ro-cho-cac-chu-dau-tu/',
      publishedAt: DateTime(2024, 12, 02),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/09/LR_PHILIPS-LIGHTING-PORTANOVA-26569.jpg?v=1751373048',
    ),
    PlantArticle(
      id: 'cnc52',
      title: 'Hiệu quả bất ngờ từ việc ứng dụng nhà màng trồng hoa cúc',
      summary:
          'Thông tin chi tiết về hiệu quả bất ngờ từ việc ứng dụng nhà màng trồng hoa cúc và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/hieu-qua-bat-ngo-tu-viec-ung-dung-nha-mang-trong-hoa-cuc/',
      publishedAt: DateTime(2024, 11, 29),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/09/img2314-1661957336861132211956-16619581455561905292722-16619583501316590940.jpeg?v=1751373049',
    ),
    PlantArticle(
      id: 'cnc53',
      title: 'Tự làm nhà màng đơn giản tại nhà',
      summary:
          'Thông tin chi tiết về tự làm nhà màng đơn giản tại nhà và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/tu-lam-nha-mang-don-gian-tai-nha/',
      publishedAt: DateTime(2024, 11, 26),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/08/nha-luoi-la-gi.jpg?v=1751373920',
    ),
    PlantArticle(
      id: 'cnc54',
      title: 'Thi công nhà màng trồng rau thuỷ canh từ A-Z',
      summary:
          'Thông tin chi tiết về thi công nhà màng trồng rau thuỷ canh từ a-z và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/thi-cong-nha-mang-trong-rau-thuy-canh-tu-a-z/',
      publishedAt: DateTime(2024, 11, 23),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/DSC9865-scaled-1.jpg?v=1751373168',
    ),
    PlantArticle(
      id: 'cnc55',
      title: 'Màng nông nghiệp có những loại nào? Mua ở đâu?',
      summary:
          'Thông tin chi tiết về màng nông nghiệp có những loại nào? mua ở đâu? và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/mang-nong-nghiep-co-nhung-loai-nao-mua-o-dau/',
      publishedAt: DateTime(2024, 11, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/mang-nha-kinh-polotiv.jpg?v=1751373176',
    ),
    PlantArticle(
      id: 'cnc56',
      title:
          'Danh sách vật tư nhà kính và báo giá các loại vật tư nhà kính tiêu biểu',
      summary:
          'Thông tin chi tiết về danh sách vật tư nhà kính và báo giá các loại vật tư nhà kính tiêu biểu và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/danh-sach-vat-tu-nha-kinh-va-bao-gia-cac-loai-vat-tu-nha-kinh-tieu-bieu/',
      publishedAt: DateTime(2024, 11, 17),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/04/IMG_5363-scaled-1.jpg?v=1751373070',
    ),
    PlantArticle(
      id: 'cnc57',
      title: 'Bí kíp tiết kiệm chi phí duy trì trong trang trại thuỷ canh',
      summary:
          'Thông tin chi tiết về bí kíp tiết kiệm chi phí duy trì trong trang trại thuỷ canh và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/bi-kip-tiet-kiem-chi-phi-duy-tri-trong-trang-trai-thuy-canh/',
      publishedAt: DateTime(2024, 11, 14),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/08/batch_73215693_957925661224095_8391013555347914752_n.jpg?v=1751373146',
    ),
    PlantArticle(
      id: 'cnc58',
      title: 'Tháng 8 trồng rau gì tại miền Bắc',
      summary:
          'Thông tin chi tiết về tháng 8 trồng rau gì tại miền bắc và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/thang-8-trong-rau-gi-tai-mien-bac/',
      publishedAt: DateTime(2024, 11, 11),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/02/anh-harau-2.jpg?v=1751373884',
    ),
    PlantArticle(
      id: 'cnc59',
      title: 'Trụ trồng rau thủy canh nhiều kích thước - Giá rẻ chất lượng',
      summary:
          'Thông tin chi tiết về trụ trồng rau thủy canh nhiều kích thước - giá rẻ chất lượng và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/thuy-canh-tru-dung-la-gi-uu-nhuoc-diem-ban-can-biet-truoc-khi-dau-tu-mo-hinh-nay/',
      publishedAt: DateTime(2024, 11, 08),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/07/thuy-canh-tru-dung.jpg?v=1751373052',
    ),
    PlantArticle(
      id: 'cnc60',
      title: 'Địa chỉ mua dinh dưỡng thủy canh ở Hà Nội uy tín nhất',
      summary:
          'Thông tin chi tiết về địa chỉ mua dinh dưỡng thủy canh ở hà nội uy tín nhất và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/mua-dung-dich-thuy-canh-tai-mien-bac-chat-luong-cao/',
      publishedAt: DateTime(2024, 11, 05),
      image:
          'https://hachi.com.vn/wp-content/uploads/2019/09/batch_DSC00321.jpg?v=1751374086',
    ),
    PlantArticle(
      id: 'cnc61',
      title: 'Xử lý dung dịch thuỷ canh sau khi sử dụng',
      summary:
          'Thông tin chi tiết về xử lý dung dịch thuỷ canh sau khi sử dụng và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/xu-ly-dung-dich-thuy-canh-sau-khi-su-dung/',
      publishedAt: DateTime(2024, 11, 02),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/10/2010_be-loc-nuoc-gieng-khoan.jpg?v=1751373915',
    ),
    PlantArticle(
      id: 'cnc62',
      title: 'Dung dịch thủy canh có an toàn không? Có độc và nguy hiểm?',
      summary:
          'Thông tin chi tiết về dung dịch thủy canh có an toàn không? có độc và nguy hiểm? và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/dung-dich-thuy-canh-co-an-toan-khong/',
      publishedAt: DateTime(2024, 10, 30),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/02/DSC07318-scaled-1.jpg?v=1751373128',
    ),
    PlantArticle(
      id: 'cnc63',
      title: 'Ảnh hưởng của nhiệt độ đến việc sử dụng dung dịch thuỷ canh',
      summary:
          'Thông tin chi tiết về ảnh hưởng của nhiệt độ đến việc sử dụng dung dịch thuỷ canh và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/anh-huong-cua-nhiet-do-den-viec-su-dung-dung-dich-thuy-canh/',
      publishedAt: DateTime(2024, 10, 27),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/06/TNN04753-scaled-1.jpg?v=1751373998',
    ),
    PlantArticle(
      id: 'cnc64',
      title: 'Dung dịch thủy canh: 10+ Thông tin bạn cần phải biết khi mua',
      summary:
          'Thông tin chi tiết về dung dịch thủy canh: 10+ thông tin bạn cần phải biết khi mua và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/luu-y-khi-chon-mua-va-pha-che-dung-dich-thuy-canh-cho-rau-an-la/',
      publishedAt: DateTime(2024, 10, 24),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/06/Banner-Hachi-02.jpg?v=1751373996',
    ),
    PlantArticle(
      id: 'cnc65',
      title: 'Một số hiểu lầm thường gặp khi sử dụng dung dịch thuỷ canh',
      summary:
          'Thông tin chi tiết về một số hiểu lầm thường gặp khi sử dụng dung dịch thuỷ canh và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/mot-so-hieu-lam-thuong-gap-khi-su-dung-dung-dich-thuy-canh/',
      publishedAt: DateTime(2024, 10, 21),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/11/42686551_319515395521698_4155300182214311936_n-1.png?v=1741149689',
    ),
    PlantArticle(
      id: 'cnc66',
      title: 'Ống tưới nhỏ giọt là gì? Phân loại các loại ống tưới nhỏ giọt',
      summary:
          'Thông tin chi tiết về ống tưới nhỏ giọt là gì? phân loại các loại ống tưới nhỏ giọt và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/ong-tuoi-nho-giot-la-gi-phan-loai-cac-loai-ong-tuoi-nho-giot/',
      publishedAt: DateTime(2024, 10, 18),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/04/trong-sup-lo-tuoi-nho-giot-e1681288412654.png?v=1751373079',
    ),
    PlantArticle(
      id: 'cnc67',
      title: 'Thi công hệ thống tưới nhỏ giọt hiệu quả tiết kiệm chi phí',
      summary:
          'Thông tin chi tiết về thi công hệ thống tưới nhỏ giọt hiệu quả tiết kiệm chi phí và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/thi-cong-he-thong-tuoi-nho-giot-hieu-qua-tiet-kiem-chi-phi/',
      publishedAt: DateTime(2024, 10, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/05/254543693_1722794774725032_3746253675540292668_n.jpg?v=1751373055',
    ),
    PlantArticle(
      id: 'cnc68',
      title: 'Báo giá chi phí thi công nhà màng chi tiết A-Z mới nhất 2025',
      summary:
          'Thông tin chi tiết về báo giá chi phí thi công nhà màng chi tiết a-z mới nhất 2025 và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/bao-gia-cac-loai-nha-mang-nong-nghiep-pho-bien-nhat-hien-nay/',
      publishedAt: DateTime(2024, 10, 12),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/04/IMG_5372-500x375.jpg?v=1751373068',
    ),
    PlantArticle(
      id: 'cnc69',
      title:
          'Chi phí lắp đặt hệ thống tưới nhỏ giọt cho rau ăn quả, cây ăn quả là bao nhiêu?',
      summary:
          'Thông tin chi tiết về chi phí lắp đặt hệ thống tưới nhỏ giọt cho rau ăn quả, cây ăn quả là bao nhiêu? và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/chi-phi-lap-dat-he-thong-tuoi-nho-giot-cho-rau-an-qua-cay-an-qua-la-bao-nhieu/',
      publishedAt: DateTime(2024, 10, 09),
      image:
          'https://hachi.com.vn/wp-content/uploads/2020/01/batch_82668750_485681205485135_301681767046184960_n-500x375.jpg?v=1751374064',
    ),
    PlantArticle(
      id: 'cnc70',
      title:
          'Thi công hệ thống tưới nhỏ giọt cho cây ăn quả uy tín giá cạnh tranh',
      summary:
          'Thông tin chi tiết về thi công hệ thống tưới nhỏ giọt cho cây ăn quả uy tín giá cạnh tranh và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/thi-cong-he-thong-tuoi-nho-giot-cho-cay-an-qua-uy-tin-gia-canh-tranh/',
      publishedAt: DateTime(2024, 10, 06),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/04/Trong-du-du-tuoi-nho-giot-3-500x333.jpg?v=1751373077',
    ),
    PlantArticle(
      id: 'cnc71',
      title: 'Nên trồng dưa chuột tháng mấy cho năng suất cao',
      summary:
          'Thông tin chi tiết về nên trồng dưa chuột tháng mấy cho năng suất cao và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/nen-trong-dua-chuot-thang-may-cho-nang-suat-cao/',
      publishedAt: DateTime(2024, 10, 03),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/03/dua-leo-500x319.jpeg?v=1751373114',
    ),
    PlantArticle(
      id: 'cnc72',
      title:
          'Trồng và chăm sóc cây sầu riêng với hệ thống tưới nhỏ giọt như thế nào?',
      summary:
          'Thông tin chi tiết về trồng và chăm sóc cây sầu riêng với hệ thống tưới nhỏ giọt như thế nào? và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/trong-va-cham-soc-cay-sau-rieng-voi-he-thong-tuoi-nho-giot-nhu-the-nao/',
      publishedAt: DateTime(2024, 09, 30),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/04/trong-va-cham-soc-sau-rieng-voi-he-thong-tuoi-nho-giot-1-500x375.jpg?v=1751373075',
    ),
    PlantArticle(
      id: 'cnc73',
      title: 'Các bước trồng đu đủ trên quy mô lớn với hệ thống tưới nhỏ giọt',
      summary:
          'Thông tin chi tiết về các bước trồng đu đủ trên quy mô lớn với hệ thống tưới nhỏ giọt và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/cac-buoc-trong-du-du-tren-quy-mo-lon-voi-he-thong-tuoi-nho-giot/',
      publishedAt: DateTime(2024, 09, 27),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/04/Trong-du-du-tuoi-nho-giot-1-500x375.jpg?v=1751373075',
    ),
    PlantArticle(
      id: 'cnc74',
      title: 'Mô hình trồng súp lơ với hệ thống tưới nhỏ giọt',
      summary:
          'Thông tin chi tiết về mô hình trồng súp lơ với hệ thống tưới nhỏ giọt và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/mo-hinh-trong-sup-lo-voi-he-thong-tuoi-nho-giot/',
      publishedAt: DateTime(2024, 09, 24),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/04/trong-sup-lo-tuoi-nho-giot-2-500x333.jpeg?v=1751373080',
    ),
    PlantArticle(
      id: 'cnc75',
      title: 'Quy trình trồng ớt chuông theo phương pháp tưới nhỏ giọt',
      summary:
          'Thông tin chi tiết về quy trình trồng ớt chuông theo phương pháp tưới nhỏ giọt và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/quy-trinh-trong-ot-chuong-theo-phuong-phap-tuoi-nho-giot/',
      publishedAt: DateTime(2024, 09, 21),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/04/ot-chuong-500x333.jpg?v=1751373093',
    ),
    PlantArticle(
      id: 'cnc76',
      title: 'Hướng dẫn trồng nhãn theo phương pháp tưới nhỏ giọt từ A-Z',
      summary:
          'Thông tin chi tiết về hướng dẫn trồng nhãn theo phương pháp tưới nhỏ giọt từ a-z và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/huong-dan-trong-nhan-theo-phuong-phap-tuoi-nho-giot-tu-a-z/',
      publishedAt: DateTime(2024, 09, 18),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/04/cham-soc-cay-nhan-500x333.jpg?v=1751373094',
    ),
    PlantArticle(
      id: 'cnc77',
      title:
          'Quy trình trồng và chăm sóc cây vải thiều theo phương pháp tưới nhỏ giọt',
      summary:
          'Thông tin chi tiết về quy trình trồng và chăm sóc cây vải thiều theo phương pháp tưới nhỏ giọt và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/quy-trinh-trong-va-cham-soc-cay-vai-thieu-theo-phuong-phap-tuoi-nho-giot/',
      publishedAt: DateTime(2024, 09, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/04/vai-thieu-1-500x375.jpg?v=1751373099',
    ),
    PlantArticle(
      id: 'cnc78',
      title: 'Quy trình trồng và chăm sóc bưởi theo phương pháp tưới nhỏ giọt',
      summary:
          'Thông tin chi tiết về quy trình trồng và chăm sóc bưởi theo phương pháp tưới nhỏ giọt và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/quy-trinh-trong-va-cham-soc-buoi-theo-phuong-phap-tuoi-nho-giot/',
      publishedAt: DateTime(2024, 09, 12),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/04/cay-buoi-500x368.jpg?v=1751373101',
    ),
    PlantArticle(
      id: 'cnc79',
      title: 'Top 6 giống dưa leo cho năng suất cao',
      summary:
          'Thông tin chi tiết về top 6 giống dưa leo cho năng suất cao và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/top-6-giong-dua-leo-cho-nang-suat-cao/',
      publishedAt: DateTime(2024, 09, 09),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/03/he-thong-trong-dua-500x346.jpg?v=1751373110',
    ),
    PlantArticle(
      id: 'cnc80',
      title: 'Thông tin đầy đủ về cây dưa leo',
      summary:
          'Thông tin chi tiết về thông tin đầy đủ về cây dưa leo và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/thong-tin-day-du-ve-cay-dua-leo/',
      publishedAt: DateTime(2024, 09, 06),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/05/green-house-cucumber-510x335.jpg?v=1741149777',
    ),
    PlantArticle(
      id: 'cnc81',
      title: 'Quy trình trồng dưa leo tại nhà đơn giản trên nền đất',
      summary:
          'Thông tin chi tiết về quy trình trồng dưa leo tại nhà đơn giản trên nền đất và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/quy-trinh-trong-dua-leo-tai-nha-don-gian-tren-nen-dat/',
      publishedAt: DateTime(2024, 09, 03),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/03/dua-leo-500x333.jpg?v=1751373113',
    ),
    PlantArticle(
      id: 'cnc82',
      title: 'Mùa hè nên trồng loại rau gì cho năng suất tốt?',
      summary:
          'Thông tin chi tiết về mùa hè nên trồng loại rau gì cho năng suất tốt? và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/mua-he-nen-trong-loai-rau-gi-cho-nang-suat-tot/',
      publishedAt: DateTime(2024, 08, 31),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/03/rau-mung-toi-500x500.png?v=1751373108',
    ),
    PlantArticle(
      id: 'cnc83',
      title: 'Thời vụ trồng dưa chuột miền Bắc',
      summary:
          'Thông tin chi tiết về thời vụ trồng dưa chuột miền bắc và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/thoi-vu-trong-dua-chuot-mien-bac/',
      publishedAt: DateTime(2024, 08, 28),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/03/trong-dua-leo-500x333.jpg?v=1751373111',
    ),
    PlantArticle(
      id: 'cnc84',
      title: 'Kỹ thuật trồng dưa leo trong nhà màng',
      summary:
          'Thông tin chi tiết về kỹ thuật trồng dưa leo trong nhà màng và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/ky-thuat-trong-dua-leo-trong-nha-mang/',
      publishedAt: DateTime(2024, 08, 25),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/IMG_5857-500x375.jpg?v=1751373161',
    ),
    PlantArticle(
      id: 'cnc85',
      title: 'Cách trồng dưa leo cơ bản cho người mới bắt đầu',
      summary:
          'Thông tin chi tiết về cách trồng dưa leo cơ bản cho người mới bắt đầu và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/cach-trong-dua-leo-co-ban-cho-nguoi-moi-bat-dau/',
      publishedAt: DateTime(2024, 08, 22),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/03/dua-leo-500x319.jpeg?v=1751373114',
    ),
    PlantArticle(
      id: 'cnc86',
      title: 'Báo giá nhà màng trồng dưa lưới (100m2, 500m2, 1000m2)',
      summary:
          'Thông tin chi tiết về báo giá nhà màng trồng dưa lưới (100m2, 500m2, 1000m2) và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/chi-phi-lam-nha-mang-trong-dua-luoi-1000m2-cong-nghe-cao/',
      publishedAt: DateTime(2024, 08, 19),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/Co-nen-dau-tu-nha-mang-trong-dua-luoi-khong-02-500x316.jpg?v=1751373825',
    ),
    PlantArticle(
      id: 'cnc87',
      title: 'Những lưu ý khi trồng cây thủy canh',
      summary:
          'Thông tin chi tiết về những lưu ý khi trồng cây thủy canh và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/nhung-luu-y-khi-trong-cay-thuy-canh/',
      publishedAt: DateTime(2024, 08, 16),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/thi-cong-nha-mang-300m2-03-1-500x375.jpg?v=1751373174',
    ),
    PlantArticle(
      id: 'cnc88',
      title: 'Vật tư thủy canh gồm những gì? Mua ở đâu?',
      summary:
          'Thông tin chi tiết về vật tư thủy canh gồm những gì? mua ở đâu? và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/vat-tu-thuy-canh-gom-nhung-gi-mua-o-dau/',
      publishedAt: DateTime(2024, 08, 13),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/02/DSC07318-scaled-1-500x334.jpg?v=1751373128',
    ),
    PlantArticle(
      id: 'cnc89',
      title: 'Báo giá nhà màng trồng dưa lưới (100m2, 500m2, 1000m2)',
      summary:
          'Thông tin chi tiết về báo giá nhà màng trồng dưa lưới (100m2, 500m2, 1000m2) và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/trong-dua-luoi-trong-nha-mang-can-luu-y-nhung-gi/',
      publishedAt: DateTime(2024, 08, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/03/dua-luoi-2-500x278.jpg?v=1751373116',
    ),
    PlantArticle(
      id: 'cnc90',
      title: 'Mua dụng cụ thủy canh giá tốt ở đâu?',
      summary:
          'Thông tin chi tiết về mua dụng cụ thủy canh giá tốt ở đâu? và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/mua-dung-cu-thuy-canh-gia-tot-o-dau/',
      publishedAt: DateTime(2024, 08, 07),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/08/batch_72448668_555767395197626_5526077168402038784_n-500x375.jpg?v=1751373147',
    ),
    PlantArticle(
      id: 'cnc91',
      title: '2 Cách trồng rau má thủy canh hiệu quả năng suất cao nhất',
      summary:
          'Thông tin chi tiết về 2 cách trồng rau má thủy canh hiệu quả năng suất cao nhất và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/cach-trong-rau-ma-thuy-canh/',
      publishedAt: DateTime(2024, 08, 04),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/02/rau-ma-trong-thuy-canh-500x375.jpg?v=1751373846',
    ),
    PlantArticle(
      id: 'cnc92',
      title: 'Cách trồng rau thủy canh bằng chai nhựa cho năng suất nhất',
      summary:
          'Thông tin chi tiết về cách trồng rau thủy canh bằng chai nhựa cho năng suất nhất và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/huong-dan-cach-trong-rau-thuy-canh-bang-chai-nhua/',
      publishedAt: DateTime(2024, 08, 01),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/02/trong-rau-thuy-canh-trong-chai-nhua-500x250.jpg?v=1751373119',
    ),
    PlantArticle(
      id: 'cnc93',
      title: 'Kỹ thuật trồng dưa lưới trong nhà màng từ A - Z',
      summary:
          'Thông tin chi tiết về kỹ thuật trồng dưa lưới trong nhà màng từ a - z và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/ky-thuat-trong-dua-luoi-trong-nha-mang-tu-a-z/',
      publishedAt: DateTime(2024, 07, 29),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/03/Trong-dua-luoi-trong-nha-mang-cong-nghe-cao-500x334.jpg?v=1751373845',
    ),
    PlantArticle(
      id: 'cnc94',
      title: 'Báo giá nhà màng trồng dưa lưới (100m2, 500m2, 1000m2)',
      summary:
          'Thông tin chi tiết về báo giá nhà màng trồng dưa lưới (100m2, 500m2, 1000m2) và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/huong-dan-xay-dung-mo-hinh-trong-dua-luoi-cong-nghe-cao/',
      publishedAt: DateTime(2024, 07, 26),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/Co-nen-dau-tu-nha-mang-trong-dua-luoi-khong-02-500x316.jpg?v=1751373825',
    ),
    PlantArticle(
      id: 'cnc95',
      title: '3 điều có thể bạn chưa biết về cây trồng thủy canh',
      summary:
          'Thông tin chi tiết về 3 điều có thể bạn chưa biết về cây trồng thủy canh và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/3-dieu-co-the-ban-chua-biet-ve-trong-cay-thuy-canh/',
      publishedAt: DateTime(2024, 07, 23),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/02/DSC07373-scaled-1-500x334.jpg?v=1751373125',
    ),
    PlantArticle(
      id: 'cnc96',
      title: '5 thông tin quan trọng về cây cảnh thủy canh',
      summary:
          'Thông tin chi tiết về 5 thông tin quan trọng về cây cảnh thủy canh và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/5-thong-tin-quan-trong-ve-cay-canh-thuy-canh/',
      publishedAt: DateTime(2024, 07, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/02/cay-canh-thuy-canh-500x500.jpg?v=1751373123',
    ),
    PlantArticle(
      id: 'cnc97',
      title:
          'Thi công lắp đặt trọn gói hệ thống tưới nhỏ giọt tiết kiệm chi phí',
      summary:
          'Thông tin chi tiết về thi công lắp đặt trọn gói hệ thống tưới nhỏ giọt tiết kiệm chi phí và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/thi-cong-lap-dat-tron-goi-he-thong-tuoi-nho-giot-tiet-kiem-chi-phi/',
      publishedAt: DateTime(2024, 07, 17),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/03/142779994_1523023231368855_8561070496115085923_o-500x375.jpg?v=1751374034',
    ),
    PlantArticle(
      id: 'cnc98',
      title: 'Tổng hợp chi phí nhà màng trồng dưa leo 500m2',
      summary:
          'Thông tin chi tiết về tổng hợp chi phí nhà màng trồng dưa leo 500m2 và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/tong-hop-chi-phi-nha-mang-trong-dua-leo-500m2/',
      publishedAt: DateTime(2024, 07, 14),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/nha-mang-trong-dua-leo-500x292.jpg?v=1751373161',
    ),
    PlantArticle(
      id: 'cnc99',
      title: 'Trồng rau trong nhà màng. Có nên hay không?',
      summary:
          'Thông tin chi tiết về trồng rau trong nhà màng. có nên hay không? và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/trong-rau-trong-nha-mang-co-nen-hay-khong/',
      publishedAt: DateTime(2024, 07, 11),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/08/batch_73215693_957925661224095_8391013555347914752_n-500x375.jpg?v=1751373146',
    ),
    PlantArticle(
      id: 'cnc100',
      title: 'Trồng cây gì trong nhà màng mang lại hiệu quả kinh tế cao',
      summary:
          'Thông tin chi tiết về trồng cây gì trong nhà màng mang lại hiệu quả kinh tế cao và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/trong-cay-gi-trong-nha-mang-mang-lai-hieu-qua-kinh-te-cao/',
      publishedAt: DateTime(2024, 07, 08),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/02/255384032_1719367315067778_829217335307900554_n-500x375.jpg?v=1751373863',
    ),
    PlantArticle(
      id: 'cnc101',
      title: 'Báo giá chi phí thi công nhà màng chi tiết A-Z mới nhất 2025',
      summary:
          'Thông tin chi tiết về báo giá chi phí thi công nhà màng chi tiết a-z mới nhất 2025 và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/thi-cong-nha-mang-trong-rau-300-500-1000m2-uy-tin-nhat/',
      publishedAt: DateTime(2024, 07, 05),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/thi-cong-nha-mang-300m2-03-500x375.jpg?v=1751373174',
    ),
    PlantArticle(
      id: 'cnc102',
      title: '7 bước làm nhà màng trên sân thượng',
      summary:
          'Thông tin chi tiết về 7 bước làm nhà màng trên sân thượng và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/7-buoc-lam-nha-mang-tren-san-thuong/',
      publishedAt: DateTime(2024, 07, 02),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/lam-nha-mang-san-thuong-500x292.jpg?v=1751373169',
    ),
    PlantArticle(
      id: 'cnc103',
      title: 'Chi phi xay dung nha mang ca chua cong nghe cao 1000m2',
      summary:
          'Thông tin chi tiết về chi phi xay dung nha mang ca chua cong nghe cao 1000m2 và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/chi-phi-xay-dung-nha-mang-ca-chua-cong-nghe-cao-1000m2/',
      publishedAt: DateTime(2024, 06, 29),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/nha-mang-trong-ca-chua-500x292.jpg?v=1751373175',
    ),
    PlantArticle(
      id: 'cnc104',
      title: 'Báo giá chi phí thi công nhà màng chi tiết A-Z mới nhất 2025',
      summary:
          'Thông tin chi tiết về báo giá chi phí thi công nhà màng chi tiết a-z mới nhất 2025 và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/tat-tan-tat-ve-chi-phi-lam-nha-mang-cac-loai/',
      publishedAt: DateTime(2024, 06, 26),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/CHi-phi-lam-nha-mang-trong-rau-500x292.jpg?v=1751373816',
    ),
    PlantArticle(
      id: 'cnc105',
      title: 'Các kiểu thiết kế nhà màng trồng rau phổ biến',
      summary:
          'Thông tin chi tiết về các kiểu thiết kế nhà màng trồng rau phổ biến và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/cac-thiet-ke-nha-mang-trong-rau-pho-bien/',
      publishedAt: DateTime(2024, 06, 23),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/thiet-ke-nha-mang-trong-rau-pho-bien-500x292.jpg?v=1751373829',
    ),
    PlantArticle(
      id: 'cnc106',
      title: 'Nên lựa chọn nhà màng hay nhà kính để trồng rau?',
      summary:
          'Thông tin chi tiết về nên lựa chọn nhà màng hay nhà kính để trồng rau? và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/nen-lua-chon-nha-mang-hay-nha-kinh-de-trong-rau/',
      publishedAt: DateTime(2024, 06, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/1.-nha-mang-hay-nha-kinh-500x292.jpg?v=1751373830',
    ),
    PlantArticle(
      id: 'cnc107',
      title: 'Báo giá chi phí thi công nhà màng chi tiết A-Z mới nhất 2025',
      summary:
          'Thông tin chi tiết về báo giá chi phí thi công nhà màng chi tiết a-z mới nhất 2025 và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/chi-phi-xay-dung-nha-mang-trong-rau-cong-nghe-cao/',
      publishedAt: DateTime(2024, 06, 17),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/2.-Chi-phi-xay-dung-nha-mang-cong-nghe-cao-500x292.jpg?v=1751373826',
    ),
    PlantArticle(
      id: 'cnc108',
      title: '3 loại nhà màng trồng rau nông nghiệp công nghệ cao, giá tốt',
      summary:
          'Thông tin chi tiết về 3 loại nhà màng trồng rau nông nghiệp công nghệ cao, giá tốt và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/7-luu-y-truoc-khi-thi-cong-nha-mang-hachi/',
      publishedAt: DateTime(2024, 06, 14),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/06/DSC00477-scaled-1-500x334.jpg?v=1751373836',
    ),
    PlantArticle(
      id: 'cnc109',
      title: 'Các bước xây dựng nhà màng trồng dưa leo',
      summary:
          'Thông tin chi tiết về các bước xây dựng nhà màng trồng dưa leo và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/cac-buoc-xay-dung-nha-mang-trong-dua-leo/',
      publishedAt: DateTime(2024, 06, 11),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/04/cac-buoc-xay-dung-nha-mang-trong-dua-leo-500x292.jpg?v=1751373825',
    ),
    PlantArticle(
      id: 'cnc110',
      title: 'Biểu hiện thiếu chất trên cây thủy canh',
      summary:
          'Thông tin chi tiết về biểu hiện thiếu chất trên cây thủy canh và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/bieu-hien-thieu-chat-tren-cay-thuy-canh/',
      publishedAt: DateTime(2024, 06, 08),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/03/bieu-hien-thieu-chat-tren-rau-thuy-canh-500x292.jpg?v=1751373821',
    ),
    PlantArticle(
      id: 'cnc111',
      title: 'Lưu ý khi trồng rau sạch thủy canh',
      summary:
          'Thông tin chi tiết về lưu ý khi trồng rau sạch thủy canh và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/luu-y-khi-trong-rau-sach-thuy-canh/',
      publishedAt: DateTime(2024, 06, 05),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/03/luu-y-khi-trong-rau-sach-thuy-canh-500x292.jpg?v=1751373821',
    ),
    PlantArticle(
      id: 'cnc112',
      title: 'Các yếu tố cần thiết khi đầu tư trồng rau thủy canh',
      summary:
          'Thông tin chi tiết về các yếu tố cần thiết khi đầu tư trồng rau thủy canh và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/cac-yeu-to-can-thiet-khi-dau-tu-trong-rau-thuy-canh/',
      publishedAt: DateTime(2024, 06, 02),
      image:
          'https://hachi.com.vn/wp-content/uploads/2020/05/batch_650be84bb58849d61099-500x237.jpg?v=1751374042',
    ),
    PlantArticle(
      id: 'cnc113',
      title: 'Top 7 loại rau dễ trồng bằng phương pháp thủy canh',
      summary:
          'Thông tin chi tiết về top 7 loại rau dễ trồng bằng phương pháp thủy canh và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/top-7-loai-rau-de-trong-bang-phuong-phap-thuy-canh/',
      publishedAt: DateTime(2024, 05, 30),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/02/7-loai-rau-thuy-canh-de-trong-500x292.jpg?v=1751373822',
    ),
    PlantArticle(
      id: 'cnc114',
      title: 'Làm thế nào để bảo quản rau củ quả khỏi nấm mốc',
      summary:
          'Thông tin chi tiết về làm thế nào để bảo quản rau củ quả khỏi nấm mốc và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/lam-the-nao-de-bao-quan-rau-cu-qua-khoi-nam-moc/',
      publishedAt: DateTime(2024, 05, 27),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/02/So-che-va-bao-quan-rau-cu-500x391.jpg?v=1751373881',
    ),
    PlantArticle(
      id: 'cnc115',
      title: '5 điều cần biết về rau củ trong cuộc sống hàng ngày',
      summary:
          'Thông tin chi tiết về 5 điều cần biết về rau củ trong cuộc sống hàng ngày và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/5-dieu-can-biet-ve-rau-cu-trong-cuoc-song-hang-ngay/',
      publishedAt: DateTime(2024, 05, 24),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/02/anh-harau-2-500x315.jpg?v=1751373884',
    ),
    PlantArticle(
      id: 'cnc116',
      title: '6 cách làm đơn giản để loại bỏ rệp trên rau thủy canh?',
      summary:
          'Thông tin chi tiết về 6 cách làm đơn giản để loại bỏ rệp trên rau thủy canh? và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/6-cach-lam-don-gian-de-loai-bo-rep-tren-cay-thuy-canh/',
      publishedAt: DateTime(2024, 05, 21),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/02/Rep-tren-rau-thuy-canh-500x292.jpg?v=1751373822',
    ),
    PlantArticle(
      id: 'cnc117',
      title: 'Các bước tự lắp đặt giàn thủy canh tại nhà',
      summary:
          'Thông tin chi tiết về các bước tự lắp đặt giàn thủy canh tại nhà và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/cac-buoc-tu-lap-dat-gian-thuy-canh-tai-nha/',
      publishedAt: DateTime(2024, 05, 18),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/10/Danh-sach-dung-cu-trong-gian-thuy-canh-500x500.jpg?v=1751373913',
    ),
    PlantArticle(
      id: 'cnc118',
      title: '2 Cách tự pha chế dung dịch thủy canh đơn giản hiệu quả nhất',
      summary:
          'Thông tin chi tiết về 2 cách tự pha chế dung dịch thủy canh đơn giản hiệu quả nhất và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/huong-dan-pha-dung-dich-thuy-canh-huu-co-tai-nha/',
      publishedAt: DateTime(2024, 05, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/10/Organic-Hydroponics-500x333.jpg?v=1751373913',
    ),
    PlantArticle(
      id: 'cnc119',
      title:
          'Cách trồng rau thủy canh tại nhà đầy đủ giúp bạn trồng thành công 100%',
      summary:
          'Thông tin chi tiết về cách trồng rau thủy canh tại nhà đầy đủ giúp bạn trồng thành công 100% và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/cach-trong-rau-thuy-canh-tai-nha-day-du-giup-ban-trong-thanh-cong-100/',
      publishedAt: DateTime(2024, 05, 12),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/10/Cach-trong-rau-thuy-canh-tai-nha-500x292.jpg?v=1751373821',
    ),
    PlantArticle(
      id: 'cnc120',
      title: '2 Cách tự pha chế dung dịch thủy canh đơn giản hiệu quả nhất',
      summary:
          'Thông tin chi tiết về 2 cách tự pha chế dung dịch thủy canh đơn giản hiệu quả nhất và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/luu-y-khi-tu-pha-dung-dich-thuy-canh-theo-cong-thuc-co-san/',
      publishedAt: DateTime(2024, 05, 09),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/08/65765277_1040273909643792_2370962311218200576_o-500x259.jpg',
    ),
    PlantArticle(
      id: 'cnc121',
      title: 'Những lưu ý về nguồn nước pha dung dịch thủy canh',
      summary:
          'Thông tin chi tiết về những lưu ý về nguồn nước pha dung dịch thủy canh và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/nhung-luu-y-ve-nguon-nuoc-pha-dung-dich-thuy-canh/',
      publishedAt: DateTime(2024, 05, 06),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/10/2010_be-loc-nuoc-gieng-khoan-1-500x252.jpg?v=1751373914',
    ),
    PlantArticle(
      id: 'cnc122',
      title: 'Dung dịch thủy canh cho rau ăn quả Hachi',
      summary:
          'Thông tin chi tiết về dung dịch thủy canh cho rau ăn quả hachi và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/dung-dich-thuy-canh-cho-rau-an-qua/',
      publishedAt: DateTime(2024, 05, 03),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/09/31172289_1219937634809121_3529455466444750848_n-500x375.jpg?v=1751373916',
    ),
    PlantArticle(
      id: 'cnc123',
      title: 'Dung dịch thủy canh: 10+ Thông tin bạn cần phải biết khi mua',
      summary:
          'Thông tin chi tiết về dung dịch thủy canh: 10+ thông tin bạn cần phải biết khi mua và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/huong-dan-su-dung-dinh-duong-thuy-canh-tu-a-z/',
      publishedAt: DateTime(2024, 04, 30),
      image:
          'https://hachi.com.vn/wp-content/uploads/2019/09/batch_DSC00449-500x334.jpg?v=1751374083',
    ),
    PlantArticle(
      id: 'cnc124',
      title: '3 loại nhà màng trồng rau nông nghiệp công nghệ cao, giá tốt',
      summary:
          'Thông tin chi tiết về 3 loại nhà màng trồng rau nông nghiệp công nghệ cao, giá tốt và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/nhung-diem-dot-pha-cua-nha-mang-cong-nghe-cao/',
      publishedAt: DateTime(2024, 04, 27),
      image:
          'https://hachi.com.vn/wp-content/uploads/2020/07/IMG_4065-500x336.jpg?v=1751374058',
    ),
    PlantArticle(
      id: 'cnc125',
      title: 'Địa chỉ mua dinh dưỡng thủy canh ở Hà Nội uy tín nhất',
      summary:
          'Thông tin chi tiết về địa chỉ mua dinh dưỡng thủy canh ở hà nội uy tín nhất và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/dia-chi-mua-dinh-duong-thuy-canh-o-ha-noi-uy-tin-nhat/',
      publishedAt: DateTime(2024, 04, 24),
      image:
          'https://hachi.com.vn/wp-content/uploads/2019/05/batch_72696241_443028499663582_7185616707254222848_n-500x375.jpg?v=1751374075',
    ),
    PlantArticle(
      id: 'cnc126',
      title: 'Dung dịch thủy canh: 10+ Thông tin bạn cần phải biết khi mua',
      summary:
          'Thông tin chi tiết về dung dịch thủy canh: 10+ thông tin bạn cần phải biết khi mua và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/mua-dinh-duong-thuy-canh-gia-tot-nhat-nam-2023/',
      publishedAt: DateTime(2024, 04, 21),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/08/IMG_0550-scaled-1-500x375.jpg',
    ),
    PlantArticle(
      id: 'cnc127',
      title: 'Các mô hình nhà màng trồng rau hiệu quả nhất hiện nay',
      summary:
          'Thông tin chi tiết về các mô hình nhà màng trồng rau hiệu quả nhất hiện nay và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/cac-mo-hinh-nha-mang-trong-rau-hieu-qua-nhat-hien-nay/',
      publishedAt: DateTime(2024, 04, 18),
      image:
          'https://hachi.com.vn/wp-content/uploads/2020/07/Nha-mang-trong-lan-hachi-01-500x375.jpg?v=1751374055',
    ),
    PlantArticle(
      id: 'cnc128',
      title: 'Phân bón thủy canh có an toàn không?',
      summary:
          'Thông tin chi tiết về phân bón thủy canh có an toàn không? và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/phan-bon-thuy-canh-co-an-toan-khong/',
      publishedAt: DateTime(2024, 04, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2019/10/Vietgap-HACHI--500x237.jpg?v=1751374077',
    ),
    PlantArticle(
      id: 'cnc129',
      title: '3 loại nhà màng trồng rau nông nghiệp công nghệ cao, giá tốt',
      summary:
          'Thông tin chi tiết về 3 loại nhà màng trồng rau nông nghiệp công nghệ cao, giá tốt và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/quy-trinh-xay-dung-nha-mang-tu-a-z/',
      publishedAt: DateTime(2024, 04, 12),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/02/DSC07318-scaled-1-500x334.jpg?v=1751373128',
    ),
    PlantArticle(
      id: 'cnc130',
      title: '3 loại nhà màng trồng rau nông nghiệp công nghệ cao, giá tốt',
      summary:
          'Thông tin chi tiết về 3 loại nhà màng trồng rau nông nghiệp công nghệ cao, giá tốt và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/cau-tao-cua-nha-mang-trong-rau/',
      publishedAt: DateTime(2024, 04, 09),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/70494024_414041742648303_5398669489006968832_n-500x375.jpg?v=1751373166',
    ),
    PlantArticle(
      id: 'cnc131',
      title: 'Dung dịch thủy canh: 10+ Thông tin bạn cần phải biết khi mua',
      summary:
          'Thông tin chi tiết về dung dịch thủy canh: 10+ thông tin bạn cần phải biết khi mua và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/phan-biet-cac-loai-dung-dich-dinh-duong-thuy-canh/',
      publishedAt: DateTime(2024, 04, 06),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/06/TNN04753-scaled-1-500x333.jpg?v=1751373998',
    ),
    PlantArticle(
      id: 'cnc132',
      title: 'Dung dịch thủy canh: 10+ Thông tin bạn cần phải biết khi mua',
      summary:
          'Thông tin chi tiết về dung dịch thủy canh: 10+ thông tin bạn cần phải biết khi mua và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/ban-co-dang-chon-mua-dung-dich-thuy-canh-dung-chuan/',
      publishedAt: DateTime(2024, 04, 03),
      image:
          'https://hachi.com.vn/wp-content/uploads/2019/08/Hachi-Farm-03-510x251.jpg?v=1741149634',
    ),
    PlantArticle(
      id: 'cnc133',
      title: 'Trồng rau thủy canh: Quy trình & kỹ thuật, thông tin cần biết',
      summary:
          'Thông tin chi tiết về trồng rau thủy canh: quy trình & kỹ thuật, thông tin cần biết và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/trong-rau-thuy-canh/',
      publishedAt: DateTime(2024, 03, 31),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/07/trong-rau-thuy-canh-thumb-500x279.jpg?v=1751370612',
    ),
    PlantArticle(
      id: 'cnc134',
      title: '3 loại nhà màng trồng rau nông nghiệp công nghệ cao, giá tốt',
      summary:
          'Thông tin chi tiết về 3 loại nhà màng trồng rau nông nghiệp công nghệ cao, giá tốt và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/nha-mang-hachi-loi-giai-cho-bai-toan-nhiet-do/',
      publishedAt: DateTime(2024, 03, 28),
      image:
          'https://hachi.com.vn/wp-content/uploads/2020/07/IMG_4065-500x336.jpg?v=1751374058',
    ),
    PlantArticle(
      id: 'cnc135',
      title: 'Kỹ thuật ươm cây trồng thuỷ canh quy mô trang trại',
      summary:
          'Thông tin chi tiết về kỹ thuật ươm cây trồng thuỷ canh quy mô trang trại và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/ky-thuat-uom-cay-trong-thuy-canh-quy-mo-trang-trai/',
      publishedAt: DateTime(2024, 03, 25),
      image:
          'https://hachi.com.vn/wp-content/uploads/2019/05/batch_72723349_444647542923691_8223888427876089856_n-500x375.jpg?v=1751374073',
    ),
    PlantArticle(
      id: 'cnc136',
      title: 'Mua dung dịch thuỷ canh uy tín ở đâu?',
      summary:
          'Thông tin chi tiết về mua dung dịch thuỷ canh uy tín ở đâu? và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/mua-dung-dich-thuy-canh-uy-tin-o-dau/',
      publishedAt: DateTime(2024, 03, 22),
      image:
          'https://hachi.com.vn/wp-content/uploads/2019/10/DSC00599-scaled-1-500x334.jpg?v=1751374079',
    ),
    PlantArticle(
      id: 'cnc137',
      title: 'Cẩm nang từ A-Z về dinh dưỡng thuỷ canh Hachi',
      summary:
          'Thông tin chi tiết về cẩm nang từ a-z về dinh dưỡng thuỷ canh hachi và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/cam-nang-tu-a-z-ve-dinh-duong-thuy-canh-hachi/',
      publishedAt: DateTime(2024, 03, 19),
      image:
          'https://hachi.com.vn/wp-content/uploads/2019/08/IMG_0630-1024x977-1-510x487.jpg?v=1741149636',
    ),
    PlantArticle(
      id: 'cnc138',
      title: 'Có nên dùng dinh dưỡng thủy canh dạng bột',
      summary:
          'Thông tin chi tiết về có nên dùng dinh dưỡng thủy canh dạng bột và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/co-nen-dung-dinh-duong-thuy-canh-dang-bot/',
      publishedAt: DateTime(2024, 03, 16),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/11/hydroponic-nutrient-cover-01-e1541479975100-510x270.png?v=1741149704',
    ),
    PlantArticle(
      id: 'cnc139',
      title: '10 lợi ích tuyệt vời của hệ thống tưới nhỏ giọt',
      summary:
          'Thông tin chi tiết về 10 lợi ích tuyệt vời của hệ thống tưới nhỏ giọt và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/uu-nhuoc-diem-cua-he-thong-tuoi-nho-giot/',
      publishedAt: DateTime(2024, 03, 13),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/08/solujan-lawn-sprinklers-ltd-9-510x398.jpg?v=1741149732',
    ),
    PlantArticle(
      id: 'cnc140',
      title: 'QUY TRÌNH TRỒNG RAU THỦY CANH QUY MÔ CÔNG NGHIỆP',
      summary:
          'Thông tin chi tiết về quy trình trồng rau thủy canh quy mô công nghiệp và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/quy-trinh-trong-rau-thuy-canh-quy-mo-cong-nghiep-co-ban/',
      publishedAt: DateTime(2024, 03, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/02/30772157_1599217256792639_1385990072_o-510x383.jpg?v=1741149783',
    ),
    PlantArticle(
      id: 'cnc141',
      title: '5 LƯU Ý QUAN TRỌNG KHI LỰA CHỌN HẠT GIỐNG',
      summary:
          'Thông tin chi tiết về 5 lưu ý quan trọng khi lựa chọn hạt giống và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/luu-y-quan-trong-khi-lua-chon-hat-giong/',
      publishedAt: DateTime(2024, 03, 07),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/05/vegetable-seeds-510x383.jpg?v=1741149782',
    ),
    PlantArticle(
      id: 'cnc142',
      title: 'NÔNG DÂN TIẾP CẬN NỀN NÔNG NGHIỆP 4.0',
      summary:
          'Thông tin chi tiết về nông dân tiếp cận nền nông nghiệp 4.0 và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/nong-dan-tiep-can-nen-nong-nghiep-thong-minh-4-0/',
      publishedAt: DateTime(2024, 03, 04),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/05/robotics-agriculture-510x340.jpeg?v=1741149762',
    ),
    PlantArticle(
      id: 'cnc143',
      title: 'THU LỢI HÀNG TỈ MỖI NĂM TỪ MÔ HÌNH TRANG TRẠI THỦY CANH',
      summary:
          'Thông tin chi tiết về thu lợi hàng tỉ mỗi năm từ mô hình trang trại thủy canh và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/thu-loi-hang-ti-moi-nam-tu-mo-hinh-trang-trai-thuy-canh/',
      publishedAt: DateTime(2024, 03, 01),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/04/30223144_1586946944686337_489780731_o-510x383.jpg?v=1741149797',
    ),
    PlantArticle(
      id: 'cnc144',
      title: 'TOP 5 LỢI ÍCH CỦA CÀ CHUA ĐEN',
      summary:
          'Thông tin chi tiết về top 5 lợi ích của cà chua đen và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/top-5-loi-ich-cua-ca-chua-den/',
      publishedAt: DateTime(2024, 02, 27),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/04/ca-chua-den-2-510x383.jpg?v=1741149788',
    ),
    PlantArticle(
      id: 'cnc145',
      title: 'KHÍ CANH LÀ GÌ?',
      summary:
          'Thông tin chi tiết về khí canh là gì? và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/khi-canh-la-gi/',
      publishedAt: DateTime(2024, 02, 24),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/04/khi-canh-510x383.jpg?v=1741149789',
    ),
    PlantArticle(
      id: 'cnc146',
      title: '4 mô hình trồng rau thủy canh phố biến tại Việt Nam',
      summary:
          'Thông tin chi tiết về 4 mô hình trồng rau thủy canh phố biến tại việt nam và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/4-mo-hinh-trong-rau-thuy-canh-tieu-bieu/',
      publishedAt: DateTime(2024, 02, 21),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/04/Vegetable-cultivated-through-a-hydroponics-system-510x340.jpg?v=1741149742',
    ),
    PlantArticle(
      id: 'cnc147',
      title: '15 LOẠI RAU PHÙ HỢP VỚI PHƯƠNG PHÁP TRỒNG RAU THỦY CANH',
      summary:
          'Thông tin chi tiết về 15 loại rau phù hợp với phương pháp trồng rau thủy canh và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/15-loai-rau-phu-hop-voi-phuong-phap-trong-rau-thuy-canh/',
      publishedAt: DateTime(2024, 02, 18),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/04/3373928-510x287.jpg?v=1741149773',
    ),
    PlantArticle(
      id: 'cnc148',
      title:
          '5 TIÊU CHÍ LỰA CHỌN ĐƠN VỊ THI CÔNG TRANG TRẠI TRỒNG RAU THỦY CANH',
      summary:
          'Thông tin chi tiết về 5 tiêu chí lựa chọn đơn vị thi công trang trại trồng rau thủy canh và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/lua-chon-don-vi-thi-cong-trang-trai-trong-rau-thuy-canh/',
      publishedAt: DateTime(2024, 02, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/01/28958852_1496165363821235_5434710479438086144_o-510x383.jpg?v=1741149819',
    ),
    PlantArticle(
      id: 'cnc149',
      title: 'CÔNG NGHỆ BẢO QUẢN RAU QUẢ SAU KHI THU HOẠCH',
      summary:
          'Thông tin chi tiết về công nghệ bảo quản rau quả sau khi thu hoạch và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/cong-nghe-bao-quan-rau-qua-sau-khi-thu-hoach/',
      publishedAt: DateTime(2024, 02, 12),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/03/Hydro-Lettuce-Woolworths-510x287.jpg?v=1741149823',
    ),
    PlantArticle(
      id: 'cnc150',
      title:
          'HACHI VINH DỰ ĐƯỢC GẶP MẶT THỦ TƯỚNG TRONG NGÀY MÙNG 7 TẾT MẬU TUẤT',
      summary:
          'Thông tin chi tiết về hachi vinh dự được gặp mặt thủ tướng trong ngày mùng 7 tết mậu tuất và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/hachi-vinh-du-duoc-gap-mat-thu-tuong-trong-ngay-mung-6-tet-mau-tuat/',
      publishedAt: DateTime(2024, 02, 09),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/02/IMG_2601-510x383.jpg?v=1741149839',
    ),
    PlantArticle(
      id: 'cnc151',
      title: 'CẢI MIZUNA - LOẠI RAU PHỔ BIẾN TẠI NHẬT BẢN',
      summary:
          'Thông tin chi tiết về cải mizuna - loại rau phổ biến tại nhật bản và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/cai-mizuna-loai-rau-pho-bien-tai-nhat-ban/',
      publishedAt: DateTime(2024, 02, 06),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/02/35849037-mizuna-greens-Stock-Photo-510x379.jpg?v=1741149843',
    ),
    PlantArticle(
      id: 'cnc152',
      title:
          'BUỔI GẶP GỠ TƯ VẤN GIỮA BAN LÃNH ĐẠO HACHI VÀ CÁC CHUYÊN GIA PUM (HÀ LAN)',
      summary:
          'Thông tin chi tiết về buổi gặp gỡ tư vấn giữa ban lãnh đạo hachi và các chuyên gia pum (hà lan) và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/buoi-gap-go-tu-van-giua-ban-lanh-dao-hachi-va-chuyen-gia-pum-ha-lan/',
      publishedAt: DateTime(2024, 02, 03),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/02/27786614_1524981670882865_960625483_o-scaled-1-510x383.jpg?v=1741149846',
    ),
    PlantArticle(
      id: 'cnc153',
      title: 'NHỮNG LOẠI CÂY CẢNH MANG TÀI LỘC ĐẦU NĂM MỚI',
      summary:
          'Thông tin chi tiết về những loại cây cảnh mang tài lộc đầu năm mới và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/nhung-loai-cay-canh-mang-tai-loc-dau-nam-moi/',
      publishedAt: DateTime(2024, 01, 31),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/02/dao-chiet-scaled-1-510x383.jpg?v=1741149860',
    ),
    PlantArticle(
      id: 'cnc154',
      title: '10 BƯỚC XÂY DỰNG TRANG TRẠI THỦY CANH CHO KHÁCH HÀNG',
      summary:
          'Thông tin chi tiết về 10 bước xây dựng trang trại thủy canh cho khách hàng và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/10-buoc-xay-dung-trang-trai-thuy-canh-cho-khach-hang/',
      publishedAt: DateTime(2024, 01, 28),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/01/bao-gia-tc-510x309.jpg?v=1741149860',
    ),
    PlantArticle(
      id: 'cnc155',
      title: 'LỊCH SỬ CỦA TƯỚI NHỎ GIỌT',
      summary:
          'Thông tin chi tiết về lịch sử của tưới nhỏ giọt và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/lich-su-cua-tuoi-nho-giot/',
      publishedAt: DateTime(2024, 01, 25),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/01/Huberts_pic_BW_at_the_well-510x520.jpg?v=1741149864',
    ),
    PlantArticle(
      id: 'cnc156',
      title: 'Những thông tin cơ bản về hệ thống tưới nhỏ giọt',
      summary:
          'Thông tin chi tiết về những thông tin cơ bản về hệ thống tưới nhỏ giọt và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url:
          'https://hachi.com.vn/nhung-thong-tin-co-ban-ve-he-thong-tuoi-nho-giot/',
      publishedAt: DateTime(2024, 01, 22),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/01/27048818_1511772655537100_148534636_o-1-510x383.jpg?v=1741149865',
    ),
    PlantArticle(
      id: 'cnc157',
      title: 'TRỒNG RAU THỦY CANH TẠI NHÀ CẦN LƯU Ý NHỮNG GÌ?',
      summary:
          'Thông tin chi tiết về trồng rau thủy canh tại nhà cần lưu ý những gì? và các ứng dụng trong nông nghiệp công nghệ cao.',
      source: 'Hachi News',
      category: ArticleCategory.congNgheCao,
      url: 'https://hachi.com.vn/trong-rau-thuy-canh-tai-nha-can-luu-y-gi/',
      publishedAt: DateTime(2024, 01, 19),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/05/20150529_094119-01-scaled-1-510x510.jpeg?v=1741149768',
    ),
    // Cẩm nang thủy canh
    PlantArticle(
      id: 'cn1',
      title: 'Cách trồng ớt thủy canh tại nhà đơn giản đúng kỹ thuật nhất',
      summary:
          'Thông tin chi tiết về cách trồng ớt thủy canh tại nhà đơn giản đúng kỹ thuật nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-ot-thuy-canh/',
      publishedAt: DateTime(2025, 05, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/10/thu-hoach-ot-trong-thuy-canh-500x334.jpg?v=1759854628',
    ),
    PlantArticle(
      id: 'cn2',
      title: 'Cách trồng bí đỏ bán thủy canh trên ban công thành công 100%',
      summary:
          'Thông tin chi tiết về cách trồng bí đỏ bán thủy canh trên ban công thành công 100% và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-bi-do-ban-thuy-canh/',
      publishedAt: DateTime(2025, 05, 13),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/09/cach-trong-bi-do-ban-thuy-canh-500x295.jpg?v=1758775528',
    ),
    PlantArticle(
      id: 'cn3',
      title: 'Cách trồng khoai tây thủy canh tại nhà đơn giản thành công 100%',
      summary:
          'Thông tin chi tiết về cách trồng khoai tây thủy canh tại nhà đơn giản thành công 100% và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-khoai-tay-thuy-canh/',
      publishedAt: DateTime(2025, 05, 11),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/09/uu-diem-cach-trong-khoai-tay-thuy-canh-500x313.jpg?v=1757692565',
    ),
    PlantArticle(
      id: 'cn4',
      title: 'Chi phí lắp đặt giàn rau thủy canh tại nhà cho hộ gia đình 2025',
      summary:
          'Thông tin chi tiết về chi phí lắp đặt giàn rau thủy canh tại nhà cho hộ gia đình 2025 và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/chi-phi-lap-dat-gian-rau-thuy-canh-tai-nha/',
      publishedAt: DateTime(2025, 05, 09),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/09/chi-phi-lap-dat-gian-rau-thuy-canh-tai-nha-500x375.jpg?v=1757665195',
    ),
    PlantArticle(
      id: 'cn5',
      title: 'Thủy canh là gì? Ưu và nhược điểm của 7 hệ thống phổ biến',
      summary:
          'Thông tin chi tiết về thủy canh là gì? ưu và nhược điểm của 7 hệ thống phổ biến và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/thuy-canh-la-gi/',
      publishedAt: DateTime(2025, 05, 07),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/09/thuy-canh-la-gi-500x385.jpg?v=1757492784',
    ),
    PlantArticle(
      id: 'cn6',
      title: '2 cách trồng cà rốt thủy canh đúng kỹ thuật hiệu quả nhất',
      summary:
          'Thông tin chi tiết về 2 cách trồng cà rốt thủy canh đúng kỹ thuật hiệu quả nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/ky-thuat-trong-ca-rot-thuy-canh/',
      publishedAt: DateTime(2025, 05, 05),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/09/cham-soc-ca-rot-trong-thuy-canh-1-500x400.jpg?v=1756827731',
    ),
    PlantArticle(
      id: 'cn7',
      title:
          'Cách trồng cà chua thủy canh đúng kỹ thuật cho năng suất cao nhất',
      summary:
          'Thông tin chi tiết về cách trồng cà chua thủy canh đúng kỹ thuật cho năng suất cao nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-ca-chua-thuy-canh/',
      publishedAt: DateTime(2025, 05, 03),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/06/thu-hoach-ca-chua-trong-thuy-canh-500x250.jpg?v=1751370210',
    ),
    PlantArticle(
      id: 'cn8',
      title: 'Cách trồng khổ qua thủy canh (mướp đắng) đúng kỹ thuật nhất',
      summary:
          'Thông tin chi tiết về cách trồng khổ qua thủy canh (mướp đắng) đúng kỹ thuật nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-kho-qua-thuy-canh/',
      publishedAt: DateTime(2025, 05, 01),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/05/kho-qua-khi-duoc-thu-hoach-500x250.jpg?v=1751370413',
    ),
    PlantArticle(
      id: 'cn9',
      title: 'Cách làm trụ trồng rau thủy canh tại nhà chi tiết từ A đến Z',
      summary:
          'Thông tin chi tiết về cách làm trụ trồng rau thủy canh tại nhà chi tiết từ a đến z và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-lam-tru-trong-rau-thuy-canh/',
      publishedAt: DateTime(2025, 04, 29),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/03/tru-trong-rau-thuy-canh-Hachi-500x375.jpg?v=1751369499',
    ),
    PlantArticle(
      id: 'cn10',
      title: 'Cách trồng rau tần ô thủy canh đúng kỹ thuật năng suất nhất',
      summary:
          'Thông tin chi tiết về cách trồng rau tần ô thủy canh đúng kỹ thuật năng suất nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-rau-tan-o-thuy-canh/',
      publishedAt: DateTime(2025, 04, 27),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/03/trong-rau-tan-o-thuy-canh-la-gi-500x395.jpg?v=1751370438',
    ),
    PlantArticle(
      id: 'cn11',
      title: 'Danh sách 10+ dụng cụ trồng rau thủy canh cần thiết nhất',
      summary:
          'Thông tin chi tiết về danh sách 10+ dụng cụ trồng rau thủy canh cần thiết nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/dung-cu-trong-rau-thuy-canh/',
      publishedAt: DateTime(2025, 04, 25),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/03/dung-cu-trong-rau-thuy-canh-hachi-500x375.jpg?v=1751370473',
    ),
    PlantArticle(
      id: 'cn12',
      title: 'Trồng cây ngũ gia bì thủy canh: Mọi thông tin bạn cần biết',
      summary:
          'Thông tin chi tiết về trồng cây ngũ gia bì thủy canh: mọi thông tin bạn cần biết và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/trong-cay-ngu-gia-bi-thuy-canh-moi-thong-tin-can-biet/',
      publishedAt: DateTime(2025, 04, 23),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/03/trong-cay-ngu-gia-thuy-canh-500x500.jpg?v=1751370451',
    ),
    PlantArticle(
      id: 'cn13',
      title: 'Rau má hương thủy sinh: Phương pháp trồng và chăm sóc hiệu quả',
      summary:
          'Thông tin chi tiết về rau má hương thủy sinh: phương pháp trồng và chăm sóc hiệu quả và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/rau-ma-huong-thuy-sinh-phuong-phap-trong-va-cham-soc/',
      publishedAt: DateTime(2025, 04, 21),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/02/noi-trong-rau-ma-huong-thuy-sinh-500x255.jpg?v=1751370476',
    ),
    PlantArticle(
      id: 'cn14',
      title: '2 Cách trồng hoa tiên ông tại nhà đúng kỹ thuật nhất',
      summary:
          'Thông tin chi tiết về 2 cách trồng hoa tiên ông tại nhà đúng kỹ thuật nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/2-cach-trong-hoa-tien-ong-tai-nha-dung-ky-thuat-nhat/',
      publishedAt: DateTime(2025, 04, 19),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/02/cach-cham-soc-cay-hoa-tien-ong-500x500.jpg?v=1751370490',
    ),
    PlantArticle(
      id: 'cn15',
      title: '2 Cách trồng cỏ đồng tiền thủy sinh đơn giản hiệu quả tại nhà',
      summary:
          'Thông tin chi tiết về 2 cách trồng cỏ đồng tiền thủy sinh đơn giản hiệu quả tại nhà và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-co-dong-tien-thuy-sinh/',
      publishedAt: DateTime(2025, 04, 17),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/02/cach-trong-co-dong-tien-thuy-sinh-thumb-500x279.jpg?v=1751370491',
    ),
    PlantArticle(
      id: 'cn16',
      title: 'Trồng cây lá dứa thủy canh: Mọi thông tin bạn cần biết',
      summary:
          'Thông tin chi tiết về trồng cây lá dứa thủy canh: mọi thông tin bạn cần biết và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/trong-cay-la-dua-thuy-canh/',
      publishedAt: DateTime(2025, 04, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/02/trong-cay-la-dua-thuy-canh-loi-ich-500x288.jpg?v=1751370543',
    ),
    PlantArticle(
      id: 'cn17',
      title: '2 Cách trồng rêu thủy sinh đơn giản và chăm sóc hiệu quả nhất',
      summary:
          'Thông tin chi tiết về 2 cách trồng rêu thủy sinh đơn giản và chăm sóc hiệu quả nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-reu-thuy-sinh/',
      publishedAt: DateTime(2025, 04, 13),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/02/cach-trong-reu-thuy-sinh-500x321.jpg?v=1751370503',
    ),
    PlantArticle(
      id: 'cn18',
      title: '3 Cách trồng trầu bà thủy canh (thủy sinh) xanh mướt đơn giản',
      summary:
          'Thông tin chi tiết về 3 cách trồng trầu bà thủy canh (thủy sinh) xanh mướt đơn giản và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-trau-ba-thuy-canh/',
      publishedAt: DateTime(2025, 04, 11),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/02/cach-trong-trau-ba-thuy-canh-500x262.png?v=1751370513',
    ),
    PlantArticle(
      id: 'cn19',
      title: 'Top 8 Đèn LED trồng rau thủy canh hiệu quả đáng mua nhất',
      summary:
          'Thông tin chi tiết về top 8 đèn led trồng rau thủy canh hiệu quả đáng mua nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/den-led-trong-rau-thuy-canh/',
      publishedAt: DateTime(2025, 04, 09),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/02/den-led-trong-rau-thuy-canh-thumb-500x279.jpg?v=1751370513',
    ),
    PlantArticle(
      id: 'cn20',
      title: 'Cách trồng hạt giống thủy sinh đúng phương pháp nhất hiện nay',
      summary:
          'Thông tin chi tiết về cách trồng hạt giống thủy sinh đúng phương pháp nhất hiện nay và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-hat-giong-thuy-sinh/',
      publishedAt: DateTime(2025, 04, 07),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/02/cach-trong-hat-thuy-sinh-thumb-500x279.jpg?v=1751370522',
    ),
    PlantArticle(
      id: 'cn21',
      title: '3 Cách trồng rau răm thủy canh, bằng cành, chai nhựa chi tiết',
      summary:
          'Thông tin chi tiết về 3 cách trồng rau răm thủy canh, bằng cành, chai nhựa chi tiết và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-rau-ram/',
      publishedAt: DateTime(2025, 04, 05),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/02/cach-trong-rau-ram-500x281.jpg?v=1751370535',
    ),
    PlantArticle(
      id: 'cn22',
      title: 'Trồng rau thủy canh kết hợp nuôi cá: 10+ thông tin cần biết',
      summary:
          'Thông tin chi tiết về trồng rau thủy canh kết hợp nuôi cá: 10+ thông tin cần biết và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/trong-rau-thuy-canh-ket-hop-nuoi-ca/',
      publishedAt: DateTime(2025, 04, 03),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/02/mo-hinh-aquaponics-trong-rau-thuy-canh-nuoi-ca-1-1-500x281.jpg?v=1751370537',
    ),
    PlantArticle(
      id: 'cn23',
      title: '3 Cách trồng lúa thủy canh hiệu quả cho năng suất cao nhất',
      summary:
          'Thông tin chi tiết về 3 cách trồng lúa thủy canh hiệu quả cho năng suất cao nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-lua-thuy-canh/',
      publishedAt: DateTime(2025, 04, 01),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/02/cach-trong-lua-thuy-canh-thumb-500x279.jpg?v=1751370554',
    ),
    PlantArticle(
      id: 'cn24',
      title: 'Cách trồng Gừng thủy canh, thủy sinh đơn giản hiệu quả nhất',
      summary:
          'Thông tin chi tiết về cách trồng gừng thủy canh, thủy sinh đơn giản hiệu quả nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/trong-gung-thuy-canh/',
      publishedAt: DateTime(2025, 03, 30),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/trong-gung-thuy-canh-1-1-500x281.jpg?v=1751370577',
    ),
    PlantArticle(
      id: 'cn25',
      title: 'Xà lách xoong nhật trồng thủy sinh: Cách trồng và chăm sóc',
      summary:
          'Thông tin chi tiết về xà lách xoong nhật trồng thủy sinh: cách trồng và chăm sóc và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/xa-lach-xoong-nhat-trong-thuy-sinh/',
      publishedAt: DateTime(2025, 03, 28),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/02/xa-lach-xoong-nhat-trong-thuy-sinh-thumb-500x279.jpg?v=1751370579',
    ),
    PlantArticle(
      id: 'cn26',
      title: 'Chi phí trồng rau thủy canh 100m2, 500m2, 1000m2 năm 2024',
      summary:
          'Thông tin chi tiết về chi phí trồng rau thủy canh 100m2, 500m2, 1000m2 năm 2024 và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/chi-phi-trong-rau-thuy-canh-100m2-500m2-1000m2/',
      publishedAt: DateTime(2025, 03, 26),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/02/chi-phi-trong-rau-thuy-canh-4-500x281.jpg?v=1751370590',
    ),
    PlantArticle(
      id: 'cn27',
      title: 'Cách trồng nha đam thủy canh (thủy sinh) đơn giản từ A - Z',
      summary:
          'Thông tin chi tiết về cách trồng nha đam thủy canh (thủy sinh) đơn giản từ a - z và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-nha-dam-thuy-canh/',
      publishedAt: DateTime(2025, 03, 24),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/02/cach-trong-nha-dam-thuy-canh-thumb-500x279.jpg?v=1751370601',
    ),
    PlantArticle(
      id: 'cn28',
      title: 'Cách trồng cây hương thảo thủy canh đơn giản hiệu quả nhất',
      summary:
          'Thông tin chi tiết về cách trồng cây hương thảo thủy canh đơn giản hiệu quả nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/trong-cay-huong-thao-thuy-canh/',
      publishedAt: DateTime(2025, 03, 22),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/trong-cay-huong-thao-thuy-canh-scaled-500x667.jpg?v=1751370636',
    ),
    PlantArticle(
      id: 'cn29',
      title: '2 Cách trồng diếp cá thủy canh đơn giản năng suất cao nhất',
      summary:
          'Thông tin chi tiết về 2 cách trồng diếp cá thủy canh đơn giản năng suất cao nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/trong-diep-ca-thuy-canh/',
      publishedAt: DateTime(2025, 03, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/trong-rau-riep-ca-thuy-canh-1-1-500x281.jpg?v=1751370656',
    ),
    PlantArticle(
      id: 'cn30',
      title: '2 Cách trồng rau xà lách thủy canh mới cho năng suất cao nhất',
      summary:
          'Thông tin chi tiết về 2 cách trồng rau xà lách thủy canh mới cho năng suất cao nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/trong-rau-xa-lach-thuy-canh/',
      publishedAt: DateTime(2025, 03, 18),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/trong-rau-xa-lach-thuy-canh-500x281.jpg?v=1751370666',
    ),
    PlantArticle(
      id: 'cn31',
      title: 'Cách Trồng mướp thủy canh đúng kỹ thuật năng suất cao nhất',
      summary:
          'Thông tin chi tiết về cách trồng mướp thủy canh đúng kỹ thuật năng suất cao nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-muop-thuy-canh/',
      publishedAt: DateTime(2025, 03, 16),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/cach-trong-muop-thuy-canh-thumb-500x279.jpg?v=1751370667',
    ),
    PlantArticle(
      id: 'cn32',
      title: 'Cách trồng cây lưỡi hổ thủy canh tại nhà đơn giản hiệu quả nhất',
      summary:
          'Thông tin chi tiết về cách trồng cây lưỡi hổ thủy canh tại nhà đơn giản hiệu quả nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cay-luoi-ho-thuy-canh/',
      publishedAt: DateTime(2025, 03, 14),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/cay-luoi-ho-thuy-canh-1-500x667.jpg?v=1751370690',
    ),
    PlantArticle(
      id: 'cn33',
      title: 'Cách trồng dưa leo thủy canh đơn giản cho năng suất cao nhất',
      summary:
          'Thông tin chi tiết về cách trồng dưa leo thủy canh đơn giản cho năng suất cao nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-dua-leo-thuy-canh/',
      publishedAt: DateTime(2025, 03, 12),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/cach-trong-dua-leo-thuy-canh-thumb-500x279.jpg?v=1751370703',
    ),
    PlantArticle(
      id: 'cn34',
      title: '14 loại cây Dương Xỉ thủy sinh đẹp nhất và cách trồng tại nhà',
      summary:
          'Thông tin chi tiết về 14 loại cây dương xỉ thủy sinh đẹp nhất và cách trồng tại nhà và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cay-duong-xi-thuy-sinh/',
      publishedAt: DateTime(2025, 03, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/cach-trong-duong-xi-thuy-canh-thumb-500x279.jpg?v=1751370712',
    ),
    PlantArticle(
      id: 'cn35',
      title: '3 Cách trồng nấm kim châm thủy canh đơn giản hiệu quả nhất',
      summary:
          'Thông tin chi tiết về 3 cách trồng nấm kim châm thủy canh đơn giản hiệu quả nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-nam-kim-cham-thuy-canh/',
      publishedAt: DateTime(2025, 03, 08),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/cach-trong-nam-kim-cham-thumb-500x279.jpg?v=1751370715',
    ),
    PlantArticle(
      id: 'cn36',
      title: '2 Cách trồng sả thủy canh trong nước tại nhà đơn giản tốt nhất',
      summary:
          'Thông tin chi tiết về 2 cách trồng sả thủy canh trong nước tại nhà đơn giản tốt nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/trong-sa-thuy-canh/',
      publishedAt: DateTime(2025, 03, 06),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/trong-sa-thuy-canh-1-1-500x281.jpg?v=1751370774',
    ),
    PlantArticle(
      id: 'cn37',
      title: 'Cách trồng hoa Tulip thủy canh tại nhà đơn giản hiệu quả nhất',
      summary:
          'Thông tin chi tiết về cách trồng hoa tulip thủy canh tại nhà đơn giản hiệu quả nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-hoa-tulip-thuy-canh/',
      publishedAt: DateTime(2025, 03, 04),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/trong-hoa-tulip-thuy-canh-500x318.jpg?v=1751370828',
    ),
    PlantArticle(
      id: 'cn38',
      title: '2 Cách trồng hoa Ly thủy canh chi tiết từ A - Z cho bà con',
      summary:
          'Thông tin chi tiết về 2 cách trồng hoa ly thủy canh chi tiết từ a - z cho bà con và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/trong-hoa-ly-thuy-canh/',
      publishedAt: DateTime(2025, 03, 02),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/trong-hoa-ly-thuy-canh-500x500.jpg?v=1751370806',
    ),
    PlantArticle(
      id: 'cn39',
      title: '2 Cách tự pha chế dung dịch thủy canh đơn giản hiệu quả nhất',
      summary:
          'Thông tin chi tiết về 2 cách tự pha chế dung dịch thủy canh đơn giản hiệu quả nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-tu-pha-che-dung-dich-thuy-canh/',
      publishedAt: DateTime(2025, 02, 28),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/cach-tu-pha-che-dung-dich-thuy-canh-1-500x334.jpg?v=1751370860',
    ),
    PlantArticle(
      id: 'cn40',
      title: '2 Cách trồng dừa bonsai thủy canh tại nhà dễ làm hiệu quả nhất',
      summary:
          'Thông tin chi tiết về 2 cách trồng dừa bonsai thủy canh tại nhà dễ làm hiệu quả nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-dua-bonsai-thuy-canh/',
      publishedAt: DateTime(2025, 02, 26),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/cach-trong-dua-bonsai-thuy-canh-thumb-500x279.jpg?v=1751370637',
    ),
    PlantArticle(
      id: 'cn41',
      title: '2 Cách trồng Lan thủy canh đơn giản hiệu quả năng suất nhất',
      summary:
          'Thông tin chi tiết về 2 cách trồng lan thủy canh đơn giản hiệu quả năng suất nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-lan-thuy-canh/',
      publishedAt: DateTime(2025, 02, 24),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/trong-lan-thuy-canh-thumb-500x279.jpg?v=1751370807',
    ),
    PlantArticle(
      id: 'cn42',
      title: '2 Cách trồng tỏi thủy canh (trong nước) đơn giản hiệu quả',
      summary:
          'Thông tin chi tiết về 2 cách trồng tỏi thủy canh (trong nước) đơn giản hiệu quả và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/trong-toi-thuy-canh/',
      publishedAt: DateTime(2025, 02, 22),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/01/trong-toi-thuy-canh-thumb-500x279.jpg?v=1751370932',
    ),
    PlantArticle(
      id: 'cn43',
      title: 'Cách trồng rau xà lách thủy canh hiệu quả cho năng suất nhất',
      summary:
          'Thông tin chi tiết về cách trồng rau xà lách thủy canh hiệu quả cho năng suất nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-rau-xa-lach-thuy-canh/',
      publishedAt: DateTime(2025, 02, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/12/xa-lach-thuy-canh-thumb-500x279.jpg?v=1751372912',
    ),
    PlantArticle(
      id: 'cn44',
      title: '2 Cách trồng tía tô thủy canh đơn giản tại nhà thành công 100%',
      summary:
          'Thông tin chi tiết về 2 cách trồng tía tô thủy canh đơn giản tại nhà thành công 100% và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-tia-to-thuy-canh/',
      publishedAt: DateTime(2025, 02, 18),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/12/cach-trong-tia-to-thuy-canh-don-gian-500x375.png?v=1751373001',
    ),
    PlantArticle(
      id: 'cn45',
      title: '2 Cách trồng sen Nhật thủy canh mini dễ làm thành công 100%',
      summary:
          'Thông tin chi tiết về 2 cách trồng sen nhật thủy canh mini dễ làm thành công 100% và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-sen-nhat-thuy-canh/',
      publishedAt: DateTime(2025, 02, 16),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/12/cach-trong-sen-nhat-thuy-canh-thumb-500x279.jpg?v=1751372988',
    ),
    PlantArticle(
      id: 'cn46',
      title: '2 Cách trồng khoai lang thủy canh (thủy sinh) chuẩn nhất 2023',
      summary:
          'Thông tin chi tiết về 2 cách trồng khoai lang thủy canh (thủy sinh) chuẩn nhất 2023 và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-khoai-lang-thuy-canh/',
      publishedAt: DateTime(2025, 02, 14),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/12/1-cach-trong-khoai-tay-thuy-canh-500x375.jpeg?v=1751373012',
    ),
    PlantArticle(
      id: 'cn47',
      title: 'Cách trồng rau thủy canh bằng ống nhựa PVC đúng cách (2023)',
      summary:
          'Thông tin chi tiết về cách trồng rau thủy canh bằng ống nhựa pvc đúng cách (2023) và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-rau-thuy-canh-bang-ong-nhua-pvc/',
      publishedAt: DateTime(2025, 02, 12),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/12/1-trong-rau-thuy-canh-bang-ong-nhua-pvc-500x375.png?v=1751372918',
    ),
    PlantArticle(
      id: 'cn48',
      title: 'Thi công nhà màng trồng rau thuỷ canh từ A-Z',
      summary:
          'Thông tin chi tiết về thi công nhà màng trồng rau thuỷ canh từ a-z và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/thi-cong-nha-mang-trong-rau-thuy-canh-tu-a-z/',
      publishedAt: DateTime(2025, 02, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/DSC9865-scaled-1-500x331.jpg?v=1751373168',
    ),
    PlantArticle(
      id: 'cn49',
      title: 'Biểu hiện thiếu chất ở cây trồng thuỷ canh',
      summary:
          'Thông tin chi tiết về biểu hiện thiếu chất ở cây trồng thuỷ canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/bieu-hien-thieu-chat-o-cay-trong-thuy-canh/',
      publishedAt: DateTime(2025, 02, 08),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/07/cay-thuy-canh-thieu-dinh-duong-500x375.jpg?v=1751373050',
    ),
    PlantArticle(
      id: 'cn50',
      title: 'Bí kíp tiết kiệm chi phí duy trì trong trang trại thuỷ canh',
      summary:
          'Thông tin chi tiết về bí kíp tiết kiệm chi phí duy trì trong trang trại thuỷ canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/bi-kip-tiet-kiem-chi-phi-duy-tri-trong-trang-trai-thuy-canh/',
      publishedAt: DateTime(2025, 02, 06),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/08/batch_73215693_957925661224095_8391013555347914752_n-500x375.jpg?v=1751373146',
    ),
    PlantArticle(
      id: 'cn51',
      title: '5 nguyên nhân khiến cây trồng thuỷ canh bị thối rễ',
      summary:
          'Thông tin chi tiết về 5 nguyên nhân khiến cây trồng thuỷ canh bị thối rễ và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/5-nguyen-nhan-khien-cay-trong-thuy-canh-bi-thoi-re/',
      publishedAt: DateTime(2025, 02, 04),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/07/cay-thuy-canh-bi-thoi-re-500x375.jpg?v=1751373051',
    ),
    PlantArticle(
      id: 'cn52',
      title: 'Trụ trồng rau thủy canh nhiều kích thước - Giá rẻ chất lượng',
      summary:
          'Thông tin chi tiết về trụ trồng rau thủy canh nhiều kích thước - giá rẻ chất lượng và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/thuy-canh-tru-dung-la-gi-uu-nhuoc-diem-ban-can-biet-truoc-khi-dau-tu-mo-hinh-nay/',
      publishedAt: DateTime(2025, 02, 02),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/07/thuy-canh-tru-dung-500x375.jpg?v=1751373052',
    ),
    PlantArticle(
      id: 'cn53',
      title: 'Những lưu ý khi trồng cây thủy canh',
      summary:
          'Thông tin chi tiết về những lưu ý khi trồng cây thủy canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/nhung-luu-y-khi-trong-cay-thuy-canh/',
      publishedAt: DateTime(2025, 01, 31),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/07/thi-cong-nha-mang-300m2-03-1-500x375.jpg?v=1751373174',
    ),
    PlantArticle(
      id: 'cn54',
      title: 'Vật tư thủy canh gồm những gì? Mua ở đâu?',
      summary:
          'Thông tin chi tiết về vật tư thủy canh gồm những gì? mua ở đâu? và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/vat-tu-thuy-canh-gom-nhung-gi-mua-o-dau/',
      publishedAt: DateTime(2025, 01, 29),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/02/DSC07318-scaled-1-500x334.jpg?v=1751373128',
    ),
    PlantArticle(
      id: 'cn55',
      title: 'Mua dụng cụ thủy canh giá tốt ở đâu?',
      summary:
          'Thông tin chi tiết về mua dụng cụ thủy canh giá tốt ở đâu? và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/mua-dung-cu-thuy-canh-gia-tot-o-dau/',
      publishedAt: DateTime(2025, 01, 27),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/08/batch_72448668_555767395197626_5526077168402038784_n-500x375.jpg?v=1751373147',
    ),
    PlantArticle(
      id: 'cn56',
      title: '2 Cách trồng rau má thủy canh hiệu quả năng suất cao nhất',
      summary:
          'Thông tin chi tiết về 2 cách trồng rau má thủy canh hiệu quả năng suất cao nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cach-trong-rau-ma-thuy-canh/',
      publishedAt: DateTime(2025, 01, 25),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/02/rau-ma-trong-thuy-canh-500x375.jpg?v=1751373846',
    ),
    PlantArticle(
      id: 'cn57',
      title: 'Cách trồng rau thủy canh bằng chai nhựa cho năng suất nhất',
      summary:
          'Thông tin chi tiết về cách trồng rau thủy canh bằng chai nhựa cho năng suất nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/huong-dan-cach-trong-rau-thuy-canh-bang-chai-nhua/',
      publishedAt: DateTime(2025, 01, 23),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/02/trong-rau-thuy-canh-trong-chai-nhua-500x250.jpg?v=1751373119',
    ),
    PlantArticle(
      id: 'cn58',
      title: '3 điều có thể bạn chưa biết về cây trồng thủy canh',
      summary:
          'Thông tin chi tiết về 3 điều có thể bạn chưa biết về cây trồng thủy canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/3-dieu-co-the-ban-chua-biet-ve-trong-cay-thuy-canh/',
      publishedAt: DateTime(2025, 01, 21),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/02/DSC07373-scaled-1-500x334.jpg?v=1751373125',
    ),
    PlantArticle(
      id: 'cn59',
      title: '5 thông tin quan trọng về cây cảnh thủy canh',
      summary:
          'Thông tin chi tiết về 5 thông tin quan trọng về cây cảnh thủy canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/5-thong-tin-quan-trong-ve-cay-canh-thuy-canh/',
      publishedAt: DateTime(2025, 01, 19),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/02/cay-canh-thuy-canh-500x500.jpg?v=1751373123',
    ),
    PlantArticle(
      id: 'cn60',
      title: 'Trang trại rau thuỷ canh hiệu quả tại Đông Anh Hà Nội của Hachi',
      summary:
          'Thông tin chi tiết về trang trại rau thuỷ canh hiệu quả tại đông anh hà nội của hachi và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/trang-trai-rau-thuy-canh-hieu-qua-tai-dong-anh-ha-noi-cua-hachi/',
      publishedAt: DateTime(2025, 01, 17),
      image:
          'https://hachi.com.vn/wp-content/uploads/2023/02/DSC07320-scaled-1-500x334.jpg?v=1751373124',
    ),
    PlantArticle(
      id: 'cn61',
      title: 'Top 5 trang trại trồng rau xà lách thuỷ canh nhìn là thích',
      summary:
          'Thông tin chi tiết về top 5 trang trại trồng rau xà lách thuỷ canh nhìn là thích và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/top-5-trang-trai-trong-rau-xa-lach-thuy-canh-nhin-la-thich/',
      publishedAt: DateTime(2025, 01, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2019/07/DSC00745-scaled-1-500x334.jpg?v=1751374101',
    ),
    PlantArticle(
      id: 'cn62',
      title: 'Thuỷ canh hồi lưu là gì? Cách lắp đặt hệ thống thuỷ canh hồi lưu',
      summary:
          'Thông tin chi tiết về thuỷ canh hồi lưu là gì? cách lắp đặt hệ thống thuỷ canh hồi lưu và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/thuy-canh-hoi-luu-la-gi-cach-lap-dat-he-thong-thuy-canh-hoi-luu/',
      publishedAt: DateTime(2025, 01, 13),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/08/thuy-canh-mang-mong-NFT-500x313.png?v=1751373157',
    ),
    PlantArticle(
      id: 'cn63',
      title: 'Tất tần tật về kỹ thuật trồng rau thuỷ canh màng mỏng NFT',
      summary:
          'Thông tin chi tiết về tất tần tật về kỹ thuật trồng rau thuỷ canh màng mỏng nft và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/tat-tan-tat-ve-ky-thuat-trong-rau-thuy-canh-mang-mong-nft/',
      publishedAt: DateTime(2025, 01, 11),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/08/batch_73215693_957925661224095_8391013555347914752_n-500x375.jpg?v=1751373146',
    ),
    PlantArticle(
      id: 'cn64',
      title: '3 bước tự thiết kế giàn thủy canh đơn giản tại nhà',
      summary:
          'Thông tin chi tiết về 3 bước tự thiết kế giàn thủy canh đơn giản tại nhà và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/3-buoc-tu-thiet-ke-gian-thuy-canh-don-gian-tai-nha/',
      publishedAt: DateTime(2025, 01, 09),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/08/thiet-ke-gian-thuy-canh-500x292.jpg?v=1751373158',
    ),
    PlantArticle(
      id: 'cn65',
      title: 'Thuyết minh dự án nông nghiệp công nghệ cao',
      summary:
          'Thông tin chi tiết về thuyết minh dự án nông nghiệp công nghệ cao và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/thuyet-minh-du-an-nong-nghiep-cong-nghe-cao/',
      publishedAt: DateTime(2025, 01, 07),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/03/DSC00396-scaled-1-500x334.jpg?v=1751373845',
    ),
    PlantArticle(
      id: 'cn66',
      title: '3 loại nhà màng trồng rau nông nghiệp công nghệ cao, giá tốt',
      summary:
          'Thông tin chi tiết về 3 loại nhà màng trồng rau nông nghiệp công nghệ cao, giá tốt và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/7-luu-y-truoc-khi-thi-cong-nha-mang-hachi/',
      publishedAt: DateTime(2025, 01, 05),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/06/DSC00477-scaled-1-500x334.jpg?v=1751373836',
    ),
    PlantArticle(
      id: 'cn67',
      title: 'Xây dựng trang trại trồng rau thuỷ canh từ A-Z',
      summary:
          'Thông tin chi tiết về xây dựng trang trại trồng rau thuỷ canh từ a-z và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/xay-dung-trang-trai-trong-rau-thuy-canh-tu-a-z/',
      publishedAt: DateTime(2025, 01, 03),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/03/DSC00396-scaled-1-500x334.jpg?v=1751373845',
    ),
    PlantArticle(
      id: 'cn68',
      title: 'Biểu hiện thiếu chất trên cây thủy canh',
      summary:
          'Thông tin chi tiết về biểu hiện thiếu chất trên cây thủy canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/bieu-hien-thieu-chat-tren-cay-thuy-canh/',
      publishedAt: DateTime(2025, 01, 01),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/03/bieu-hien-thieu-chat-tren-rau-thuy-canh-500x292.jpg?v=1751373821',
    ),
    PlantArticle(
      id: 'cn69',
      title: 'Lưu ý khi trồng rau sạch thủy canh',
      summary:
          'Thông tin chi tiết về lưu ý khi trồng rau sạch thủy canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/luu-y-khi-trong-rau-sach-thuy-canh/',
      publishedAt: DateTime(2024, 12, 30),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/03/luu-y-khi-trong-rau-sach-thuy-canh-500x292.jpg?v=1751373821',
    ),
    PlantArticle(
      id: 'cn70',
      title: 'Top 7 loại rau dễ trồng bằng phương pháp thủy canh',
      summary:
          'Thông tin chi tiết về top 7 loại rau dễ trồng bằng phương pháp thủy canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/top-7-loai-rau-de-trong-bang-phuong-phap-thuy-canh/',
      publishedAt: DateTime(2024, 12, 28),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/02/7-loai-rau-thuy-canh-de-trong-500x292.jpg?v=1751373822',
    ),
    PlantArticle(
      id: 'cn71',
      title: '15 lý do trồng rau thủy canh hàng đầu mà bạn nên biết',
      summary:
          'Thông tin chi tiết về 15 lý do trồng rau thủy canh hàng đầu mà bạn nên biết và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/15-ly-do-trong-rau-thuy-canh-hang-dau-ma-ban-nen-biet/',
      publishedAt: DateTime(2024, 12, 26),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/02/15-ly-do-trong-rau-thuy-canh-500x292.jpg?v=1751373823',
    ),
    PlantArticle(
      id: 'cn72',
      title: '6 cách làm đơn giản để loại bỏ rệp trên rau thủy canh?',
      summary:
          'Thông tin chi tiết về 6 cách làm đơn giản để loại bỏ rệp trên rau thủy canh? và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/6-cach-lam-don-gian-de-loai-bo-rep-tren-cay-thuy-canh/',
      publishedAt: DateTime(2024, 12, 24),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/02/Rep-tren-rau-thuy-canh-500x292.jpg?v=1751373822',
    ),
    PlantArticle(
      id: 'cn73',
      title: 'Các bước tự lắp đặt giàn thủy canh tại nhà',
      summary:
          'Thông tin chi tiết về các bước tự lắp đặt giàn thủy canh tại nhà và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/cac-buoc-tu-lap-dat-gian-thuy-canh-tai-nha/',
      publishedAt: DateTime(2024, 12, 22),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/10/Danh-sach-dung-cu-trong-gian-thuy-canh-500x500.jpg?v=1751373913',
    ),
    PlantArticle(
      id: 'cn74',
      title:
          'Cách trồng rau thủy canh tại nhà đầy đủ giúp bạn trồng thành công 100%',
      summary:
          'Thông tin chi tiết về cách trồng rau thủy canh tại nhà đầy đủ giúp bạn trồng thành công 100% và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/cach-trong-rau-thuy-canh-tai-nha-day-du-giup-ban-trong-thanh-cong-100/',
      publishedAt: DateTime(2024, 12, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/10/Cach-trong-rau-thuy-canh-tai-nha-500x292.jpg?v=1751373821',
    ),
    PlantArticle(
      id: 'cn75',
      title: '5 nguyên liệu trồng rau thủy canh phải có',
      summary:
          'Thông tin chi tiết về 5 nguyên liệu trồng rau thủy canh phải có và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/5-nguyen-lieu-trong-rau-thuy-canh-phai-co/',
      publishedAt: DateTime(2024, 12, 18),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/05/6-500x300.jpg?v=1751373930',
    ),
    PlantArticle(
      id: 'cn76',
      title: 'Có nên trồng rau thơm thủy canh hay không?',
      summary:
          'Thông tin chi tiết về có nên trồng rau thơm thủy canh hay không? và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/co-nen-trong-rau-thom-thuy-canh-hay-khong/',
      publishedAt: DateTime(2024, 12, 16),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/05/7-500x300.jpg?v=1751373930',
    ),
    PlantArticle(
      id: 'cn77',
      title: '3 Cách trồng rau muống thủy canh tại nhà năng suất cao nhất',
      summary:
          'Thông tin chi tiết về 3 cách trồng rau muống thủy canh tại nhà năng suất cao nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/cach-trong-rau-muong-thuy-canh-chuan-cho-nguoi-moi-bat-dau/',
      publishedAt: DateTime(2024, 12, 14),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/05/8-500x300.jpg?v=1751373930',
    ),
    PlantArticle(
      id: 'cn78',
      title: '5 bước chính trong phương pháp trồng rau thủy canh',
      summary:
          'Thông tin chi tiết về 5 bước chính trong phương pháp trồng rau thủy canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/5-buoc-chinh-trong-phuong-phap-trong-rau-thuy-canh/',
      publishedAt: DateTime(2024, 12, 12),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/05/9-500x300.jpg?v=1751373929',
    ),
    PlantArticle(
      id: 'cn79',
      title: 'Những lưu ý khi lắp đặt mô hình thủy canh hồi lưu',
      summary:
          'Thông tin chi tiết về những lưu ý khi lắp đặt mô hình thủy canh hồi lưu và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/nhung-luu-y-khi-lap-dat-mo-hinh-thuy-canh-hoi-luu/',
      publishedAt: DateTime(2024, 12, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/05/1-500x300.jpg?v=1751373932',
    ),
    PlantArticle(
      id: 'cn80',
      title: 'Trồng rau thủy canh: Quy trình & kỹ thuật, thông tin cần biết',
      summary:
          'Thông tin chi tiết về trồng rau thủy canh: quy trình & kỹ thuật, thông tin cần biết và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/trong-rau-thuy-canh/',
      publishedAt: DateTime(2024, 12, 08),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/07/trong-rau-thuy-canh-thumb-500x279.jpg?v=1751370612',
    ),
    PlantArticle(
      id: 'cn81',
      title: '3 nguyên lý trồng rau thủy canh quan trọng',
      summary:
          'Thông tin chi tiết về 3 nguyên lý trồng rau thủy canh quan trọng và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/3-nguyen-ly-trong-rau-thuy-canh-quan-trong/',
      publishedAt: DateTime(2024, 12, 06),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/06/11-500x300.jpg?v=1751373929',
    ),
    PlantArticle(
      id: 'cn82',
      title: 'Những lưu ý khi trồng cà chua thủy canh',
      summary:
          'Thông tin chi tiết về những lưu ý khi trồng cà chua thủy canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/nhung-luu-y-khi-trong-ca-chua-thuy-canh/',
      publishedAt: DateTime(2024, 12, 04),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/05/3-500x300.jpg?v=1751373931',
    ),
    PlantArticle(
      id: 'cn83',
      title: 'Top 4 giàn rau thủy canh tiết kiệm, hiệu quả 2023',
      summary:
          'Thông tin chi tiết về top 4 giàn rau thủy canh tiết kiệm, hiệu quả 2023 và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/top-4-gian-rau-thuy-canh-tiet-kiem-hieu-qua-2021/',
      publishedAt: DateTime(2024, 12, 02),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/05/2-500x300.jpg?v=1751373932',
    ),
    PlantArticle(
      id: 'cn84',
      title: 'Danh sách 10+ dụng cụ trồng rau thủy canh cần thiết nhất',
      summary:
          'Thông tin chi tiết về danh sách 10+ dụng cụ trồng rau thủy canh cần thiết nhất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/danh-sach-cac-dung-cu-trong-rau-thuy-canh-tai-nha/',
      publishedAt: DateTime(2024, 11, 30),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/05/4-500x300.jpg?v=1751373931',
    ),
    PlantArticle(
      id: 'cn85',
      title: '3 Cách trồng hành thủy canh siêu dễ hiệu quả nhất cho "bà con"',
      summary:
          'Thông tin chi tiết về 3 cách trồng hành thủy canh siêu dễ hiệu quả nhất cho "bà con" và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/ky-thuat-trong-hanh-thuy-canh-cho-nguoi-moi-bat-dau/',
      publishedAt: DateTime(2024, 11, 28),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/05/5-500x300.jpg?v=1751373931',
    ),
    PlantArticle(
      id: 'cn86',
      title: 'Có nên trồng măng tây thủy canh không?',
      summary:
          'Thông tin chi tiết về có nên trồng măng tây thủy canh không? và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/co-nen-trong-mang-tay-thuy-canh-khong/',
      publishedAt: DateTime(2024, 11, 26),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/05/mang-tay-500x281.jpg?v=1751374003',
    ),
    PlantArticle(
      id: 'cn87',
      title: 'Chi phí duy trì trang trại thuỷ canh',
      summary:
          'Thông tin chi tiết về chi phí duy trì trang trại thuỷ canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/chi-phi-duy-tri-trang-trai-thuy-canh/',
      publishedAt: DateTime(2024, 11, 24),
      image:
          'https://hachi.com.vn/wp-content/uploads/2019/09/batch_DSC00451-500x334.jpg?v=1751374082',
    ),
    PlantArticle(
      id: 'cn88',
      title: 'Kỹ thuật ươm cây trồng thuỷ canh quy mô trang trại',
      summary:
          'Thông tin chi tiết về kỹ thuật ươm cây trồng thuỷ canh quy mô trang trại và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/ky-thuat-uom-cay-trong-thuy-canh-quy-mo-trang-trai/',
      publishedAt: DateTime(2024, 11, 22),
      image:
          'https://hachi.com.vn/wp-content/uploads/2019/05/batch_72723349_444647542923691_8223888427876089856_n-500x375.jpg?v=1751374073',
    ),
    PlantArticle(
      id: 'cn89',
      title:
          'Các yếu tố cần lưu ý trong quá trình vệ sinh trang trại thuỷ canh',
      summary:
          'Thông tin chi tiết về các yếu tố cần lưu ý trong quá trình vệ sinh trang trại thuỷ canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/cac-yeu-to-can-luu-y-trong-qua-trinh-ve-sinh-trang-trai-thuy-canh/',
      publishedAt: DateTime(2024, 11, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2019/09/batch_DSC00449-500x334.jpg?v=1751374083',
    ),
    PlantArticle(
      id: 'cn90',
      title: '6 CÔNG VIỆC CƠ BẢN CỦA NGƯỜI VẬN HÀNH TRANG TRẠI THUỶ CANH',
      summary:
          'Thông tin chi tiết về 6 công việc cơ bản của người vận hành trang trại thuỷ canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/6-cong-viec-co-ban-cua-nguoi-van-hanh-trang-trai-thuy-canh/',
      publishedAt: DateTime(2024, 11, 18),
      image:
          'https://hachi.com.vn/wp-content/uploads/2019/09/DSC00316-scaled-1-500x263.jpg?v=1751374087',
    ),
    PlantArticle(
      id: 'cn91',
      title: '6 LOẠI RAU XÀ LÁCH PHỔ BIẾN TRỒNG THUỶ CANH',
      summary:
          'Thông tin chi tiết về 6 loại rau xà lách phổ biến trồng thuỷ canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/mot-so-loai-rau-xa-lach-thuong-trong-trong-he-thong-thuy-canh/',
      publishedAt: DateTime(2024, 11, 16),
      image:
          'https://hachi.com.vn/wp-content/uploads/2019/07/DSC00745-scaled-1-500x334.jpg?v=1751374101',
    ),
    PlantArticle(
      id: 'cn92',
      title: 'THỦY CANH VS AQUAPONICS',
      summary:
          'Thông tin chi tiết về thủy canh vs aquaponics và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/thuy-canh-vs-aquaponics/',
      publishedAt: DateTime(2024, 11, 14),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/11/aquaponics-open-graph-01-01-510x267.png?v=1741149692',
    ),
    PlantArticle(
      id: 'cn93',
      title:
          'ĐỪNG CỐ GẮNG PHÁT TRIỂN NHỮNG LOẠI RAU NÀY TRONG MÔI TRƯỜNG THỦY CANH',
      summary:
          'Thông tin chi tiết về đừng cố gắng phát triển những loại rau này trong môi trường thủy canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/dung-co-gang-trong-nhung-loai-cay-nay-theo-phuong-phap-thuy-canh/',
      publishedAt: DateTime(2024, 11, 12),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/10/DSEeLjkVoAAE7Wa-e1540260703991-510x368.jpg?v=1741149709',
    ),
    PlantArticle(
      id: 'cn94',
      title: 'THI CÔNG TRANG TRẠI THỦY CANH VIDACO - 300M2 TẠI VĨNH PHÚC',
      summary:
          'Thông tin chi tiết về thi công trang trại thủy canh vidaco - 300m2 tại vĩnh phúc và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/thi-cong-trang-trai-thuy-canh-vidaco-300m2-tai-vinh-phuc/',
      publishedAt: DateTime(2024, 11, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/11/44890919_1542782452534215_6564485430329212928_n-510x383.jpg?v=1741149694',
    ),
    PlantArticle(
      id: 'cn95',
      title:
          'DỰ ÁN MỚI CỦA HACHI TẠI CAMPUS K - COWORKING MỚI KHAI TRƯƠNG TẠI HÀ NỘI',
      summary:
          'Thông tin chi tiết về dự án mới của hachi tại campus k - coworking mới khai trương tại hà nội và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/du-an-moi-cua-hachi-tai-campus-k-coworking-moi-khai-truong-tai-ha-noi/',
      publishedAt: DateTime(2024, 11, 08),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/11/46513080_757967547897302_4949032145927536640_n-e1543220507963-scaled-1-510x293.jpg',
    ),
    PlantArticle(
      id: 'cn96',
      title: 'MỘT SỐ DẤU HIỆU NHẬN BIẾT THỪA/THIẾU DINH DƯỠNG Ở RAU THỦY CANH',
      summary:
          'Thông tin chi tiết về một số dấu hiệu nhận biết thừa/thiếu dinh dưỡng ở rau thủy canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/mot-so-dau-hieu-nhan-biet-thua-thieu-dinh-duong-o-rau-thuy-canh/',
      publishedAt: DateTime(2024, 11, 06),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/11/42299155_304080496839978_4754101374411603968_n-e1541576038337-510x288.png?v=1741149702',
    ),
    PlantArticle(
      id: 'cn97',
      title: 'MÔ HÌNH RAU THỦY CANH NỞ RỘ Ở CÁC HỘ GIA ĐÌNH TẠI NHA TRANG',
      summary:
          'Thông tin chi tiết về mô hình rau thủy canh nở rộ ở các hộ gia đình tại nha trang và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/mo-hinh-rau-thuy-canh-nha-trang/',
      publishedAt: DateTime(2024, 11, 04),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/10/Dan-pho-do-xo-trong-rau-khong-can-dat-nh-2-rau-ch-n-1540267195-width768height461-e1540867674992-510x296.jpg?v=1741149705',
    ),
    PlantArticle(
      id: 'cn98',
      title: 'Hạn chế vùng rễ trong thủy canh',
      summary:
          'Thông tin chi tiết về hạn chế vùng rễ trong thủy canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/han-che-vung-re-trong-thuy-canh/',
      publishedAt: DateTime(2024, 11, 02),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/10/1200-477520718-man-showing-hydroponic-plant-510x340.jpg?v=1741149707',
    ),
    PlantArticle(
      id: 'cn99',
      title:
          'LỰA CHỌN LOẠI CÂY MANG LẠI HIỆU QUẢ CAO CHO NGƯỜI SẢN XUẤT RAU THỦY CANH',
      summary:
          'Thông tin chi tiết về lựa chọn loại cây mang lại hiệu quả cao cho người sản xuất rau thủy canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/lua-chon-loai-cay-mang-lai-hieu-qua-cao-cho-nguoi-san-xuat-rau-thuy-canh/',
      publishedAt: DateTime(2024, 10, 31),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/10/UnpleasantSickFallowdeer-size_restricted-510x287.gif?v=1741149709',
    ),
    PlantArticle(
      id: 'cn100',
      title:
          'NÊN LỰA CHỌN NHÀ LƯỚI HAY NHÀ MÀNG/ NHÀ KÍNH ĐỂ TRỒNG RAU THỦY CANH?',
      summary:
          'Thông tin chi tiết về nên lựa chọn nhà lưới hay nhà màng/ nhà kính để trồng rau thủy canh? và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/nen-lua-chon-nha-luoi-hay-nha-mang-nha-kinh-de-trong-rau-thuy-canh/',
      publishedAt: DateTime(2024, 10, 29),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/02/nha-mang-CT-Hue-e1538561887658-510x270.jpg?v=1741149829',
    ),
    PlantArticle(
      id: 'cn101',
      title: 'GỐI VỤ RAU THỦY CANH',
      summary:
          'Thông tin chi tiết về gối vụ rau thủy canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/goi-vu-rau-thuy-canh/',
      publishedAt: DateTime(2024, 10, 27),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/10/557780ad4f9c2.image_-510x335.jpg?v=1741149711',
    ),
    PlantArticle(
      id: 'cn102',
      title: 'Ưu nhược điểm của hệ thống thủy canh',
      summary:
          'Thông tin chi tiết về ưu nhược điểm của hệ thống thủy canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/uu-diem-va-nhuoc-diem-cua-he-thong-thuy-canh/',
      publishedAt: DateTime(2024, 10, 25),
      image:
          'https://hachi.com.vn/wp-content/uploads/2019/05/batch_72249798_396495527960328_4058639602460655616_n-500x375.jpg?v=1751374071',
    ),
    PlantArticle(
      id: 'cn103',
      title:
          'TIỀM NĂNG & THÁCH THỨC TRONG SẢN XUẤT RAU THỦY CANH QUY MÔ THƯƠNG MẠI',
      summary:
          'Thông tin chi tiết về tiềm năng & thách thức trong sản xuất rau thủy canh quy mô thương mại và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/tiem-nang-thach-thuc-trong-san-xuat-rau-thuy-canh-huong-thuong-mai/',
      publishedAt: DateTime(2024, 10, 23),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/09/DSC00312-scaled-1-500x334.jpg?v=1751374103',
    ),
    PlantArticle(
      id: 'cn104',
      title: 'TẦM QUAN TRỌNG CỦA ĐƠN VỊ THI CÔNG TRANG TRẠI THỦY CANH',
      summary:
          'Thông tin chi tiết về tầm quan trọng của đơn vị thi công trang trại thủy canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/tam-quan-trong-cua-don-vi-thi-cong-trang-trai-thuy-canh/',
      publishedAt: DateTime(2024, 10, 21),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/02/24132052_1790020504344490_4636718437542091929_o-510x383.jpg',
    ),
    PlantArticle(
      id: 'cn105',
      title: '5 TRANG TRẠI THỦY CANH NỔI BẬT ĐƯỢC XÂY DỰNG BỞI HACHI',
      summary:
          'Thông tin chi tiết về 5 trang trại thủy canh nổi bật được xây dựng bởi hachi và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/5-trang-trai-thuy-canh-noi-bat-duoc-xay-dung-boi-hachi/',
      publishedAt: DateTime(2024, 10, 19),
      image:
          'https://hachi.com.vn/wp-content/uploads/2019/09/batch_DSC00777-500x334.jpg?v=1751374080',
    ),
    PlantArticle(
      id: 'cn106',
      title:
          '2018 - MÔ HÌNH NÔNG NGHIỆP CÔNG NGHỆ CAO NÀO TIỀM NĂNG TẠI VIỆT NAM?',
      summary:
          'Thông tin chi tiết về 2018 - mô hình nông nghiệp công nghệ cao nào tiềm năng tại việt nam? và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/2018-mo-hinh-nong-nghiep-cong-nghe-cao-nao-tiem-nang-tai-viet-nam/',
      publishedAt: DateTime(2024, 10, 17),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/08/39974402_662106917483473_1203087886560264192_n-510x383.jpg?v=1741149732',
    ),
    PlantArticle(
      id: 'cn107',
      title: 'Lựa chọn giàn thủy canh phù hợp với sản xuất quy mô trang trại',
      summary:
          'Thông tin chi tiết về lựa chọn giàn thủy canh phù hợp với sản xuất quy mô trang trại và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/lua-chon-gian-thuy-canh-quy-mo-trang-trai/',
      publishedAt: DateTime(2024, 10, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/09/N-01-510x325.png?v=1741149722',
    ),
    PlantArticle(
      id: 'cn108',
      title: 'CÁCH PHÒNG CHỐNG NHỆN ĐỎ - KẺ THÙ CỦA RAU THỦY CANH',
      summary:
          'Thông tin chi tiết về cách phòng chống nhện đỏ - kẻ thù của rau thủy canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/cach-phong-chong-nhen-do-ke-thu-cua-rau-thuy-canh/',
      publishedAt: DateTime(2024, 10, 13),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/08/little-red-bugs-tiny-red-spider-tiny-red-spider-by-prank-f-little-tiny-red-spider-bugs-tiny-red-red-mites-on-dogs-skin-e1535710680417-510x322.jpg?v=1741149723',
    ),
    PlantArticle(
      id: 'cn109',
      title: 'Cấu tạo và phân loại của hệ thống tưới nhỏ giọt thủy canh',
      summary:
          'Thông tin chi tiết về cấu tạo và phân loại của hệ thống tưới nhỏ giọt thủy canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/cau-tao-phan-loai-he-thong-thuy-canh-tuoi-nho-giot/',
      publishedAt: DateTime(2024, 10, 11),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/08/Bato-Buckets-510x247.jpg?v=1741149731',
    ),
    PlantArticle(
      id: 'cn110',
      title: '10 lợi ích tuyệt vời của hệ thống tưới nhỏ giọt',
      summary:
          'Thông tin chi tiết về 10 lợi ích tuyệt vời của hệ thống tưới nhỏ giọt và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/uu-nhuoc-diem-cua-he-thong-tuoi-nho-giot/',
      publishedAt: DateTime(2024, 10, 09),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/08/solujan-lawn-sprinklers-ltd-9-510x398.jpg?v=1741149732',
    ),
    PlantArticle(
      id: 'cn111',
      title: 'So sánh 2 mô hình tưới nhỏ giọt trên nên giá thể và nền đất',
      summary:
          'Thông tin chi tiết về so sánh 2 mô hình tưới nhỏ giọt trên nên giá thể và nền đất và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/so-sanh-2-mo-hinh-tuoi-nho-giot-tren-nen-gia-the-trong-moi-truo-dat/',
      publishedAt: DateTime(2024, 10, 07),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/08/SS-tuoi-nho-giot-01-01-510x332.png?v=1741149733',
    ),
    PlantArticle(
      id: 'cn112',
      title: 'NGƯỜI TIÊU DÙNG ĐÓN NHẬN RAU THỦY CANH NHƯ THẾ NÀO?',
      summary:
          'Thông tin chi tiết về người tiêu dùng đón nhận rau thủy canh như thế nào? và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/nguoi-tieu-dung-don-nhan-rau-thuy-canh-nhu-the-nao/',
      publishedAt: DateTime(2024, 10, 05),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/08/9-510x340.jpg?v=1741149739',
    ),
    PlantArticle(
      id: 'cn113',
      title: '5 loại cây trồng phù hợp với phương pháp thủy canh tưới nhỏ giọt',
      summary:
          'Thông tin chi tiết về 5 loại cây trồng phù hợp với phương pháp thủy canh tưới nhỏ giọt và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/5-loai-rau-trong-phu-hop-voi-mo-hinh-thuy-canh-tuoi-nho-giot/',
      publishedAt: DateTime(2024, 10, 03),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/07/081548_Dua_luoi-510x287.jpg?v=1751359823',
    ),
    PlantArticle(
      id: 'cn114',
      title: 'Dung dịch thủy canh: 10+ Thông tin bạn cần phải biết khi mua',
      summary:
          'Thông tin chi tiết về dung dịch thủy canh: 10+ thông tin bạn cần phải biết khi mua và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/dieu-can-luu-y-ve-dinh-duong-thuy-canh-quy-mo-cong-nghiep/',
      publishedAt: DateTime(2024, 10, 01),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/02/ductd-510x510.jpg',
    ),
    PlantArticle(
      id: 'cn115',
      title: 'CẦN CHUẨN BỊ GÌ TRƯỚC KHI XÂY DỰNG TRANG TRẠI THỦY CANH?',
      summary:
          'Thông tin chi tiết về cần chuẩn bị gì trước khi xây dựng trang trại thủy canh? và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/cac-buoc-chuan-bi-truoc-khi-xay-dung-trang-trai-thuy-canh/',
      publishedAt: DateTime(2024, 09, 29),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/06/36200319_2026058027407402_494345044937932800_n-scaled-1-510x383.jpg?v=1741149765',
    ),
    PlantArticle(
      id: 'cn116',
      title: '4 mô hình trồng rau thủy canh phố biến tại Việt Nam',
      summary:
          'Thông tin chi tiết về 4 mô hình trồng rau thủy canh phố biến tại việt nam và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/4-mo-hinh-trong-rau-thuy-canh-tieu-bieu/',
      publishedAt: DateTime(2024, 09, 27),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/04/Vegetable-cultivated-through-a-hydroponics-system-510x340.jpg?v=1741149742',
    ),
    PlantArticle(
      id: 'cn117',
      title: 'Quy trình đầy đủ các bước xây dựng trang trại thủy canh',
      summary:
          'Thông tin chi tiết về quy trình đầy đủ các bước xây dựng trang trại thủy canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/cac-buoc-de-xay-dung-trang-trai-trong-rau-thuy-canh/',
      publishedAt: DateTime(2024, 09, 25),
      image:
          'https://hachi.com.vn/wp-content/uploads/2019/07/DSC00745-scaled-1-500x334.jpg?v=1751374101',
    ),
    PlantArticle(
      id: 'cn118',
      title: 'CHỈ SỐ EC và TDS - HAI CHỈ SỐ QUAN TRỌNG TRONG THỦY CANH',
      summary:
          'Thông tin chi tiết về chỉ số ec và tds - hai chỉ số quan trọng trong thủy canh và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url:
          'https://hachi.com.vn/chi-so-ec-va-tds-yeu-to-quan-trong-nhat-trong-thuy-canh/',
      publishedAt: DateTime(2024, 09, 23),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/11/hydroponics-open-graph-01-510x286.png?v=1741149704',
    ),
    PlantArticle(
      id: 'cn119',
      title: 'CÓ NÊN ĂN RAU THỦY CANH KHÔNG?',
      summary:
          'Thông tin chi tiết về có nên ăn rau thủy canh không? và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/co-nen-an-rau-thuy-canh-khong/',
      publishedAt: DateTime(2024, 09, 21),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/08/ae590f57-bdf1-47b6-b2cb-e5e3eeaa3c55-510x286.jpg?v=1741149739',
    ),
    PlantArticle(
      id: 'cn120',
      title: 'TRỒNG RAU THỦY CANH TẠI NHÀ CẦN LƯU Ý NHỮNG GÌ?',
      summary:
          'Thông tin chi tiết về trồng rau thủy canh tại nhà cần lưu ý những gì? và các kiến thức thủy canh bổ ích.',
      source: 'Hachi News',
      category: ArticleCategory.camNang,
      url: 'https://hachi.com.vn/trong-rau-thuy-canh-tai-nha-can-luu-y-gi/',
      publishedAt: DateTime(2024, 09, 19),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/05/20150529_094119-01-scaled-1-510x510.jpeg?v=1741149768',
    ),
    // Chiếu sáng nhân tạo
    PlantArticle(
      id: 'cs1',
      title: 'Cách sử dụng đèn LED trồng cây đúng cho năng suất cao',
      summary:
          'Thông tin chi tiết về cách sử dụng đèn led trồng cây đúng cho năng suất cao và các giải pháp chiếu sáng nhân tạo trong nông nghiệp.',
      source: 'Hachi News',
      category: ArticleCategory.chieuSang,
      url:
          'https://hachi.com.vn/cach-su-dung-den-led-trong-cay-dung-cho-nang-suat-cao/',
      publishedAt: DateTime(2025, 06, 01),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/07/IMG_8808-2-scaled-1-500x375.jpg?v=1751373964',
    ),
    PlantArticle(
      id: 'cs2',
      title: 'Kinh nghiệm chọn mua loại đèn led trồng cây phù hợp',
      summary:
          'Thông tin chi tiết về kinh nghiệm chọn mua loại đèn led trồng cây phù hợp và các giải pháp chiếu sáng nhân tạo trong nông nghiệp.',
      source: 'Hachi News',
      category: ArticleCategory.chieuSang,
      url:
          'https://hachi.com.vn/kinh-nghiem-chon-mua-loai-den-led-trong-cay-phu-hop/',
      publishedAt: DateTime(2025, 05, 27),
      image:
          'https://hachi.com.vn/wp-content/uploads/2022/11/154102133_1539322296405615_2801404766804968751_n-500x375.jpg?v=1751373129',
    ),
    PlantArticle(
      id: 'cs3',
      title: 'Loại đèn led trồng rau nào tốt nhất?',
      summary:
          'Thông tin chi tiết về loại đèn led trồng rau nào tốt nhất? và các giải pháp chiếu sáng nhân tạo trong nông nghiệp.',
      source: 'Hachi News',
      category: ArticleCategory.chieuSang,
      url: 'https://hachi.com.vn/loai-den-led-trong-rau-nao-tot-nhat/',
      publishedAt: DateTime(2025, 05, 22),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/07/IMG_8496-scaled-1-500x375.jpg?v=1751373963',
    ),
    PlantArticle(
      id: 'cs4',
      title: 'Bí quyết xây dựng Phòng Vượt Đông Cho Vườn Lan từ A-Z',
      summary:
          'Thông tin chi tiết về bí quyết xây dựng phòng vượt đông cho vườn lan từ a-z và các giải pháp chiếu sáng nhân tạo trong nông nghiệp.',
      source: 'Hachi News',
      category: ArticleCategory.chieuSang,
      url:
          'https://hachi.com.vn/bi-quyet-xay-dung-phong-vuot-dong-cho-vuon-lan-tu-a-z/',
      publishedAt: DateTime(2025, 05, 17),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/07/IMG_8808-2-scaled-1-500x375.jpg?v=1751373964',
    ),
    PlantArticle(
      id: 'cs5',
      title: 'Đèn LED trồng cây Monstera Var (Trầu bà Nam Mỹ - đột biến)',
      summary:
          'Thông tin chi tiết về đèn led trồng cây monstera var (trầu bà nam mỹ - đột biến) và các giải pháp chiếu sáng nhân tạo trong nông nghiệp.',
      source: 'Hachi News',
      category: ArticleCategory.chieuSang,
      url:
          'https://hachi.com.vn/den-led-trong-cay-monstera-var-trau-ba-nam-my-dot-bien/',
      publishedAt: DateTime(2025, 05, 12),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/05/monstera-dot-bien-500x333.jpg?v=1751374007',
    ),
    PlantArticle(
      id: 'cs6',
      title: 'BÍ QUYẾT CHỌN ĐÈN QUANG HỢP CHO PHONG LAN VƯỢT ĐÔNG',
      summary:
          'Thông tin chi tiết về bí quyết chọn đèn quang hợp cho phong lan vượt đông và các giải pháp chiếu sáng nhân tạo trong nông nghiệp.',
      source: 'Hachi News',
      category: ArticleCategory.chieuSang,
      url:
          'https://hachi.com.vn/bi-quyet-chon-den-quang-hop-cho-phong-lan-vuot-dong/',
      publishedAt: DateTime(2025, 05, 07),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/04/hoa-lan-02-1548318814-1593078193452-1593078193452215135618-crop-15930789656201641890736-1-500x375.jpg?v=1751374008',
    ),
    PlantArticle(
      id: 'cs7',
      title: 'BÓNG ĐÈN TRỒNG LAN CHUYÊN DỤNG VƯỢT ĐÔNG',
      summary:
          'Thông tin chi tiết về bóng đèn trồng lan chuyên dụng vượt đông và các giải pháp chiếu sáng nhân tạo trong nông nghiệp.',
      source: 'Hachi News',
      category: ArticleCategory.chieuSang,
      url: 'https://hachi.com.vn/bong-den-trong-lan-chuyen-dung-vuot-dong/',
      publishedAt: DateTime(2025, 05, 02),
      image:
          'https://hachi.com.vn/wp-content/uploads/2021/04/efd92a520446f618af57-500x375.jpg',
    ),
    PlantArticle(
      id: 'cs8',
      title: 'Đèn Led trồng Lan chuyên dụng',
      summary:
          'Thông tin chi tiết về đèn led trồng lan chuyên dụng và các giải pháp chiếu sáng nhân tạo trong nông nghiệp.',
      source: 'Hachi News',
      category: ArticleCategory.chieuSang,
      url: 'https://hachi.com.vn/den-led-trong-lan/',
      publishedAt: DateTime(2025, 04, 27),
      image:
          'https://hachi.com.vn/wp-content/uploads/2020/08/Indoor-Orchid-Display-500x276.jpg?v=1751374050',
    ),
    PlantArticle(
      id: 'cs9',
      title: 'Đèn trồng cây full quang phổ và tách phổ',
      summary:
          'Thông tin chi tiết về đèn trồng cây full quang phổ và tách phổ và các giải pháp chiếu sáng nhân tạo trong nông nghiệp.',
      source: 'Hachi News',
      category: ArticleCategory.chieuSang,
      url: 'https://hachi.com.vn/den-trong-cay-full-quang-pho-va-tach-pho/',
      publishedAt: DateTime(2025, 04, 22),
      image:
          'https://hachi.com.vn/wp-content/uploads/2018/11/46492799_2147921672123589_7759708535985799168_n-scaled-1-510x383.jpg?v=1751387103',
    ),
    // Hệ thống tưới
    PlantArticle(
      id: 'tt1',
      title:
          'Cung cấp hệ thống phun sương tưới cây, tưới lan, tưới rau trong nhà màng',
      summary:
          'Thông tin chi tiết về cung cấp hệ thống phun sương tưới cây, tưới lan, tưới rau trong nhà màng và các giải pháp tưới tiêu hiện đại.',
      source: 'Hachi News',
      category: ArticleCategory.heThongTuoi,
      url: 'https://hachi.com.vn/he-thong-phun-suong-tuoi-cay/',
      publishedAt: DateTime(2025, 06, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/06/he-thong-phun-suong-tuoi-cay-500x330.jpg?v=1751370297',
    ),
    PlantArticle(
      id: 'tt2',
      title: 'Hệ thống tưới cây thông minh: Tất tần tật thông tin cần biết',
      summary:
          'Thông tin chi tiết về hệ thống tưới cây thông minh: tất tần tật thông tin cần biết và các giải pháp tưới tiêu hiện đại.',
      source: 'Hachi News',
      category: ArticleCategory.heThongTuoi,
      url: 'https://hachi.com.vn/he-thong-tuoi-cay-thong-minh/',
      publishedAt: DateTime(2025, 06, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/06/tieu-chi-lua-chon-he-thong-tuoi-cay-thong-minh-500x250.jpg?v=1751370303',
    ),
    PlantArticle(
      id: 'tt3',
      title:
          'Cách thiết kế hệ thống tưới cây tự động cho vườn nhà bạn đơn giản nhất',
      summary:
          'Thông tin chi tiết về cách thiết kế hệ thống tưới cây tự động cho vườn nhà bạn đơn giản nhất và các giải pháp tưới tiêu hiện đại.',
      source: 'Hachi News',
      category: ArticleCategory.heThongTuoi,
      url:
          'https://hachi.com.vn/cach-thiet-ke-he-thong-tuoi-cay-tu-dong-tai-nha/',
      publishedAt: DateTime(2025, 06, 05),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/06/he-thong-tuoi-phun-mua-500x500.jpg?v=1751370314',
    ),
    PlantArticle(
      id: 'tt4',
      title:
          '5 Cách làm hệ thống tưới nước nhỏ giọt tự chế tại nhà đơn giản nhất',
      summary:
          'Thông tin chi tiết về 5 cách làm hệ thống tưới nước nhỏ giọt tự chế tại nhà đơn giản nhất và các giải pháp tưới tiêu hiện đại.',
      source: 'Hachi News',
      category: ArticleCategory.heThongTuoi,
      url: 'https://hachi.com.vn/cach-lam-he-thong-tuoi-nuoc-nho-giot-tu-che/',
      publishedAt: DateTime(2025, 05, 31),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/05/he-thong-tuoi-nuoc-nho-giot-tu-che-co-van-dieu-tiet-500x331.jpg?v=1751370321',
    ),
    PlantArticle(
      id: 'tt5',
      title: 'Hệ thống tưới tự động: 10 +thông tin quan trọng nhất cần biết',
      summary:
          'Thông tin chi tiết về hệ thống tưới tự động: 10 +thông tin quan trọng nhất cần biết và các giải pháp tưới tiêu hiện đại.',
      source: 'Hachi News',
      category: ArticleCategory.heThongTuoi,
      url: 'https://hachi.com.vn/he-thong-tuoi-tu-dong/',
      publishedAt: DateTime(2025, 05, 26),
      image:
          'https://hachi.com.vn/wp-content/uploads/2024/05/loi-ich-cua-he-thong-tuoi-tu-dong-500x375.jpg?v=1751370337',
    ),
    // Kinh nghiệm trồng rau
    PlantArticle(
      id: 'kn1',
      title: 'Cách ươm cây giống cho người mới đúng kỹ thuật sau 5 bước',
      summary:
          'Thông tin chi tiết về cách ươm cây giống cho người mới đúng kỹ thuật sau 5 bước và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cach-uom-cay-giong/',
      publishedAt: DateTime(2025, 07, 01),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/11/cham-soc-va-phong-tru-sau-benh-500x300.jpg?v=1763451277',
    ),
    PlantArticle(
      id: 'kn2',
      title: '2 Cách trồng cà tím tại nhà đơn giản đúng kỹ thuật nhất',
      summary:
          'Thông tin chi tiết về 2 cách trồng cà tím tại nhà đơn giản đúng kỹ thuật nhất và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cach-trong-ca-tim-tai-nha/',
      publishedAt: DateTime(2025, 06, 28),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/09/gioi-thieu-ve-ca-tim-500x280.jpg?v=1756968099',
    ),
    PlantArticle(
      id: 'kn3',
      title: '2 cách trồng cà rốt thủy canh đúng kỹ thuật hiệu quả nhất',
      summary:
          'Thông tin chi tiết về 2 cách trồng cà rốt thủy canh đúng kỹ thuật hiệu quả nhất và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/ky-thuat-trong-ca-rot-thuy-canh/',
      publishedAt: DateTime(2025, 06, 25),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/09/cham-soc-ca-rot-trong-thuy-canh-1-500x400.jpg?v=1756827731',
    ),
    PlantArticle(
      id: 'kn4',
      title: '3 Cách trồng cà rốt tại nhà đơn giản hiệu quả nhất hiện nay',
      summary:
          'Thông tin chi tiết về 3 cách trồng cà rốt tại nhà đơn giản hiệu quả nhất hiện nay và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cach-trong-ca-rot-tai-nha/',
      publishedAt: DateTime(2025, 06, 22),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/07/thoi-vu-trong-ca-rot-500x333.jpg?v=1752162663',
    ),
    PlantArticle(
      id: 'kn5',
      title: '2 Cách trồng rau ngót đúng kỹ thuật cho năng suất cao',
      summary:
          'Thông tin chi tiết về 2 cách trồng rau ngót đúng kỹ thuật cho năng suất cao và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cach-trong-rau-ngot/',
      publishedAt: DateTime(2025, 06, 19),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/07/thu-hoach-rau-ngot-trong-tai-nha.jpg?v=1752115826',
    ),
    PlantArticle(
      id: 'kn6',
      title: 'Cách trồng rau lủi rừng tại nhà đơn giản năng suất nhất',
      summary:
          'Thông tin chi tiết về cách trồng rau lủi rừng tại nhà đơn giản năng suất nhất và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cach-trong-rau-lui-rung/',
      publishedAt: DateTime(2025, 06, 16),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/07/dac-diem-sinh-hoc-cua-rau-lui-rung.jpg?v=1752047929',
    ),
    PlantArticle(
      id: 'kn7',
      title: '7 Cách làm cây bị héo tươi trở lại đơn giản hiệu quả nhất',
      summary:
          'Thông tin chi tiết về 7 cách làm cây bị héo tươi trở lại đơn giản hiệu quả nhất và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cach-lam-cay-bi-heo-tuoi-tro-lai/',
      publishedAt: DateTime(2025, 06, 13),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/06/cay-soc-nhiet-do-thay-doi-moi-truong-dot-ngot-500x294.jpg?v=1751367496',
    ),
    PlantArticle(
      id: 'kn8',
      title:
          'Cách trồng cây phát tài khúc trong nước (thủy canh) chi tiết A - Z',
      summary:
          'Thông tin chi tiết về cách trồng cây phát tài khúc trong nước (thủy canh) chi tiết a - z và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cach-trong-cay-phat-tai-khuc-trong-nuoc/',
      publishedAt: DateTime(2025, 06, 10),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/06/cham-soc-phat-tai-khuc-trong-trong-nuoc-500x313.jpg?v=1751367498',
    ),
    PlantArticle(
      id: 'kn9',
      title: 'Các biện pháp phòng trừ sâu bệnh hại cây trồng & rau tốt nhất',
      summary:
          'Thông tin chi tiết về các biện pháp phòng trừ sâu bệnh hại cây trồng & rau tốt nhất và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cac-bien-phap-phong-tru-sau-benh-hai/',
      publishedAt: DateTime(2025, 06, 07),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/06/dung-bien-phap-hoa-hoc-phong-tru-sau-benh-500x333.jpg?v=1751367502',
    ),
    PlantArticle(
      id: 'kn10',
      title: 'Thiên địch là gì? Các loài thiên địch của sâu bệnh có ích',
      summary:
          'Thông tin chi tiết về thiên địch là gì? các loài thiên địch của sâu bệnh có ích và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cac-loai-thien-dich-cua-sau-benh/',
      publishedAt: DateTime(2025, 06, 04),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/06/thien-dich-la-gi-500x362.jpg?v=1751367508',
    ),
    PlantArticle(
      id: 'kn11',
      title:
          'Mùa thu trồng rau gì? Top 15 loại rau nên trồng vào mùa "lá rụng”',
      summary:
          'Thông tin chi tiết về mùa thu trồng rau gì? top 15 loại rau nên trồng vào mùa "lá rụng” và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/mua-thu-trong-rau-gi/',
      publishedAt: DateTime(2025, 06, 01),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/06/mua-thu-trong-rau-gi-o-mien-bac-500x375.jpg?v=1751367514',
    ),
    PlantArticle(
      id: 'kn12',
      title: '8 Bước trồng rau hữu cơ (organic) cho người mới chi tiết A - Z',
      summary:
          'Thông tin chi tiết về 8 bước trồng rau hữu cơ (organic) cho người mới chi tiết a - z và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cach-trong-rau-huu-co/',
      publishedAt: DateTime(2025, 05, 29),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/06/rau-huu-co-la-gi-500x313.jpg?v=1751367518',
    ),
    PlantArticle(
      id: 'kn13',
      title: 'Trồng rau trong thùng xốp có gây ung thư không? [Giải đáp]',
      summary:
          'Thông tin chi tiết về trồng rau trong thùng xốp có gây ung thư không? [giải đáp] và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url:
          'https://hachi.com.vn/trong-rau-trong-thung-xop-co-gay-ung-thu-khong/',
      publishedAt: DateTime(2025, 05, 26),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/06/trong-rau-trong-thung-xop-khong-gay-ung-thu-500x332.jpg?v=1751367519',
    ),
    PlantArticle(
      id: 'kn14',
      title: '6 Cách cải tạo đất khô cằn, phèn chua hiệu quả tốt nhất',
      summary:
          'Thông tin chi tiết về 6 cách cải tạo đất khô cằn, phèn chua hiệu quả tốt nhất và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cach-cai-tao-dat-kho-can/',
      publishedAt: DateTime(2025, 05, 23),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/05/the-nao-la-dat-kho-can-500x332.jpg?v=1751367521',
    ),
    PlantArticle(
      id: 'kn15',
      title: '7 Cách cải tạo đất sét để trồng rau hiệu quả chi phí thấp nhất',
      summary:
          'Thông tin chi tiết về 7 cách cải tạo đất sét để trồng rau hiệu quả chi phí thấp nhất và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cach-cai-tao-dat-set-de-trong-rau/',
      publishedAt: DateTime(2025, 05, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/05/dat-set-la-loai-dat-gi-500x281.jpg?v=1751367524',
    ),
    PlantArticle(
      id: 'kn16',
      title: '6 Cách cải tạo đất cát để trồng rau đúng kỹ thuật hiệu quả nhất',
      summary:
          'Thông tin chi tiết về 6 cách cải tạo đất cát để trồng rau đúng kỹ thuật hiệu quả nhất và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cach-cai-tao-dat-cat-de-trong-rau/',
      publishedAt: DateTime(2025, 05, 17),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/05/cach-cai-tao-dat-cat-de-trong-rau-bang-phan-huu-co-500x333.jpg?v=1751367527',
    ),
    PlantArticle(
      id: 'kn17',
      title: '14 mô hình trồng rau ngắn ngày thu nhập cao mới nhất hiện nay',
      summary:
          'Thông tin chi tiết về 14 mô hình trồng rau ngắn ngày thu nhập cao mới nhất hiện nay và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/mo-hinh-trong-rau-ngan-ngay-thu-nhap-cao/',
      publishedAt: DateTime(2025, 05, 14),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/05/trong-rau-ngan-ngay-thu-nhap-cao-mong-toi-500x375.jpg?v=1751367540',
    ),
    PlantArticle(
      id: 'kn18',
      title: '20+ dụng cụ trồng rau sạch tại nhà phổ biến hữu dụng nhất',
      summary:
          'Thông tin chi tiết về 20+ dụng cụ trồng rau sạch tại nhà phổ biến hữu dụng nhất và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/dung-cu-trong-rau/',
      publishedAt: DateTime(2025, 05, 11),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/05/gia-the-500x300.jpg?v=1751367547',
    ),
    PlantArticle(
      id: 'kn19',
      title: 'TOP 10 loại rau thơm trồng được trong bóng râm tốt nhất',
      summary:
          'Thông tin chi tiết về top 10 loại rau thơm trồng được trong bóng râm tốt nhất và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cac-loai-rau-thom-trong-duoc-trong-bong-ram/',
      publishedAt: DateTime(2025, 05, 08),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/05/rau-mui-tau-500x333.jpg?v=1751367552',
    ),
    PlantArticle(
      id: 'kn20',
      title: 'Mùa hè trồng rau gì ở các miền Việt Nam? Top 30 loại phổ biến',
      summary:
          'Thông tin chi tiết về mùa hè trồng rau gì ở các miền việt nam? top 30 loại phổ biến và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/mua-he-trong-rau-gi/',
      publishedAt: DateTime(2025, 05, 05),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/05/mua-he-trong-rau-gi-rau-ngot-duoc-khong-500x281.jpg?v=1751367558',
    ),
    PlantArticle(
      id: 'kn21',
      title: 'Tháng 12 trồng rau gì ở miền Bắc, Trung, Nam năng suất nhất',
      summary:
          'Thông tin chi tiết về tháng 12 trồng rau gì ở miền bắc, trung, nam năng suất nhất và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/thang-12-trong-rau-gi-2/',
      publishedAt: DateTime(2025, 05, 02),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/05/thang-12-trong-rau-gi-dau-ha-lan-duoc-khong-500x328.jpg?v=1751367564',
    ),
    PlantArticle(
      id: 'kn22',
      title: 'Tháng 11 trồng rau gì ở miền bắc, trung, nam năng suất nhất',
      summary:
          'Thông tin chi tiết về tháng 11 trồng rau gì ở miền bắc, trung, nam năng suất nhất và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/thang-11-trong-rau-gi/',
      publishedAt: DateTime(2025, 04, 29),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/05/thang-11-trong-rau-gi-bau-ho-lo-duoc-khong-500x313.jpg?v=1751367575',
    ),
    PlantArticle(
      id: 'kn23',
      title: 'Tháng 10 trồng rau gì ở miền Bắc, Trung, Nam năng suất nhất',
      summary:
          'Thông tin chi tiết về tháng 10 trồng rau gì ở miền bắc, trung, nam năng suất nhất và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/thang-10-trong-rau-gi/',
      publishedAt: DateTime(2025, 04, 26),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/05/thang-10-trong-rau-gi-sup-lo-xanh-co-trong-duoc-khong-500x333.jpg?v=1751367587',
    ),
    PlantArticle(
      id: 'kn24',
      title: 'Tháng 9 trồng rau gì ở miền bắc, trung, nam năng suất nhất',
      summary:
          'Thông tin chi tiết về tháng 9 trồng rau gì ở miền bắc, trung, nam năng suất nhất và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/thang-9-trong-rau-gi/',
      publishedAt: DateTime(2025, 04, 23),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/05/trong-cai-thao-thang-9-500x333.jpg?v=1751367600',
    ),
    PlantArticle(
      id: 'kn25',
      title: 'Tháng 8 trồng rau gì ở miền Bắc, Trung, Nam năng suất nhất',
      summary:
          'Thông tin chi tiết về tháng 8 trồng rau gì ở miền bắc, trung, nam năng suất nhất và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/thang-8-trong-rau-gi/',
      publishedAt: DateTime(2025, 04, 20),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/04/trong-hanh-tay-thang-8-500x334.jpg?v=1751367608',
    ),
    PlantArticle(
      id: 'kn26',
      title: 'Tháng 7 trồng rau gì ở miền Bắc, Trung, Nam năng suất nhất',
      summary:
          'Thông tin chi tiết về tháng 7 trồng rau gì ở miền bắc, trung, nam năng suất nhất và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/thang-7-trong-rau-gi/',
      publishedAt: DateTime(2025, 04, 17),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/04/trong-bap-cai-thang-7-o-mien-nam-500x281.jpg?v=1751367611',
    ),
    PlantArticle(
      id: 'kn27',
      title: 'Tháng 6 trồng rau gì ở miền Bắc, Trung, Nam năng suất nhất',
      summary:
          'Thông tin chi tiết về tháng 6 trồng rau gì ở miền bắc, trung, nam năng suất nhất và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/thang-6-trong-rau-gi/',
      publishedAt: DateTime(2025, 04, 14),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/04/trong-muop-dang-500x375.jpg?v=1751367615',
    ),
    PlantArticle(
      id: 'kn28',
      title: '3 Cách trồng cải Kale (cải xoăn) tại nhà đơn giản hiệu quả nhất',
      summary:
          'Thông tin chi tiết về 3 cách trồng cải kale (cải xoăn) tại nhà đơn giản hiệu quả nhất và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cach-trong-cai-kale/',
      publishedAt: DateTime(2025, 04, 11),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/04/cham-soc-cay-con-500x281.jpg?v=1751367620',
    ),
    PlantArticle(
      id: 'kn29',
      title: 'Cách trồng rau răm tại nhà sau 6 bước hiệu quả nhất',
      summary:
          'Thông tin chi tiết về cách trồng rau răm tại nhà sau 6 bước hiệu quả nhất và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cach-trong-rau-ram-2/',
      publishedAt: DateTime(2025, 04, 08),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/03/chon-giong-ram-khoe-manh-500x331.jpg?v=1751367678',
    ),
    PlantArticle(
      id: 'kn30',
      title: '2 Cách trồng rau càng cua tại nhà tươi sạch ngon, ăn "không hết"',
      summary:
          'Thông tin chi tiết về 2 cách trồng rau càng cua tại nhà tươi sạch ngon, ăn "không hết" và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url:
          'https://hachi.com.vn/2-cach-trong-rau-cang-cua-tai-nha-dung-ky-thuat/',
      publishedAt: DateTime(2025, 04, 05),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/03/cong-dung-cua-rau-cang-cua-500x355.jpg?v=1751369004',
    ),
    PlantArticle(
      id: 'kn31',
      title: 'Cách trồng rau mùa mưa đạt hiệu quả cao qua 10 bí quyết sau',
      summary:
          'Thông tin chi tiết về cách trồng rau mùa mưa đạt hiệu quả cao qua 10 bí quyết sau và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cach-trong-rau-vao-mua-mua/',
      publishedAt: DateTime(2025, 04, 02),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/03/cach-trong-rau-mua-mua-nhu-nao-500x335.jpg?v=1751369029',
    ),
    PlantArticle(
      id: 'kn32',
      title: '3 Cách trồng rau cải ngọt tươi sạch tại nhà ăn quanh năm',
      summary:
          'Thông tin chi tiết về 3 cách trồng rau cải ngọt tươi sạch tại nhà ăn quanh năm và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cach-trong-cai-ngot/',
      publishedAt: DateTime(2025, 03, 30),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/03/cach-trong-rau-cai-ngot-don-gian-500x357.jpg?v=1751369032',
    ),
    PlantArticle(
      id: 'kn33',
      title: 'Cách trồng cần tây đúng kỹ thuật qua 8 bước đơn giản nhất',
      summary:
          'Thông tin chi tiết về cách trồng cần tây đúng kỹ thuật qua 8 bước đơn giản nhất và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cach-trong-can-tay/',
      publishedAt: DateTime(2025, 03, 27),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/03/trong-can-tay-nhu-nao-500x308.jpg?v=1751369039',
    ),
    PlantArticle(
      id: 'kn34',
      title: '3 Cách trồng rau cải xanh tại nhà ngon sạch nhanh thu hoạch',
      summary:
          'Thông tin chi tiết về 3 cách trồng rau cải xanh tại nhà ngon sạch nhanh thu hoạch và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cach-trong-rau-cai-xanh-tai-nha/',
      publishedAt: DateTime(2025, 03, 24),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/03/cach-trong-rau-cai-xanh-de-nhat-500x375.jpg?v=1751369042',
    ),
    PlantArticle(
      id: 'kn35',
      title: '4 Cách trồng rau má tại nhà tươi ngon, thu hoạch quanh năm',
      summary:
          'Thông tin chi tiết về 4 cách trồng rau má tại nhà tươi ngon, thu hoạch quanh năm và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cach-trong-rau-ma/',
      publishedAt: DateTime(2025, 03, 21),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/03/dac-tinh-cua-rau-ma-500x334.jpg?v=1751369046',
    ),
    PlantArticle(
      id: 'kn36',
      title: '4 Cách trồng rau dền tại nhà tươi ngon, ăn quanh năm hiệu quả',
      summary:
          'Thông tin chi tiết về 4 cách trồng rau dền tại nhà tươi ngon, ăn quanh năm hiệu quả và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cach-trong-rau-den/',
      publishedAt: DateTime(2025, 03, 18),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/03/cach-trong-rau-den-tai-nha-500x316.jpg?v=1751369047',
    ),
    PlantArticle(
      id: 'kn37',
      title: 'Cách trồng rau mồng tơi thủy canh tại nhà qua 5 bước đơn giản',
      summary:
          'Thông tin chi tiết về cách trồng rau mồng tơi thủy canh tại nhà qua 5 bước đơn giản và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cach-trong-rau-mong-toi-thuy-canh/',
      publishedAt: DateTime(2025, 03, 15),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/03/trong-rau-mong-toi-thuy-canh-500x334.jpg?v=1751369057',
    ),
    PlantArticle(
      id: 'kn38',
      title: 'Cach trong rau mong toi',
      summary:
          'Thông tin chi tiết về cach trong rau mong toi và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cach-trong-rau-mong-toi/',
      publishedAt: DateTime(2025, 03, 12),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/03/cach-trong-rau-mong-toi-trong-chau-500x375.jpg?v=1751369058',
    ),
    PlantArticle(
      id: 'kn39',
      title: 'Cách trồng rau húng lủi thủy canh tại nhà sau 6 bước cực dễ',
      summary:
          'Thông tin chi tiết về cách trồng rau húng lủi thủy canh tại nhà sau 6 bước cực dễ và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cach-trong-rau-hung-lui-thuy-canh/',
      publishedAt: DateTime(2025, 03, 09),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/03/trong-rau-hung-lui-thuy-canh-de-dang-500x263.jpg?v=1751369062',
    ),
    PlantArticle(
      id: 'kn40',
      title: '5 Cách cách trồng rau tần ô (cải cúc) tại nhà tươi ngon dễ nhất',
      summary:
          'Thông tin chi tiết về 5 cách cách trồng rau tần ô (cải cúc) tại nhà tươi ngon dễ nhất và các kinh nghiệm trồng rau hữu ích.',
      source: 'Hachi News',
      category: ArticleCategory.kinhNghiem,
      url: 'https://hachi.com.vn/cach-trong-rau-tan-o/',
      publishedAt: DateTime(2025, 03, 06),
      image:
          'https://hachi.com.vn/wp-content/uploads/2025/02/cach-trong-rau-tan-o-500x350.jpg?v=1751369066',
    ),
  ];

  List<PlantArticle> fetchArticles() => List.unmodifiable(_sampleArticles);

  List<String> availableCategoryLabels() {
    return ArticleCategory.values.map((category) => category.label).toList();
  }
}
