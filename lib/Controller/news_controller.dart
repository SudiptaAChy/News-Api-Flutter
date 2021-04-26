import 'package:get/get.dart';
import 'package:practise/API/news_api.dart';
import 'package:practise/Model/news.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var articleList = List<Article>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    fetchNewsList();
  }

  void fetchNewsList() async {
    List<Article> list = await NewsApi.fetchNews();
    if (list != null) {
      articleList.value = list;
    }
    isLoading.value = false;
  }
}
