import 'package:http/http.dart' as http;
import 'package:practise/Model/news.dart';

class NewsApi {
  static var url = Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=5bdee0d2641c4e6092827ab728d8b9d3');

  static List<Article> articleList = [];

  static Future<List<Article>> fetchNews() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      News news = newsFromJson(response.body);
      articleList = news.articles;
    }
    return articleList;
  }
}
