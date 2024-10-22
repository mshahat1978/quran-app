import "package:flutter/material.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import "package:islamic_app/core/assets_manager.dart";
import "package:islamic_app/providers/theme_provider.dart";
import "package:provider/provider.dart";

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  List<String> azkar = [
    'سبحان الله',
    'الحمد لله ',
    'الله اكبر',
  ];
  int counter = 0;
  int index = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var localization = AppLocalizations.of(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Center(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(themeProvider.isLightTheme()
                  ? AssetsManager.headOfSebhaLight
                  : AssetsManager.headOfSebhaDark),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.036),
                child: Transform.rotate(
                  angle: angle,
                  child: Image.asset(
                    height: size.height * 0.33,
                    themeProvider.isLightTheme()
                        ? AssetsManager.bodyOfSebhaLight
                        : AssetsManager.bodyOfSebhaDark,
                  ),
                ),
              ),
            ],
          ),
          Text(
            localization!.munber_sebha,
            style: theme.textTheme.headlineMedium!.copyWith(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
            decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(23)),
            child: Text(
              counter.toString(),
              style: theme.textTheme.titleMedium!.copyWith(fontSize: 24),
            ),
          ),
          const Spacer(flex: 2),
          InkWell(
            onTap: onZekerClicked,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              decoration: BoxDecoration(
                color: theme.dividerColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                ' ${azkar[index]}',
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 25,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ),
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }

  onZekerClicked() {
    angle += 0.10;
    if (counter < 33) {
      counter++;
    } else {
      counter = 0;
      index++;
      if (index == azkar.length) {
        index = 0;
      }
    }
    setState(() {});
  }
}
