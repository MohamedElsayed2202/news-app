import 'package:flutter/material.dart';


class Constants {

  static String apiKey = 'your api key';

  static String searchByQ(String q, String sortBy) {
    return 'https://newsapi.org/v2/everything?q=$q&sortBy=$sortBy&pageSize=30&apiKey=$apiKey';
  }
  static String searchByQPagination(String q, String sortBy, int page) {
    return 'https://newsapi.org/v2/everything?q=$q&sortBy=$sortBy&pageSize=30&page=$page&apiKey=$apiKey';
  }
  static String topHeadLinesForCountry(String country){
    return 'https://newsapi.org/v2/top-headlines?country=$country&pageSize=10&apiKey=$apiKey';
  }
  static String allTopHeadLinesForCountry(String country){
    return 'https://newsapi.org/v2/top-headlines?country=$country&pageSize=100&apiKey=$apiKey';
  }
  static String getArticlesByCategory(String country, String cat){
    return 'https://newsapi.org/v2/top-headlines?country=$country&category=$cat&pageSize=100&apiKey=$apiKey';
  }


  static List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.search_rounded,
    Icons.settings_rounded,
  ];

  static final categories = [
    'General',
    'Health',
    'Sports',
    'Science',
    'Technology',
    'Entertainment',
    'Business',
  ];


  static Map<String,String> countries = {
    'Argentina': 'ar',
    'Australia': 'au',
    'Austria': 'at',
    'Belgium': 'be',
    'Brazil': 'br',
    'Bulgaria': 'bg',
    'Canada': 'ca',
    'China': 'cn',
    'Colombia': 'co',
    'Cuba': 'cu',
    'Czech Republic': 'cz',
    'Egypt': 'eg',
    'France': 'fr',
    'Germany': 'de',
    'Greece': 'gr',
    'Hong Kong': 'hk',
    'Hungary': 'hu',
    'India': 'in',
    'Indonesia': 'id',
    'Ireland': 'ie',
    'Italy': 'it',
    'Japan': 'jp',
    'Latvia': 'lv',
    'Lithuania': 'lt',
    'Malaysia': 'my',
    'Mexico': 'mx',
    'Morocco': 'ma',
    'NetherLands': 'nl',
    'New Zealand': 'nz',
    'Nigeria': 'ng',
    'Norway': 'no',
    'Philippines': 'ph',
    'Poland': 'pl',
    'Portugal': 'pt',
    'Romania': 'ro',
    'Russia': 'ru',
    'Saudi Arabia': 'sa',
    'Serbia': 'rs',
    'Singapore': 'sg',
    'Slovakia': 'sk',
    'Slovenia':'si',
    'South Africa': 'za',
    'South Korea': 'kr',
    'Sweden': 'se',
    'Switzerland': 'ch',
    'Taiwan': 'tw',
    'Thailand': 'th',
    'Turkey': 'tr',
    'UAE': 'ae',
    'Ukraine': 'ua',
    'United Kingdom': 'gb',
    'United States': 'us',
    'Venuzuela': 've',
  };

  static Map<String,String> codeAndImage = {
    'ar':'images/countries/ar.svg',
    'au':'images/countries/au.svg',
    'at':'images/countries/at.svg',
    'be':'images/countries/be.svg',
    'br':'images/countries/br.svg',
    'bg':'images/countries/bg.svg',
    'ca':'images/countries/ca.svg',
    'cn':'images/countries/cn.svg',
    'co':'images/countries/co.svg',
    'cu':'images/countries/cu.svg',
    'cz':'images/countries/cz.svg',
    'eg':'images/countries/eg.svg',
    'fr':'images/countries/fr.svg',
    'de':'images/countries/de.svg',
    'gr':'images/countries/gr.svg',
    'hk':'images/countries/hk.svg',
    'hu':'images/countries/hu.svg',
    'in':'images/countries/in.svg',
    'id':'images/countries/id.svg',
    'ie':'images/countries/ie.svg',
    'it':'images/countries/it.svg',
    'jp':'images/countries/jp.svg',
    'lv':'images/countries/lv.svg',
    'lt':'images/countries/lt.svg',
    'my':'images/countries/my.svg',
    'mx':'images/countries/mx.svg',
    'ma':'images/countries/ma.svg',
    'nl':'images/countries/nl.svg',
    'nz':'images/countries/nz.svg',
    'ng':'images/countries/ng.svg',
    'no':'images/countries/no.svg',
    'ph':'images/countries/ph.svg',
    'pl':'images/countries/pl.svg',
    'pt':'images/countries/pt.svg',
    'ro':'images/countries/ro.svg',
    'ru':'images/countries/ru.svg',
    'sa':'images/countries/sa.svg',
    'rs':'images/countries/rs.svg',
    'sg':'images/countries/sg.svg',
    'sk':'images/countries/sk.svg',
    'si':'images/countries/si.svg',
    'za':'images/countries/za.svg',
    'kr':'images/countries/kr.svg',
    'se':'images/countries/se.svg',
    'ch':'images/countries/ch.svg',
    'tw':'images/countries/tw.svg',
    'th':'images/countries/th.svg',
    'tr':'images/countries/tr.svg',
    'ae':'images/countries/ae.svg',
    'ua':'images/countries/ua.svg',
    'gb':'images/countries/gb.svg',
    'us':'images/countries/us.svg',
    've':'images/countries/ve.svg',
  };


}