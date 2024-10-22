import "package:flutter/material.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                myProvider.changeAppTheme(ThemeMode.light);
              },
              child: myProvider.currentTheme == ThemeMode.light
                  ? buildSelectedItemThemeWidget(
                      AppLocalizations.of(context)!.light)
                  : buildUnSelectedItemThemeWidget(
                      AppLocalizations.of(context)!.light)),
          const SizedBox(
            height: 8,
          ),
          InkWell(
              onTap: () {
                myProvider.changeAppTheme(ThemeMode.dark);
              },
              child: myProvider.currentTheme == ThemeMode.dark
                  ? buildSelectedItemThemeWidget(
                      AppLocalizations.of(context)!.dark)
                  : buildUnSelectedItemThemeWidget(
                      AppLocalizations.of(context)!.dark)),
        ],
      ),
    );
  }

  Widget buildSelectedItemThemeWidget(String selectedTheme) {
    return Row(
      children: [
        Text(selectedTheme, style: Theme.of(context).textTheme.displayMedium),
        const Spacer(),
        const Icon(
          Icons.check,
          size: 28,
        )
      ],
    );
  }

  Widget buildUnSelectedItemThemeWidget(String unSelectedTheme) {
    return Row(
      children: [
        Text(unSelectedTheme,
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(color: Theme.of(context).colorScheme.secondary)),
      ],
    );
  }
}
