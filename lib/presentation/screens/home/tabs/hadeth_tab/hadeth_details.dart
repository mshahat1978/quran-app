import 'package:flutter/material.dart';
import 'package:islamic_app/core/assets_manager.dart';
import 'package:islamic_app/core/color_manager.dart';
import 'package:islamic_app/presentation/screens/home/tabs/hadeth_tab/hadeth_tab.dart';

class HadethDetailsScreen extends StatelessWidget {
  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HadethItem selectedHadethItem =
        ModalRoute.of(context)?.settings.arguments as HadethItem;
    return Stack(
      children: [
        Image.asset(
          AssetsManager.mainBgLight,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text('Islamc'),
          ),
          body: (selectedHadethItem == null)
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : Card(
                  color: ColorManger.goldColor,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          selectedHadethItem.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Divider(
                          height: 10,
                          thickness: 3,
                          color: ColorManger.goldColor,
                          endIndent: 20,
                          indent: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            textDirection: TextDirection.rtl,
                            selectedHadethItem.body,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
