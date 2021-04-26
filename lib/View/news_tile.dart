import 'package:flutter/material.dart';
import 'package:practise/Model/news.dart';

class NewsTile extends StatelessWidget {
  final Article article;
  const NewsTile({this.article});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        (article.title != null)
            ? Text(
                article.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            : Container(),
        (article.urlToImage != null)
            ? Image.network(
                article.urlToImage,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              )
            : Container(),
        (article.content != null) ? Text(article.content) : Container(),
      ],
    );
  }
}
