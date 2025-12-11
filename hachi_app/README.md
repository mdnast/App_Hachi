# Hachi App 🌿

Ứng dụng Nông nghiệp Thông minh Hachi - Giải pháp toàn diện cho nông nghiệp phố và trang trại công nghệ cao.

## 🌟 Tính năng chính

- **Trang chủ (Dashboard)**:
  - Xem thời tiết và vị trí hiện tại.
  - Tin tức nông nghiệp mới nhất.
  - Truy cập nhanh các tính năng.
- **Vườn của tôi (My Garden)**:
  - Quản lý nhật ký gieo trồng.
  - Theo dõi quy trình VietGAP.
- **Cửa hàng (Shop)**:
  - Mua sắm vật tư nông nghiệp, hạt giống, dinh dưỡng.
- **Trợ lý AI (Smart Assistant)**:
  - Chat với chuyên gia AI về kỹ thuật trồng trọt.
  - Hỗ trợ giải đáp thắc mắc 24/7.

## 🛠 Cài đặt & Cấu hình

### 1. Yêu cầu
- Flutter SDK (Latest stable version)
- Dart SDK

### 2. Cài đặt dependencies
```bash
flutter pub get
```

### 3. Cấu hình môi trường (Environment Variables)
Dự án sử dụng `flutter_dotenv` để quản lý các khóa bảo mật.

1. Tạo file `.env` tại thư mục gốc của dự án (cùng cấp với `pubspec.yaml`).
2. Copy nội dung từ file `.env.example` sang `.env`.
3. Điền API Key của bạn vào:

```env
MEGA_AI_API_KEY=sk-mega-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

> **Lưu ý**: File `.env` chứa thông tin nhạy cảm và đã được thêm vào `.gitignore` để không bị lộ trên GitHub.

### 4. Chạy ứng dụng
```bash
flutter run
```

## 📱 Cấu trúc thư mục

- `lib/screens`: Các màn hình chính (Dashboard, Shop, Chat, v.v.).
- `lib/services`: Các services xử lý logic (API, Location, Weather).
- `lib/models`: Các mô hình dữ liệu.
- `lib/widgets`: Các widget tái sử dụng.
- `assets`: Hình ảnh và tài nguyên tĩnh.

---
© 2024 Hachi Vietnam. All rights reserved.
