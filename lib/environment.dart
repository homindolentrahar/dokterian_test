import 'package:collection/collection.dart';

enum Environments {
  DEV("dev"),
  PROD("prod");

  final String name;

  const Environments(this.name);
}

abstract class EnvironmentConf {
  // BASE URL
  static const String DEV_BASE_URL = 'https://nexacaresys.codeplay.id/api';
  static const String PROD_BASE_URL = 'https://nexacaresys.codeplay.id/api';
  // Env
  static final List<Map<String, String>> _environments = [
    {
      'env': Environments.DEV.name,
      'base_url': DEV_BASE_URL,
    },
    {
      'env': Environments.PROD.name,
      'base_url': PROD_BASE_URL,
    },
  ];
  static Environments _env = Environments.DEV;

  static Environments get currentEnv => _env;

  static void setEnv(Environments env) => _env = env;

  static String get baseUrl =>
      _environments.firstWhereOrNull(
        (e) => e['env'] == currentEnv.name,
      )?['base_url'] ??
      DEV_BASE_URL;
}
