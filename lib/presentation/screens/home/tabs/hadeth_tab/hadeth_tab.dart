import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/core/assets_manager.dart';
import 'package:islamic_app/presentation/screens/home/tabs/hadeth_tab/widgets/hadeth_row.dart';

class HadethTab extends StatefulWidget {
  HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethItem> listHadethItem = [];

  @override
  Widget build(BuildContext context) {
    if (listHadethItem.isEmpty) readHadethFile();
    return Container(
      child: Column(
        children: [
          Image.asset(
            AssetsManager.hadethLogo,
            height: 130,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  width: 3,
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            width: double.infinity,
            height: 50,
            child: Text(
              'Al-Ahadeth',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Expanded(
            child: Center(
              child: ListView.separated(
                  itemBuilder: (context, index) => listHadethItem.isEmpty
                      ? CircularProgressIndicator()
                      : HadethRow(hadethItem: listHadethItem[index]),
                  separatorBuilder: (context, index) => Divider(
                        color: Theme.of(context).dividerColor,
                        height: 1,
                        thickness: 1,
                        endIndent: 10,
                        indent: 10,
                      ),
                  itemCount: listHadethItem.length),
            ),
          )
        ],
      ),
    );
  }

  void readHadethFile() async {
    String result = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> listHadeth = result.trim().split('#');

    for (int i = 0; i < listHadeth.length; i++) {
      List<String> temp = listHadeth[i].trim().split('\n');
      String title = temp[0];

      temp.removeAt(0);
      String body = temp.join('\n');

      listHadethItem.add(HadethItem(title: title, body: body));
    }

    setState(() {});
  }
}

class HadethItem {
  String title;
  String body;

  HadethItem({required this.title, required this.body});
}
