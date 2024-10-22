import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:islamic_app/core/assets_manager.dart";
import "package:islamic_app/presentation/screens/home/tabs/hadith_tab/widgets/hadith_header_widget.dart";
import "package:islamic_app/presentation/screens/home/tabs/hadith_tab/widgets/hadith_title_widget.dart";

class HadithTab extends StatefulWidget {
  HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<Hadith> hadithList = [];

  @override
  Widget build(BuildContext context) {
    if (hadithList.isEmpty) readHadithFile(); // non-blocking
    return Container(
      child: Column(
        children: [
          Expanded(
              flex: 1, child: Image.asset(AssetsManager.hadithHeaderImage)),
          const HadithHeaderWidget(),
          Expanded(
            flex: 3,
            child: hadithList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          color: Theme.of(context).dividerColor,
                          thickness: 3,
                          height: 0,
                        ),
                    itemBuilder: (context, index) =>
                        HadithTitleWidget(hadith: hadithList[index]),
                    itemCount: hadithList.length),
          )
        ],
      ),
    );
  }

  String add(String n1, String n2) {
    return n1 + n2; // "1010"
  }

  void readHadithFile() async {
    // 2 sec // 3sec  // 10 sec
    var fileContent =
        await rootBundle.loadString("assets/files/ahadeth.txt"); // blocking
    List<String> hadithItemList = fileContent.trim().split("#"); // 50 hadith

    for (int i = 0; i < hadithItemList.length; i++) {
      String hadithItem = hadithItemList[i];
      List<String> hadithLines = hadithItem.trim().split("\n");
      String title = hadithLines[0];
      hadithLines.removeAt(0);
      String content = hadithLines.join("\n");
      Hadith hadith = Hadith(title: title, content: content);
      hadithList.add(hadith);
    }

    setState(() {});

    // String hadithItem = hadithItemList[0];
    // List<String>hadithLines = hadithItem.split("\n");
    // String title = hadithLines[0];
    // hadithLines.removeAt(0);
    // String content = hadithLines.join("\n");
    // print(title);
    // print(content);
  }
}

class Hadith {
  String title;
  String content;

  Hadith({required this.title, required this.content});
}
