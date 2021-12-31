import 'package:flutter/material.dart';
import 'package:news_app/view_model/search_articles_view_modal.dart';
import 'package:provider/provider.dart';

class SortByModalSheet extends StatelessWidget {
  const SortByModalSheet({Key? key, required this.wordKey}) : super(key: key);
  final String wordKey;
  @override
  Widget build(BuildContext context) {
    Map<String,String> sortMap = {
      'Recent':'publishedAt',
      'Most popular':'popularity',
      'Relevancy':'relevancy'
    };
    return Consumer<SearchArticlesViewModal>(builder: (context,_viewModal,_){
      String selectedValue = _viewModal.sortBy;
      return Container(
        height: MediaQuery.of(context).size.height*.29,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(child: const Center(child: Text('Sort by',style: TextStyle(fontSize: 18.0),),),padding: const EdgeInsets.all(8.0),),
            Expanded(
              child: ListView(
                padding:  EdgeInsets.zero,
                children: sortMap.entries.map((e) => RadioListTile<String>(value: e.value, groupValue: selectedValue, onChanged: (value)async{
                  _viewModal.setSortBy(value!);
                  Navigator.pop(context);
                  _viewModal.isLoading = true;
                  await _viewModal.getArticlesByKeyWord(wordKey);
                  _viewModal.isLoading = false;
                },title: Text(e.key),)).toList(),
              ),
            ),
          ],
        ),
      );
    });
  }
}
