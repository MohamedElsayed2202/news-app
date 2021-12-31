import 'package:intl/intl.dart';
import 'package:news_app/model/news_article.dart';

class NewsArticleViewModel{
  final NewsArticle _newsArticle;
  NewsArticleViewModel({required NewsArticle article}):_newsArticle = article;

  String? get author{
    if(_newsArticle.author != null) {
      return _newsArticle.author;
    }else{
      return 'Unknown';
    }
  }
  String? get title{
    return _newsArticle.title;
  }
  String? get description{
    return _newsArticle.description;
  }
  String? get urlToImage{
    if(_newsArticle.urlToImage != null) {
      return _newsArticle.urlToImage;
    }else{
      return 'images/image-not-found.png';
    }
  }
  String? get content{
    return _newsArticle.content;
  }
  String get publishedAt{
    if(_newsArticle.publishedAt != null) {
      final dateTime = DateFormat('yyyy-mm-ddTHH:mm:ssZ').parse(
          _newsArticle.publishedAt.toString(), true);
      return DateFormat.yMEd('en-us').format(dateTime).toString();
    }else{
      return 'Couldn\'t get time';
    }
  }
  Source? get source{
    return _newsArticle.source;
  }
  String? get url{
    return _newsArticle.url;
  }
}