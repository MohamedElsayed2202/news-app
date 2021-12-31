import 'package:flutter/material.dart';
import 'package:news_app/model/news_article.dart';
import 'package:news_app/services/news_api.dart';
import 'package:news_app/view_model/news_article_view_model.dart';

class SearchArticlesViewModal extends ChangeNotifier {
  List<NewsArticleViewModel> _articlesByKeyWord = [];

  String _sortBy = 'publishedAt';
  int _pageNu = 1;
  bool isLoading = false;

  get sortBy => _sortBy;

  setSortBy(String sortBy) {
    _sortBy = sortBy;
    notifyListeners();
  }

  Future getArticlesByKeyWord(String q) async {
    _articlesByKeyWord.clear();
    List<NewsArticle> newsArticles =
        await NewsApi().fetchArticlesByKeyWord(q, sortBy);
    _articlesByKeyWord = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    _pageNu = 1;
    notifyListeners();
  }

  Future getArticlesByKeyWordPagination(String q) async {
    _pageNu++;
    List<NewsArticle> newsArticles =
    await NewsApi().fetchArticlesByKeyWordPagination(q, sortBy,_pageNu);
    List<NewsArticleViewModel> articles = [];
    articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    _articlesByKeyWord.addAll(articles);
    notifyListeners();

  }
  get articlesByKeyWord => _articlesByKeyWord;
}
