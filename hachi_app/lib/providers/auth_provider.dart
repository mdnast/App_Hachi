import 'dart:async';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';
import '../services/user_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  final UserService _userService = UserService();

  User? _currentAuthUser;
  UserModel? _currentUserData;
  bool _isLoading = true;
  String? _error;
  StreamSubscription<AuthState>? _authSubscription;
  StreamSubscription<UserModel?>? _userDataSubscription;

  AuthProvider() {
    _initialize();
  }

  // Getters
  User? get currentAuthUser => _currentAuthUser;
  UserModel? get currentUserData => _currentUserData;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _currentAuthUser != null;
  bool get isApproved => _currentUserData?.isApproved ?? false;
  bool get isAdmin => _currentUserData?.isAdmin ?? false;
  bool get canAccessApp => isAuthenticated && isApproved;

  void _initialize() {
    _currentAuthUser = _authService.currentUser;

    // Listen to auth state changes
    _authSubscription = _authService.authStateChanges.listen((authState) {
      _currentAuthUser = authState.session?.user;

      if (_currentAuthUser != null) {
        _loadUserData(_currentAuthUser!.id);
      } else {
        _currentUserData = null;
        _userDataSubscription?.cancel();
        _isLoading = false;
        notifyListeners();
      }
    });

    // Load initial user data if signed in
    if (_currentAuthUser != null) {
      _loadUserData(_currentAuthUser!.id);
    } else {
      _isLoading = false;
    }
  }

  void _loadUserData(String userId) {
    print('🔍 AuthProvider: Loading user data for userId: $userId');
    // Cancel previous subscription
    _userDataSubscription?.cancel();

    // Listen to user data changes (realtime)
    _userDataSubscription = _userService
        .userDataStream(userId)
        .listen(
          (userData) {
            print('✅ AuthProvider: Received user data: ${userData?.toJson()}');
            _currentUserData = userData;
            _isLoading = false;
            _error = null;
            notifyListeners();
          },
          onError: (error) {
            print('❌ AuthProvider: Error loading user data: $error');
            _error = 'Không thể tải thông tin người dùng';
            _isLoading = false;
            notifyListeners();
          },
        );
  }

  // Sign up
  Future<bool> signUp({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await _authService.signUp(
        email: email,
        password: password,
        displayName: displayName,
      );

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = _getErrorMessage(e);
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Sign in
  Future<bool> signIn({required String email, required String password}) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await _authService.signIn(email: email, password: password);

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = _getErrorMessage(e);
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _authService.signOut();
      _currentAuthUser = null;
      _currentUserData = null;
      _userDataSubscription?.cancel();
      notifyListeners();
    } catch (e) {
      _error = _getErrorMessage(e);
      notifyListeners();
    }
  }

  // Reset password
  Future<bool> resetPassword(String email) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await _authService.resetPasswordForEmail(email);

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = _getErrorMessage(e);
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  String _getErrorMessage(dynamic error) {
    if (error is AuthException) {
      switch (error.message) {
        case 'Invalid login credentials':
          return 'Email hoặc mật khẩu không đúng';
        case 'User already registered':
          return 'Email đã được sử dụng';
        case 'Email not confirmed':
          return 'Vui lòng xác nhận email';
        default:
          return error.message;
      }
    }
    return 'Đã xảy ra lỗi. Vui lòng thử lại.';
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    _userDataSubscription?.cancel();
    super.dispose();
  }
}
