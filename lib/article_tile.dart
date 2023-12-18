import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleTile extends StatelessWidget {
  final String articleImagePath;
  final String articleName;
  final String url;

  const ArticleTile(
      {super.key,
      required this.articleImagePath,
      required this.articleName,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launch(url);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, bottom: 50),
        child: Flexible(
          child: Container(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black54,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(articleImagePath),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    articleName,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}