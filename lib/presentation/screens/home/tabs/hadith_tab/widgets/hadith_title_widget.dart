import "package:flutter/material.dart";
import "package:islamic_app/core/routes_manager.dart";
import "package:islamic_app/presentation/screens/home/tabs/hadith_tab/hadith_tab.dart";

class HadithTitleWidget extends StatelessWidget {
  Hadith hadith;

  HadithTitleWidget({super.key, required this.hadith});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutesManager.hadithDetailsRoute,
          arguments: hadith,
        );
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
        child: Text(
          hadith.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
