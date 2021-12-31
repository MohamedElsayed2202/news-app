
import 'package:flutter/material.dart';
import 'package:news_app/pages/pages.dart';


class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;
  final String tabItem;
  const TabNavigator({Key? key,required this.tabItem, required this.navigatorKey}):super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child=Container();

    if(tabItem == 'TopHeadLinePage'){
      child = const TopHeadLinePage();
    }
    else if(tabItem == 'CategoriesPage'){
      child = const CategoriesPage();
    }
    else if(tabItem == 'SettingsPage'){
      child = const SettingsPage();
    }
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings){
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}

