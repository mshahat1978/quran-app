import "package:flutter/material.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadithHeaderWidget extends StatelessWidget {
  const HadithHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7),
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal:
                  BorderSide(color: Theme.of(context).dividerColor, width: 2))),
      child: Text(
        AppLocalizations.of(context)!.hadithHeader,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
