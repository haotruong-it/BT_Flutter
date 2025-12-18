import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/profile_user.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://dummyjson.com",
      headers: {"Content-Type": "application/json"},
      validateStatus: (_) => true,
    ),
  );

  Future<bool> login(String username, String password) async {
    try {
      final res = await _dio.post(
        "/auth/login",
        data: {
          "username": username,
          "password": password,
        },
      );

      // 👉 LOG để thấy rõ
      print("STATUS: ${res.statusCode}");
      print("DATA: ${res.data}");

      if (res.statusCode == 200 && res.data["accessToken"] != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", res.data["accessToken"]);
        return true;
      }
      return false;
    } catch (e) {
      print("LOGIN ERROR: $e");
      return false;
    }
  }

  Future<ProfileUser?> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    if (token == null) return null;

    try {
      final res = await _dio.get(
        "/auth/me",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (res.statusCode == 200) {
        return ProfileUser.formJson(res.data);
      }
      return null;
    } catch (e) {
      print("PROFILE ERROR: $e");
      return null;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
  }
}

final authService = AuthService();
