import 'supabase_service.dart';
import '../models/user_model.dart';

class UserService {
  final _supabase = SupabaseService.instance;

  // Get user data by ID
  Future<UserModel?> getUserData(String userId) async {
    try {
      final response = await _supabase.users.select().eq('id', userId).single();

      return UserModel.fromJson(response);
    } catch (e) {
      return null;
    }
  }

  // Get user data stream (realtime updates)
  Stream<UserModel?> userDataStream(String userId) {
    print('📡 UserService: Setting up stream for userId: $userId');
    return _supabase.users.stream(primaryKey: ['id']).eq('id', userId).map((
      data,
    ) {
      print('📦 UserService: Stream received data: $data');
      if (data.isEmpty) {
        print('⚠️ UserService: Data is empty!');
        return null;
      }
      final userModel = UserModel.fromJson(data.first);
      print('👤 UserService: Parsed UserModel: ${userModel.toJson()}');
      return userModel;
    });
  }

  // Update user data
  Future<void> updateUserData({
    required String userId,
    String? displayName,
  }) async {
    try {
      final updates = <String, dynamic>{};
      if (displayName != null) updates['display_name'] = displayName;

      if (updates.isNotEmpty) {
        await _supabase.users.update(updates).eq('id', userId);
      }
    } catch (e) {
      rethrow;
    }
  }

  // Check if user is approved
  Future<bool> checkIfUserApproved(String userId) async {
    try {
      final response = await _supabase.users
          .select('is_approved')
          .eq('id', userId)
          .single();

      return response['is_approved'] as bool;
    } catch (e) {
      return false;
    }
  }
}
