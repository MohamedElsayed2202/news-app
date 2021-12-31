// ignore_for_file: unused_local_variable

import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:news_app/bottom_sheet_screens/change_country_modal_sheet.dart';
import 'package:news_app/custom_widget/articles_list.dart';
import 'package:news_app/custom_widget/loading_articles_list.dart';
import 'package:news_app/custom_widget/my_tabbar.dart';
import 'package:news_app/custom_widget/my_textformfeild.dart';
import 'package:news_app/pages/searched_page.dart';
import 'package:news_app/view_model/categories_articles_view_modal.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    with SingleTickerProviderStateMixin {
  final Locale deviceLocale = CountryCodes.getDeviceLocale()!;
  late String countryCode;

  final formKey = GlobalKey<FormState>();
  final FocusNode focusNode = FocusNode();
  late TabController controller;
  TextEditingController searchController = TextEditingController();
  late String keyWord;

  //bool isLoading = false;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 7, vsync: this);
    countryCode = deviceLocale.countryCode!.toLowerCase();
    getCategoriesLists();
  }

  getCategoriesLists() async {
    Provider.of<CategoriesArticlesViewModal>(context, listen: false).isLoading =
        true;
    await Provider.of<CategoriesArticlesViewModal>(context, listen: false)
        .getCategoriesArticles();
    Provider.of<CategoriesArticlesViewModal>(context, listen: false).isLoading =
        false;
  }

  Future update() async {
    Provider.of<CategoriesArticlesViewModal>(context, listen: false).isLoading =
    true;
    await Provider.of<CategoriesArticlesViewModal>(context, listen: false)
        .getCategoriesArticles(countryCode);
    Provider.of<CategoriesArticlesViewModal>(context, listen: false).isLoading =
    false;
  }

  void onSubmittedAndPressed() {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SearchedPage(keyWork: keyWord)));
      searchController.clear();
      focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
   double displayHeight = MediaQuery.of(context).size.height;
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: update,
        child: Icon(
          Icons.refresh,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.discover,
                style: const TextStyle(
                    fontSize: 40.0, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: displayHeight * .02),
              Text(
                AppLocalizations.of(context)!.newsFromAllOverTheWorld,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB6B6B6),
                ),
              ),
              SizedBox(height: displayHeight * .04),
              MyTextFormField(
                formKey: formKey,
                onEditingComplete: onSubmittedAndPressed,
                onChange: (value) {
                  setState(() {
                    keyWord = value;
                  });
                },
                searchController: searchController,
                focusNode: focusNode,
                suffixIcon: IconButton(
                  onPressed: onSubmittedAndPressed,
                  icon: const Icon(
                    Icons.send,
                    color: Color(0xFFB6B6B6),
                  ),
                  splashRadius: 20.0,
                ),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: Color(0xFFB6B6B6),
                ),
              ),
              SizedBox(height: displayHeight * .04),
              Consumer<CategoriesArticlesViewModal>(
                builder: (context, categoriesProvider, child) {
                  return SizedBox(
                    width: displayWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          categoriesProvider.countryName,
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                        TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) =>
                                    const ChangeCountryModalSheet());
                          },
                          child: Text(
                            AppLocalizations.of(context)!.change,
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xFFF0F0F0))),
                        )
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: displayHeight * .04),
              MyTabBar(controller: controller),
              Consumer<CategoriesArticlesViewModal>(builder: (context,categoriesProvider,child){
                var lists = categoriesProvider.categoriesArticlesLists;
                return Expanded(
                    child: Padding(
                      padding: EdgeInsets.zero,
                      child: categoriesProvider.isLoading ==
                          false
                          ? TabBarView(controller: controller, children: [
                        for (int i = 0; i < lists.length; i++)
                          ArticlesList(articles: lists[i])
                      ])
                          : const LoadingArticlesList(itemCount: 4),
                    ));
              })

            ],
          ),
        ),
      ),
    );
  }
}
