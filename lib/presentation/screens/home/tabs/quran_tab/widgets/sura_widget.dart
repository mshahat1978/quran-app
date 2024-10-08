import 'package:flutter/material.dart';
import 'package:islamic_app/core/routes_manager.dart';

class SuraWidget extends StatelessWidget {
  SuraWidget(
      {super.key,
      required this.suraName,
      required this.suraVurse,
      required this.listIndex});

  String suraName;
  String suraVurse;
  int listIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RouteManager.quranDetailsRoute,
          arguments: SuraItemObj(
            suraName: suraName,
            suraVurse: suraVurse,
            Index: listIndex,
          ),
        );
      },
      child: IntrinsicHeight(
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Expanded(
              child: Text(
                suraName,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Container(
              color: Theme.of(context).dividerColor,
              width: 2,
            ),
            Expanded(
                child: Text(
              suraVurse,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ))
          ],
        ),
      ),
    );
  }
}

class SuraItemObj {
  String suraName;
  String suraVurse;
  int Index;

  SuraItemObj({
    required this.suraName,
    required this.suraVurse,
    required this.Index,
  });
}
