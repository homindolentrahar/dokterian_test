import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageManager {
  final _instance = const FlutterSecureStorage();
  final _tokenKey = "token";

  Future<void> saveToken(String token) async {
    return _instance.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return _instance.read(key: _tokenKey);
  }
}
