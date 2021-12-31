import 'package:flutter/material.dart';
import 'package:news_app/custom_widget/home_waiting_widget.dart';
import 'package:news_app/custom_widget/homepage_widgets/first_article_stack.dart';
import 'package:news_app/custom_widget/homepage_widgets/home_page_scroll_list_item.dart';
import 'package:news_app/pages/article_page.dart';
import 'package:news_app/pages/see_more_page.dart';
import 'package:news_app/view_model/top_headlines_view_modal.dart';
import 'package:news_app/view_model/news_article_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TopHeadLinePage extends StatefulWidget {
  const TopHeadLinePage({Key? key}) : super(key: key);

  @override
  State<TopHeadLinePage> createState() => _TopHeadLinePageState();
}

class _TopHeadLinePageState extends State<TopHeadLinePage> {
  late Future<List<NewsArticleViewModel>> topHeadLines;
  @override
  void initState() {
    super.initState();
    topHeadLines = getData();
  }
  Future<List<NewsArticleViewModel>> getData()async{
    return await Provider.of<TopHeadLinesViewModal>(context,listen: false).topHeadLines;
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: FutureBuilder<List<NewsArticleViewModel>>(
        future: topHeadLines,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final topHeadLines = snapshot.data;
            return SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height -
                    (MediaQuery.of(context).size.width * .256),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FirstArticleStack(article: topHeadLines![0]),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.breakingNews,
                            style: const TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w900),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SeeMorePage(),
                                ),
                              );
                            },
                            child: Text(
                              AppLocalizations.of(context)!.more,
                              style: const TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return HomePageScrollListItem(
                            imageUrl:
                                topHeadLines[index + 1].urlToImage.toString(),
                            title: topHeadLines[index + 1].title.toString(),
                            publishedAt:
                                topHeadLines[index + 1].publishedAt.toString(),
                            source:
                                topHeadLines[index + 1].source!.name.toString(),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ArticlePage(
                                    article: topHeadLines[index + 1],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        itemCount: topHeadLines.length - 1,
                        scrollDirection: Axis.horizontal,
                      ),
                    ))
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return  Center(
              child: Text(AppLocalizations.of(context)!.error),
            );
          } else {
            return const HomeWaiting();
          }
        },
      ),
    );
  }
}
