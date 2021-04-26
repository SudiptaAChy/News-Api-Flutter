import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practise/Controller/connectivity_controller.dart';
import 'package:practise/Controller/news_controller.dart';
import 'package:practise/View/news_tile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ConnectivityController connectivityController =
      Get.put(ConnectivityController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          if (connectivityController.connectionStatus.value == 0) {
            return AlertDialog(
              content: Text('No internet'),
            );
          } else {
            final NewsController newsController = Get.put(NewsController());
            if (newsController.isLoading.value == true)
              return Center(child: CircularProgressIndicator());
            else
              return ListView.builder(
                shrinkWrap: true,
                itemCount: newsController.articleList.length,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    height: 350,
                    margin: EdgeInsets.only(top: 5.0),
                    child: Card(
                        child: NewsTile(
                            article: newsController.articleList[index])),
                  );
                },
              );
          }
        }),
      ),
    );
  }
}
