import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/view_model/view_models.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangeCountryModalSheet extends StatelessWidget {
  const ChangeCountryModalSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoriesArticlesViewModal>(builder: (context, _viewModal, _){
      String selectedValue =_viewModal.countryCode;
      var map = _viewModal.map;
      return Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:Center(child: Text(AppLocalizations.of(context)!.getTopNewsForSelectedCountry,style: const TextStyle(fontSize: 18.0),),),
            ),
            Expanded(
              child: Scrollbar(
                interactive: true,
                child: ListView(
                  children: map.entries.map((e) => SizedBox(child: Column(
                    children: [
                      InkWell(
                        onTap: ()async {
                          _viewModal.setCountryCode(e.value);
                        Navigator.pop(context);
                        _viewModal.isLoading = true;
                        _viewModal.setCountryName(e.value);
                        await _viewModal.getCategoriesArticles();
                        _viewModal.isLoading = false;
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(Constants.codeAndImage[e.value] as String,height: 55,width: 55,fit: BoxFit.fill,),
                                  const SizedBox(width: 50.0,),
                                  Container(padding: const EdgeInsets.all(8.0),child: Text(e.key,style: const TextStyle(fontSize: 20.0),),)
                                ],
                              ),
                              Radio<String>(value: e.value, activeColor: Theme.of(context).colorScheme.secondary,groupValue: selectedValue, onChanged: (value) async{
                                _viewModal.setCountryCode(e.value);
                                Navigator.pop(context);
                                _viewModal.isLoading = true;
                                _viewModal.setCountryName(e.value);
                                await _viewModal.getCategoriesArticles();
                                _viewModal.isLoading = false;
                              })
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(),
                      ),
                    ],
                  ),)).toList(),

                ),
              ),
            ),
          ],
        ),);
    });
  }
}