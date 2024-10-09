import 'package:flutter/material.dart';
import 'package:islamic_app/core/routes_manager.dart';
import 'package:islamic_app/presentation/screens/home/tabs/hadeth_tab/hadeth_tab.dart';

class HadethRow extends StatelessWidget {
  HadethRow({super.key, required this.hadethItem});

  HadethItem hadethItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RouteManager.hadethDetailsRoute,
          arguments: HadethItem(title: hadethItem.title, body: hadethItem.body),
        );
      },
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              hadethItem.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
