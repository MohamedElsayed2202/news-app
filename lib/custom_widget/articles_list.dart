
import 'package:flutter/material.dart';
import 'package:news_app/pages/article_page.dart';
import 'package:news_app/view_model/news_article_view_model.dart';
class ArticlesList extends StatelessWidget {
  const ArticlesList({Key? key,required this.articles,this.controller}) : super(key: key);
  final List<NewsArticleViewModel> articles;
  final ScrollController? controller;
  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      controller: controller,
        separatorBuilder: (context, index) => const Divider(),
        padding: EdgeInsets.zero,
        itemCount: articles.length,
        itemBuilder: (context, index){
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ArticlePage(article: articles[index],)));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: articles[index].urlToImage.toString()=='images/image-not-found.png'?Image.asset('images/image-not-found.png',fit: BoxFit.cover,height: 200,width: 50,):Image.network(articles[index].urlToImage.toString(),fit: BoxFit.cover,height: 200,width: 50,errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {

                    return const Icon(Icons.error);
                  },),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(articles[index].title.toString(),style: const TextStyle(fontWeight: FontWeight.bold,),maxLines: 2,),
                    const SizedBox(height: 5.0,)
                  ],
                ),
                subtitle: Row(
                  children: [
                    const Icon(
                      Icons.schedule_rounded,size: 15.0,color: Color(0xFFB6B6B6),
                    ),
                    const SizedBox(width: 5.0,),
                    Text(articles[index].publishedAt,style: const TextStyle(color: Color(0xFFB6B6B6)),)
                  ],
                ),
              ),
            ),
          );
        });
  }
}
