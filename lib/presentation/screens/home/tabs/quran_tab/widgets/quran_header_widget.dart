import 'package:flutter/material.dart';
import 'package:islamic_app/core/string_manager.dart';

class QuranHeaderWidget extends StatelessWidget {
  const QuranHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 2,
          ),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Expanded(
              child: Text(
                StringManager.chapterName,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Container(
              color: Theme.of(context).dividerColor,
              width: 2,
            ),
            Expanded(
                child: Text(
              StringManager.verseNumber,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ))
          ],
        ),
      ),
    );
  }
}
