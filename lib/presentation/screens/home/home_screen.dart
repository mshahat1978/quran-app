import 'package:flutter/material.dart';
import 'package:islamic_app/core/assets_manager.dart';
import 'package:islamic_app/core/color_manager.dart';
import 'package:islamic_app/core/string_manager.dart';
import 'package:islamic_app/presentation/screens/home/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islamic_app/presentation/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islamic_app/presentation/screens/home/tabs/radio_tab/radio_tab.dart';
import 'package:islamic_app/presentation/screens/home/tabs/sebha_tab/sebha_tab.dart';
import 'package:islamic_app/presentation/screens/home/tabs/settings_tab/setting_tab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tabIndex = 0;
  List<Widget> tabList = [
    QuranTab(),
    const HadethTab(),
    const SebhaTab(),
    const RadioTab(),
    const SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          AssetsManager.mainBgLight,
        ),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(StringManager.appTitle),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                backgroundColor: ColorManger.goldColor,
                icon: ImageIcon(AssetImage(AssetsManager.quranIcon)),
                label: StringManager.quranLabel),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AssetsManager.hadethIcon)),
                label: StringManager.hadethLabel),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AssetsManager.sebhaIcon)),
                label: StringManager.sebhaLabel),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AssetsManager.radioIcon)),
                label: StringManager.radioLabel),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: StringManager.settingLabel),
          ],
          onTap: (index) {
            tabIndex = index;
            setState(() {});
          },
          currentIndex: tabIndex,
        ),
        body: tabList[tabIndex],
      ),
    );
  }
}
