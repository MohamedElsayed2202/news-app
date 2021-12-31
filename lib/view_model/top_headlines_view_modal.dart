import 'package:flutter/material.dart';
import 'package:news_app/model/news_article.dart';
import 'package:news_app/services/news_api.dart';
import 'package:news_app/view_model/view_models.dart';


class TopHeadLinesViewModal extends ChangeNotifier {
  List<NewsArticleViewModel> _topHeadlines = [];
  List<NewsArticleViewModel> _allHeadlines = [];
  final String? country;

  TopHeadLinesViewModal({this.country});

  Future getTopHeadLines() async {
    List<NewsArticle> articles =
        await NewsApi().fetchTopHeadLinesForCountry(country!);
    _topHeadlines = articles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    notifyListeners();
  }

  Future<List<NewsArticleViewModel>> get topHeadLines async {
    await getTopHeadLines();
    return _topHeadlines;
  }

  Future getAllHeadLines() async {
    List<NewsArticle>? articles =
        await NewsApi().fetchAllTopHeadLines(country!);
    _allHeadlines = articles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    notifyListeners();
  }

  Future<List<NewsArticleViewModel>> get allHeadlines async {
    await getAllHeadLines();
    return _allHeadlines;
  }
}
