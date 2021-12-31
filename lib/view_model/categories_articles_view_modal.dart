
import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/model/news_article.dart';
import 'package:news_app/services/news_api.dart';
import 'package:news_app/view_model/news_article_view_model.dart';

class CategoriesArticlesViewModal extends ChangeNotifier{
  List<List<NewsArticleViewModel>> categoriesArticlesLists = [];

  Map<String, String> map = {}..addAll(Constants.countries);

  String? _countryCode;
  String? _countryName ;
  bool isLoading = false;
  CategoriesArticlesViewModal({countryCode, countryName}){
    _countryCode = countryCode;
    _countryName = countryName;
  }
  void setCountryCode(String code){
    _countryCode = code;
    notifyListeners();
  }
  get countryCode => _countryCode;
  get countryName => _countryName;
  void setCountryName(String code){
    _countryName =  map.keys.firstWhere((element) => map[element] == code,orElse: ()=>'');
    notifyListeners();
  }
  Future getCategoriesArticles([String? country])async{
    if(country!= null){
      setCountryCode(country);
    }
    categoriesArticlesLists.clear();
    for(String cat in Constants.categories){
      List<NewsArticle> articles = await NewsApi().fetchArticlesByCategory(countryCode, cat);
      List<NewsArticleViewModel> categoryArticles = articles.map((article) => NewsArticleViewModel(article: article)).toList();
      categoriesArticlesLists.add(categoryArticles);
    }
    notifyListeners();
  }





}