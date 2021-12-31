import 'package:flutter/material.dart';
import 'package:news_app/pages/article_page.dart';
import 'package:news_app/view_model/news_article_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirstArticleStack extends StatelessWidget {
  const FirstArticleStack({Key? key, required this.article}) : super(key: key);
  final NewsArticleViewModel article;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      height: MediaQuery.of(context).size.height * .45,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0)),
            child: article.urlToImage.toString() == 'images/image-not-found.png'
                ? Image.asset('images/image-not-found.png', fit: BoxFit.fill)
                : Image.network(article.urlToImage.toString(),
                    fit: BoxFit.fill, errorBuilder: (BuildContext context,
                        Object exception, StackTrace? stackTrace) {
                    return Image.asset('images/image-not-found.png',
                        fit: BoxFit.fill);
                  }),
          ),
          Positioned(
            top: 140.0,
            left: 30.0,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.white30),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Text(
                  AppLocalizations.of(context)!.newsOfTheDay,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: .5),
                ),
              ),
            ),
          ),
          Positioned(
            top: 190,
            left: 30.0,
            right: 50.0,
            child: SizedBox(
              height: 127,
              width: MediaQuery.of(context).size.width - 40,
              child: Text(
                article.title.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                maxLines: 3,
              ),
            ),
          ),
          Positioned(
            bottom: 30.0,
            left: 30.0,
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ArticlePage(article: article)));
              },
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.continueReading,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 16.0, letterSpacing: 1),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Icon(
                    Icons.east_outlined,
                    color: Colors.white,
                    size: 25.0,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
