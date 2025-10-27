import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/app_constants.dart';
import '../models/user_model.dart';

/// Auth Service - Handles authentication logic
class AuthService {
  AuthService._();

  static final AuthService instance = AuthService._();

  /// Login user
  Future<UserModel?> login(String email, String password) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock authentication - In production, call actual API
    // For demo, accept any email/password combination
    if (email.isNotEmpty && password.isNotEmpty) {
      final user = UserModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        email: email,
        name: email.split('@')[0],
        phone: null,
      );

      // Save auth token and user data
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(AppConstants.keyAuthToken, 'mock_token_${user.id}');
      await prefs.setString(AppConstants.keyUserId, user.id);
      await prefs.setString('user_data', jsonEncode(user.toJson()));

      return user;
    }

    return null;
  }

  /// Signup user
  Future<UserModel?> signup(
    String email,
    String password,
    String name,
    String? phone,
  ) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock signup - In production, call actual API
    if (email.isNotEmpty && password.isNotEmpty && name.isNotEmpty) {
      final user = UserModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        email: email,
        name: name,
        phone: phone,
      );

      // Save auth token and user data
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(AppConstants.keyAuthToken, 'mock_token_${user.id}');
      await prefs.setString(AppConstants.keyUserId, user.id);
      await prefs.setString('user_data', jsonEncode(user.toJson()));

      return user;
    }

    return null;
  }

  /// Get current user from storage
  Future<UserModel?> getCurrentUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(AppConstants.keyAuthToken);

      if (token == null) return null;

      final userDataJson = prefs.getString('user_data');
      if (userDataJson != null) {
        final userData = jsonDecode(userDataJson) as Map<String, dynamic>;
        return UserModel.fromJson(userData);
      }
    } catch (e) {
      // Handle error
    }

    return null;
  }

  /// Logout user
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.keyAuthToken);
    await prefs.remove(AppConstants.keyUserId);
    await prefs.remove('user_data');
  }

  /// Check if user is authenticated
  Future<bool> isAuthenticated() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(AppConstants.keyAuthToken);
    return token != null;
  }
}
