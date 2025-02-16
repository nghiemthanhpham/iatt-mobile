import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String apiUrl = dotenv.env['API_URL'] ?? '';
  static String apiKey = dotenv.env['API_KEY'] ?? '';
  static String environment = dotenv.env['ENV'] ?? 'development';

  static bool get isDevelopment => environment == 'development';
  static bool get isStaging => environment == 'staging';
  static bool get isProduction => environment == 'production';

  static Future<void> load() async {
    await dotenv.load(fileName: ".env");
    if (isDevelopment) {
      await dotenv.load(fileName: ".env.development");
    } else if (isStaging) {
      await dotenv.load(fileName: ".env.staging");
    } else if (isProduction) {
      await dotenv.load(fileName: ".env.production");
    }
  }
}
