import 'supabase_service.dart';
import '../models/user_model.dart';

class AdminService {
  final _supabase = SupabaseService.instance;

  // Get all pending users (waiting for approval)
  Future<List<UserModel>> getPendingUsers() async {
    try {
      final response = await _supabase.users
          .select()
          .eq('is_approved', false)
          .order('created_at', ascending: false);

      return (response as List)
          .map((json) => UserModel.fromJson(json))
          .toList();
    } catch (e) {
      return [];
    }
  }

  // Get all users
  Future<List<UserModel>> getAllUsers() async {
    try {
      final response = await _supabase.users.select().order(
        'created_at',
        ascending: false,
      );

      return (response as List)
          .map((json) => UserModel.fromJson(json))
          .toList();
    } catch (e) {
      return [];
    }
  }

  // Approve user
  Future<void> approveUser({
    required String userId,
    required String approvedBy,
  }) async {
    try {
      await _supabase.users
          .update({
            'is_approved': true,
            'approved_at': DateTime.now().toIso8601String(),
            'approved_by': approvedBy,
          })
          .eq('id', userId);
    } catch (e) {
      rethrow;
    }
  }

  // Reject/Delete user
  Future<void> deleteUser(String userId) async {
    try {
      await _supabase.users.delete().eq('id', userId);
    } catch (e) {
      rethrow;
    }
  }

  // Change user role
  Future<void> changeUserRole({
    required String userId,
    required String role,
  }) async {
    try {
      await _supabase.users.update({'role': role}).eq('id', userId);
    } catch (e) {
      rethrow;
    }
  }

  // Search users by email or name
  Future<List<UserModel>> searchUsers(String query) async {
    try {
      final response = await _supabase.users
          .select()
          .or('email.ilike.%$query%,display_name.ilike.%$query%')
          .order('created_at', ascending: false);

      return (response as List)
          .map((json) => UserModel.fromJson(json))
          .toList();
    } catch (e) {
      return [];
    }
  }

  // Get users by role
  Future<List<UserModel>> getUsersByRole(String role) async {
    try {
      final response = await _supabase.users
          .select()
          .eq('role', role)
          .order('created_at', ascending: false);

      return (response as List)
          .map((json) => UserModel.fromJson(json))
          .toList();
    } catch (e) {
      return [];
    }
  }
}
