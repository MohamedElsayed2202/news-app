import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/tab_navigator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  String _currentPage = 'TopHeadLinePage';
  List<String> pageKeys = ['TopHeadLinePage','CategoriesPage','SettingsPage'];
  final Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    'TopHeadLinePage' : GlobalKey<NavigatorState>(),
    'CategoriesPage' : GlobalKey<NavigatorState>(),
    'SettingsPage' : GlobalKey<NavigatorState>(),
  };
  @override
  void initState() {
    super.initState();
  }
  var currentIndex = 0;
  _selectTab(String tabItem, int index){
    if(tabItem == _currentPage){
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    }
    else{
      setState(() {
        _currentPage = pageKeys[index];
        currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> listOfStrings = [
      AppLocalizations.of(context)!.home,
      AppLocalizations.of(context)!.search,
      AppLocalizations.of(context)!.settings,
    ];
    double displayWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async{
        final isFirstRouteInCurrentTab = !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
        if(isFirstRouteInCurrentTab){
          if(_currentPage != 'TopHeadLinePage'){
            _selectTab('TopHeadLinePage', 0);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            _buildOffstageNavigator('TopHeadLinePage'),
            _buildOffstageNavigator('CategoriesPage'),
            _buildOffstageNavigator('SettingsPage'),
          ],
        ),
        bottomNavigationBar: Container(
          height: displayWidth * .155,
          margin: EdgeInsets.symmetric( horizontal: displayWidth * .05),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
              borderRadius: BorderRadius.circular(50.0)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: displayWidth * .1),
            child: ListView.builder(
              itemCount: listOfStrings.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: displayWidth * .0102),
              itemBuilder: (context, index) => InkWell(
                onTap: (){_selectTab(pageKeys[index], index);},

                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width: index == currentIndex
                          ? displayWidth * .32
                          : displayWidth * .18,
                      alignment: Alignment.center,
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        height: index == currentIndex ? displayWidth * .12 : 0,
                        width: index == currentIndex ? displayWidth * .32 : 0,
                        decoration: BoxDecoration(
                          color: index == currentIndex
                              ? const Color(0xFFF0F0F0)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width: index == currentIndex
                          ? displayWidth * .31
                          : displayWidth * .18,
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                width: index == currentIndex
                                    ? displayWidth * .13
                                    : 0,
                              ),
                              AnimatedOpacity(
                                opacity: index == currentIndex ? 1 : 0,
                                duration: const Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                child: Text(
                                  index == currentIndex
                                      ? listOfStrings[index]
                                      : '',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                width: index == currentIndex
                                    ? displayWidth * .03
                                    : 20,
                              ),
                              Icon(
                                Constants.listOfIcons[index],
                                size: displayWidth * .076,
                                color: index == currentIndex
                                    ? Colors.black
                                    : Colors.black26,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(navigatorKey:_navigatorKeys[tabItem],tabItem: tabItem,),
    );
  }

}
