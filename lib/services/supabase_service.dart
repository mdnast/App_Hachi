import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static SupabaseService? _instance;
  static SupabaseClient? _client;

  SupabaseService._();

  static SupabaseService get instance {
    _instance ??= SupabaseService._();
    return _instance!;
  }

  static Future<void> initialize({
    required String url,
    required String anonKey,
  }) async {
    await Supabase.initialize(url: url, anonKey: anonKey);
    _client = Supabase.instance.client;
  }

  SupabaseClient get client {
    if (_client == null) {
      throw Exception(
        'Supabase chưa được khởi tạo. Vui lòng gọi initialize() trước.',
      );
    }
    return _client!;
  }

  GoTrueClient get auth => client.auth;
  SupabaseQueryBuilder get users => client.from('users');
}
