import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/constants.dart';
import 'package:news_app/model/news_article.dart';

class NewsApi {





  Future<List<NewsArticle>> fetchArticlesByCategory(String country,String cat)async{
    http.Response response = await http.get(Uri.parse(Constants.getArticlesByCategory(country, cat)));
    if(response.statusCode == 200){
      var json = jsonDecode(response.body);
      Iterable list = json['articles'];
      return list.map((e) => NewsArticle.fromJson(e)).toList();
    }else{
      throw Exception('Failed to get news...');
    }
  }

  Future<List<NewsArticle>> fetchTopHeadLinesForCountry(String country) async {
    http.Response response = await http.get(Uri.parse(Constants.topHeadLinesForCountry(country)));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      Iterable list = json['articles'];
      return list.map((e) => NewsArticle.fromJson(e)).toList();
    } else {
      throw Exception('Failed to get news...');
    }
  }

  Future<List<NewsArticle>> fetchAllTopHeadLines(String country) async{
    http.Response response = await http.get(Uri.parse(Constants.allTopHeadLinesForCountry(country)));
    if(response.statusCode == 200){
      var json = jsonDecode(response.body);
      Iterable list = json['articles'];
      return list.map((e) => NewsArticle.fromJson(e)).toList();
    }
    else{
      throw throw Exception('Failed to get news...');
    }
  }


  Future<List<NewsArticle>> fetchArticlesByKeyWord(String q,String sortBy) async {
    http.Response response = await http.get(Uri.parse(Constants.searchByQ(q,sortBy)));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      Iterable list = json['articles'];
      return list.map((e) => NewsArticle.fromJson(e)).toList();
    } else {
      throw Exception('Failed to get news...');
    }
  }

  Future<List<NewsArticle>> fetchArticlesByKeyWordPagination(String q,String sortBy,int page) async {
    http.Response response = await http.get(Uri.parse(Constants.searchByQPagination(q, sortBy, page)));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      Iterable list = json['articles'];
      return list.map((e) => NewsArticle.fromJson(e)).toList();
    } else {
      throw Exception('Failed to get news...');
    }
  }

}

