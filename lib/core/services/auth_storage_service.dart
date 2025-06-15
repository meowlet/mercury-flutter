import 'package:shared_preferences/shared_preferences.dart';
import '../../../features/auth/domain/entities/user.dart';
import '../../../features/auth/data/models/auth_models.dart';
import 'dart:convert';

abstract class AuthStorageService {
  Future<void> saveAuthTokens(AuthTokens tokens);
  Future<void> saveUser(User user);
  Future<AuthTokens?> getAuthTokens();
  Future<User?> getUser();
  Future<bool> isUserAuthenticated();
  Future<void> clearAuthData();
}

class AuthStorageServiceImpl implements AuthStorageService {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userKey = 'user_data';

  @override
  Future<void> saveAuthTokens(AuthTokens tokens) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, tokens.accessToken);
    await prefs.setString(_refreshTokenKey, tokens.refreshToken);
  }

  @override
  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    final userModel = UserModel(
      id: user.id,
      username: user.username,
      email: user.email,
      isPremium: user.isPremium,
    );
    await prefs.setString(_userKey, jsonEncode(userModel.toJson()));
  }

  @override
  Future<AuthTokens?> getAuthTokens() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString(_accessTokenKey);
    final refreshToken = prefs.getString(_refreshTokenKey);

    if (accessToken != null && refreshToken != null) {
      return AuthTokensModel(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
    }
    return null;
  }

  @override
  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);

    if (userJson != null) {
      try {
        final userData = jsonDecode(userJson) as Map<String, dynamic>;
        return UserModel.fromJson(userData);
      } catch (e) {
        // If there's an error parsing the user data, clear it
        await prefs.remove(_userKey);
        return null;
      }
    }
    return null;
  }

  @override
  Future<bool> isUserAuthenticated() async {
    final tokens = await getAuthTokens();
    final user = await getUser();
    return tokens != null && user != null;
  }

  @override
  Future<void> clearAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await Future.wait([
      prefs.remove(_accessTokenKey),
      prefs.remove(_refreshTokenKey),
      prefs.remove(_userKey),
    ]);
  }
}
