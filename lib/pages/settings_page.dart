import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:news_app/providers/local_provider.dart';
import 'package:news_app/providers/theam_provider.dart';
import 'package:news_app/shared_preferences/my_preferences.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final Locale deviceLocale = CountryCodes.getDeviceLocale()!;
  List<bool> isExpanded = [
    false,
    false,
  ];
  late String selectedValue;

  String getValue() {
    if (MyPreferences.getLocale() != null) {
      return MyPreferences.getLocale() as String;
    } else {
      return deviceLocale.languageCode;
    }
  }

  @override
  void initState() {
    super.initState();
    selectedValue = getValue();
  }

  @override
  Widget build(BuildContext context) {
    final LocaleProvider _localeProvider = Provider.of<LocaleProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Expanded(
                    child: CircleAvatar(
                  backgroundColor: Color(0xFFF0F0F0),
                  child: Icon(
                    Icons.settings,
                    size: 100,
                    color: Color(0xFFB6B6B6),
                  ),
                  radius: 65,
                )),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Text(
              AppLocalizations.of(context)!.settings,
              style: const TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            const Divider(),
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, _) {
                return ListTile(
                  title: Text(
                    AppLocalizations.of(context)!.darkMode,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  trailing: Switch(
                    value: themeProvider.isDark,
                    onChanged: (value) {
                      themeProvider.toggleTheme(value);
                    },
                  ),
                );
              },
            ),
            const Divider(),
            ExpansionPanelList(
              expansionCallback: (index, isOpen) {
                setState(() {
                  isExpanded[index] = !isOpen;
                });
              },
              children: [
                ExpansionPanel(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  canTapOnHeader: true,
                  headerBuilder: (context, isExpanded) {
                    return const ListTile(
                      title: Text('Change App Language'),
                    );
                  },
                  body: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        RadioListTile<String>(
                          value: 'ar',
                          groupValue: selectedValue,
                          title: const Text('Arabic'),
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                              _localeProvider.setLocale(Locale(value));
                            });
                          },
                        ),
                        RadioListTile<String>(
                          value: 'en',
                          groupValue: selectedValue,
                          title: const Text('English'),
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                              _localeProvider.setLocale(Locale(value));
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  isExpanded: isExpanded[0],
                ),
                // ExpansionPanel(
                //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                //   canTapOnHeader: true,
                //   headerBuilder: (context, isExpanded) {
                //     return const ListTile(
                //       title: Text('Change default country'),
                //     );
                //   },
                //   body: SizedBox(
                //     height: MediaQuery.of(context).size.height * .285,
                //     child: Consumer<CategoriesArticlesViewModal>(
                //         builder: (context, _viewModal, _) {
                //
                //       String selectedValue = _viewModal.countryCode;
                //       var map = _viewModal.map;
                //       return Container(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Column(
                //           children: [
                //             Expanded(
                //               child: Scrollbar(
                //                 interactive: true,
                //                 child: ListView(
                //                   padding: EdgeInsets.zero,
                //                   children: map.entries.map((e) => SizedBox(
                //                     child: Column(
                //                       children: [
                //                         InkWell(
                //                           onTap: () async {
                //                             _viewModal.setCountryCode(e.value);
                //                             _viewModal.setCountryName(e.value);
                //                             MyPreferences.setCountryCode(e.value);
                //                             await _viewModal.getCategoriesArticles();
                //                             },
                //                           child: Padding(
                //                             padding:
                //                             const EdgeInsets.all(8.0),
                //                             child: Row(
                //                               mainAxisAlignment:
                //                               MainAxisAlignment.spaceBetween,
                //                               children: [
                //                                 Row(
                //                                   children: [
                //                                     SvgPicture.asset(
                //                                       Constants.codeAndImage[e.value] as String,
                //                                       height: 55,
                //                                       width: 55,
                //                                       fit: BoxFit.fill,
                //                                     ),
                //                                     const SizedBox(width: 50.0,),
                //                                     Container(
                //                                       padding: const EdgeInsets.all(8.0),
                //                                       child: Text(e.key, style: const TextStyle(fontSize: 20.0),
                //                                       ),
                //                                     )
                //                                   ],
                //                                 ),
                //                                 Radio<String>(
                //                                   value: e.value,
                //                                   activeColor:
                //                                   Theme.of(context).colorScheme.secondary,
                //                                   groupValue: selectedValue,
                //                                   onChanged: (value) async {
                //                                     _viewModal.setCountryCode(e.value);
                //                                     _viewModal.setCountryName(e.value);
                //                                     MyPreferences.setCountryCode(e.value);
                //                                     await _viewModal.getCategoriesArticles();
                //                                         },
                //                                       ),
                //                                     ],
                //                                   ),
                //                                 ),
                //                               ),
                //                               const Padding(
                //                                 padding: EdgeInsets.symmetric(
                //                                     horizontal: 8.0),
                //                                 child: Divider(),
                //                               ),
                //                             ],
                //                           ),
                //                         ),
                //                       )
                //                       .toList(),
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       );
                //     }),
                //   ),
                //   isExpanded: isExpanded[1],
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
