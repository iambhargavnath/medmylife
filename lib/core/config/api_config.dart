abstract final class ApiConfig {
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://medmylife.netlify.app/api',
  );

  static const Duration connectTimeout =
  Duration(seconds: 10);

  static const Duration receiveTimeout =
  Duration(seconds: 10);

  static const Duration sendTimeout =
  Duration(seconds: 10);
}