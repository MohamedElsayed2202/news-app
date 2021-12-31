import 'package:flutter/material.dart';
import 'package:news_app/view_model/view_models.dart';


class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key, required this.article}) : super(key: key);
  final NewsArticleViewModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .7,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  article.urlToImage != 'images/image-not-found.png'
                      ? Image.network(
                          article.urlToImage.toString(),
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          article.urlToImage.toString(),
                          fit: BoxFit.fill,
                        ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * .13,
                    left: MediaQuery.of(context).size.width * .05,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.keyboard_backspace,
                        color: Colors.white,
                        size: 40.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          DraggableScrollableSheet(
            maxChildSize: .75,
            initialChildSize: .6,
            minChildSize: .6,
            builder: (context, controller) => Container(
              height: MediaQuery.of(context).size.height * .45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                child: ListView(
                  padding: const EdgeInsets.only(top: 0),
                  controller: controller,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    child: Icon(
                                      Icons.person,
                                      size: 20.0,
                                      color: Color(0xFFB6B6B6),
                                    ),
                                    backgroundColor: Color(0xFFF0F0F0),
                                    radius: 15.0,
                                  ),
                                  const SizedBox(width: 5.0),
                                  Flexible(
                                      child: Text(
                                    article.author.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis),
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: Color(0xFFF0F0F0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.schedule,
                                  color: Color(0xFFB6B6B6),
                                ),
                                const SizedBox(width: 5.0),
                                Text(
                                  article.publishedAt,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    Text(
                      article.title.toString(),
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    Text(
                      article.description.toString(),
                      style: TextStyle(
                          wordSpacing: 3,
                          fontSize: 18.0,
                          color: Colors.grey.shade600),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    Text(
                      article.content.toString(),
                      style: TextStyle(
                          wordSpacing: 3,
                          fontSize: 18.0,
                          color: Colors.grey.shade600),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Color(0xFFF0F0F0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'Source',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: Color(0xFFF0F0F0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              article.source!.name.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
