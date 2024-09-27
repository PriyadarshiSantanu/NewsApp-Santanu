import 'package:news_app_santanu/src/models/news_list_model.dart';
import 'package:news_app_santanu/src/utilities/shared_preference.dart';

class ListFromJsonUtil{

 static  Future<List<News>> newsListFromJson(
      List<dynamic> jsonList, bool toSaveIntoCache) async {
    if (jsonList.isEmpty) {
      return [];
    }
    if (toSaveIntoCache) {
      await SharedPrefUtil.saveToCache(jsonList);
    }
    return jsonList.map<News>((item) {
      return News.fromMap(item as Map<String, dynamic>);
    }).toList();
  }
}