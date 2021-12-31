import 'package:flutter/material.dart';
import 'package:news_app/custom_widget/articles_list.dart';
import 'package:news_app/custom_widget/loading_articles_list.dart';
import 'package:news_app/providers/theam_provider.dart';
import 'package:news_app/view_model/top_headlines_view_modal.dart';
import 'package:news_app/view_model/news_article_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SeeMorePage extends StatefulWidget {
  const SeeMorePage({Key? key,}) : super(key: key);
  @override
  State<SeeMorePage> createState() => _SeeMorePageState();
}

class _SeeMorePageState extends State<SeeMorePage> {
  late Future<List<NewsArticleViewModel>> allHeadLines;
  @override
  void initState() {
    super.initState();
    allHeadLines = getData();
  }

  Future<List<NewsArticleViewModel>> getData()async{
    return await Provider.of<TopHeadLinesViewModal>(context,listen: false).allHeadlines;
  }


  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        foregroundColor: ThemeMode.dark == themeProvider.themeMode?Colors.white:Colors.black,
        elevation: 0.0,
        title: Text(AppLocalizations.of(context)!.more),
      ),
      body: FutureBuilder<List<NewsArticleViewModel>>(
        future: allHeadLines,
        builder: (context,snapshot){
          if(snapshot.hasData){
            final allHeadLines = snapshot.data;
            return Column(
              children: [
                Expanded(child: ArticlesList(articles: allHeadLines!,)),
              ],
            );
          }else if(snapshot.hasError){
            return  Center(
              child: Text( AppLocalizations.of(context)!.error),
            );
          } else{
            return const LoadingArticlesList(itemCount: 8);
          }
        },
      ),
    );
  }
}
