import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({Key? key,required this.controller}) : super(key: key);
  final TabController controller;
  @override
  Widget build(BuildContext context) {
    final categories = [
      AppLocalizations.of(context)!.general,
      AppLocalizations.of(context)!.health,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.science,
      AppLocalizations.of(context)!.technology,
      AppLocalizations.of(context)!.entertainment,
      AppLocalizations.of(context)!.business,
    ];
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: Theme.of(context).colorScheme.secondary,
      isScrollable: true,
      unselectedLabelColor: const Color(0xFFC5C5C5),
      unselectedLabelStyle:
      const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
      labelStyle:
      const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
      labelColor: Colors.black,
      controller: controller,
      tabs: [
        for (final tab in categories)
          Tab(
            text: tab,
          )
      ],
    );
  }
}
