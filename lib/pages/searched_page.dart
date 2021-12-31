import 'package:flutter/material.dart';
import 'package:news_app/bottom_sheet_screens/sort_by_modal_sheet.dart';
import 'package:news_app/custom_widget/articles_list.dart';
import 'package:news_app/custom_widget/loading_articles_list.dart';
import 'package:news_app/custom_widget/my_textformfeild.dart';
import 'package:news_app/view_model/search_articles_view_modal.dart';
import 'package:provider/provider.dart';

class SearchedPage extends StatefulWidget {
  const SearchedPage({Key? key, required this.keyWork}) : super(key: key);
  final String keyWork;

  @override
  _SearchedPageState createState() => _SearchedPageState();
}

class _SearchedPageState extends State<SearchedPage> {
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final FocusNode focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  late String searchWord;
  bool loadingList = false;
  @override
  void initState() {
    super.initState();
    getSearchedArticles(widget.keyWork);
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        keepScrolling(searchWord);
      }
    });
  }

  getSearchedArticles(String word) async {
    Provider.of<SearchArticlesViewModal>(context, listen: false).isLoading =
        true;
    await Provider.of<SearchArticlesViewModal>(context, listen: false)
        .getArticlesByKeyWord(word);
    Provider.of<SearchArticlesViewModal>(context, listen: false).isLoading =
        false;
  }

  keepScrolling(String word) async {
    setState(() {
      loadingList = true;
    });
    await Provider.of<SearchArticlesViewModal>(context, listen: false)
        .getArticlesByKeyWordPagination(word);
    setState(() {
      loadingList = false;
    });
  }

  onSubmittedAndPressed() {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      getSearchedArticles(searchWord);
      textController.clear();
      focusNode.unfocus();
    }
  }

  Future<void> getArticles() async {
    Provider.of<SearchArticlesViewModal>(context, listen: false).isLoading =
        true;
    await Provider.of<SearchArticlesViewModal>(context, listen: false)
        .getArticlesByKeyWord(searchWord);
    Provider.of<SearchArticlesViewModal>(context, listen: false).isLoading =
        false;
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    textController.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    searchWord = widget.keyWork;
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const CircleAvatar(
                        backgroundColor: Color(0xFFB6B6B6),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      )),
                  SizedBox(
                    width: displayWidth * .65,
                    height: 60,
                    child: MyTextFormField(
                      formKey: formKey,
                      onEditingComplete: onSubmittedAndPressed,
                      onChange: (value) {
                        searchWord = value;
                      },
                      searchController: textController,
                      suffixIcon: IconButton(
                        onPressed: onSubmittedAndPressed,
                        splashRadius: 20.0,
                        icon: const Icon(Icons.search),
                        color: const Color(0xFFB6B6B6),
                      ),
                      focusNode: focusNode,
                    ),
                  ),
                  CircleAvatar(
                      backgroundColor: const Color(0xFFB6B6B6),
                      child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            barrierColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                              context: context,
                              builder: (context) =>  SortByModalSheet(wordKey: searchWord));
                        },
                        icon: const Icon(
                          Icons.filter_alt,
                          color: Colors.white,
                        ),
                        splashRadius: 10.0,
                      ))
                ],
              ),
            ),
            Consumer<SearchArticlesViewModal>(
              builder: (context, _viewModal, _) {
                var articles = _viewModal.articlesByKeyWord;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: RefreshIndicator(
                      onRefresh: getArticles,
                      child: Stack(
                        children: [
                          _viewModal.isLoading == false
                              ? ArticlesList(
                                  articles: articles,
                                  controller: scrollController,
                                )
                              : const LoadingArticlesList(itemCount: 8),
                          if (loadingList) ...[
                            Positioned(
                              left: 0,
                              bottom: 0,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 80,
                                child:  Center(
                                  child: CircularProgressIndicator(color: Theme.of(context).colorScheme.secondary,),
                                ),
                              ),
                            )
                          ]
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
