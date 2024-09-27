import 'package:news_app_santanu/src/constants/string_constants.dart';
import 'package:news_app_santanu/src/network_layer/network_engine.dart';
import 'package:news_app_santanu/src/utilities/secure_storage.dart';

class NewsAPIService {
  Future<dynamic> downloadNewsData(
      {required int page, required int limit}) async {
    final networkEngine = NetworkEngine();
    final dio = networkEngine.getDio();
    final token = await SecureStorageUtil().readApiToken();
    try {
      final response = await dio.get(kNewsAppendUrlAPI, queryParameters: {
        apiToken: token,
        languageText: enLanguageCode,
        pageText: page,
        limitText: limit
      });

      return response.data;
    } catch (e) {
      throw Exception('$errorText ${e}');
    }
  }
}
