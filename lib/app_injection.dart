import 'package:dokterian_test/core/data/remote/api_client.dart';
import 'package:dokterian_test/core/util/secure_storage_manager.dart';
import 'package:dokterian_test/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:dokterian_test/feature/auth/domain/repository/auth_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

abstract class AppInjection {
  static void inject() {
    injector
        .registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
    injector.registerSingleton<SecureStorageManager>(SecureStorageManager());
    injector.registerSingleton<ApiClient>(ApiClient());

    injector.registerSingleton<AuthRepository>(
      AuthRepositoryImpl(injector.get<ApiClient>()),
    );
  }
}
