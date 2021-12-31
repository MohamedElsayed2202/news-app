import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/pages/news_screens.dart';
import 'package:news_app/pages/onboarding_page.dart';
import 'package:news_app/providers/local_provider.dart';
import 'package:news_app/shared_preferences/my_preferences.dart';
import 'package:news_app/view_model/categories_articles_view_modal.dart';
import 'package:news_app/providers/theam_provider.dart';
import 'package:news_app/view_model/search_articles_view_modal.dart';
import 'package:news_app/view_model/top_headlines_view_modal.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'l10n/l10n.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await MyPreferences.init();
  await CountryCodes.init();
  bool? seen = MyPreferences.getSeen()??false;
  await MyPreferences.setSeen(true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final Locale deviceLocale = CountryCodes.getDeviceLocale()!;
    CountryDetails details = CountryCodes.detailsForLocale();
    final langCode = deviceLocale.languageCode;
    final countryCode = deviceLocale.countryCode!.toLowerCase();
    final countryName = details.name;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LocaleProvider>(create: (_) => LocaleProvider(locale: Locale(langCode))),
        ChangeNotifierProvider<CategoriesArticlesViewModal>(create: (_) => CategoriesArticlesViewModal(countryCode: countryCode,countryName: countryName)),
        ChangeNotifierProvider<TopHeadLinesViewModal>(create: (_)=>TopHeadLinesViewModal(country: countryCode)),
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<SearchArticlesViewModal>(create: (_) => SearchArticlesViewModal())
      ],
      builder: (context,_){
        final bool? seen = MyPreferences.getSeen();
        final themeProvider = Provider.of<ThemeProvider>(context);
        final localeProvider = Provider.of<LocaleProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          title: 'Newly',
          darkTheme: MyThemes.darkTheme,
          theme: ThemeData(
            primaryColor: const Color(0xFFbdbdbd),
            primaryColorDark: const Color(0xFF8d8d8d),
            primaryColorLight: const Color(0xffefefef),
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(secondary: const Color(0xFF546e7a)),
            scaffoldBackgroundColor: const Color(0xFFE1E2E1),
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          locale: localeProvider.chosedLocale,
          supportedLocales: L10n.all,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          home: seen! ? const NewsScreen() : const OnBoardingPage(),
        );
      },
    );
  }
}




