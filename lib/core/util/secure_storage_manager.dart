import 'package:dokterian_test/app_injection.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageManager {
  final _instance = injector.get<FlutterSecureStorage>();
  final _tokenKey = "token";

  Future<void> saveToken(String token) async {
    return _instance.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return _instance.read(key: _tokenKey);
  }

  Future<void> removeToken() async {
    return _instance.delete(key: _tokenKey);
  }
}
