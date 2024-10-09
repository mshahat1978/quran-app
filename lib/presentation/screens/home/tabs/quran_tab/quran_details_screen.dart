import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/core/assets_manager.dart';
import 'package:islamic_app/presentation/screens/home/tabs/quran_tab/widgets/soura_details_widget.dart';

import 'widgets/sura_widget.dart';

class QuranDetailsScreen extends StatefulWidget {
  QuranDetailsScreen({super.key});

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  List virsesList = [];

  @override
  Widget build(BuildContext context) {
    SuraItemObj suraItemObj =
        ModalRoute.of(context)?.settings.arguments as SuraItemObj;
    // Map argList = ModalRoute.of(context)?.settings.arguments as Map;
    if (virsesList.isEmpty) readQuranFile(suraItemObj.Index);
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
            title: Text(suraItemObj.suraName),
          ),
          body: virsesList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ))
              : ListView.builder(
                  itemBuilder: (context, index) => SuraDetailsWidget(
                      verses: virsesList[index], index: index),
                  itemCount: virsesList.length),
        ),
      ],
    );
  }

  void readQuranFile(int index) async {
    String result =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    virsesList = result.trim().split('\n');
    setState(() {
      virsesList = result.trim().split('\n');
    });
  }

  void readQuranFileV2(int index) {
    rootBundle
        .loadString('assets/files/${index + 1}.txt')
        .then((value) => {virsesList = value.trim().split('\n')});

    setState(() {});
  }
}
