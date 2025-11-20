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
  ];

  List<PlantArticle> fetchArticles() => List.unmodifiable(_sampleArticles);

  List<String> availableCategoryLabels() {
    return ArticleCategory.values.map((category) => category.label).toList();
  }
}
